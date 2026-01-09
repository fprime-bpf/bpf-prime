#include "../bpf_shim.h"

#define C_LIGHT 299792458.0
#define AU_M 1.495978707e11
#define MAX_ITER 10
#define PI    3.14159265359f
#define TERMS 10

inline float sqroot(float s) { 
    float r = s / 2;
    if (s <= 0)
        return 0;

    long i = * (long *) &s;
    i = 0x5f3759df - ( i >> 1 );
    s = * (float *) &i;
    r = s * (1.5f - r * s * s);

    return 1.0f / r;
}

inline float power(float base, long exp) {
    if(exp < 0) {
        if(base == 0)
            return -0; // Error!!
        return 1 / (base * power(base, (-exp) - 1));
    }
    if(exp == 0)
        return 1;
    if(exp == 1)
        return base;
    return base * power(base, exp - 1);
}

inline long fact(long n) {
    return n <= 0 ? 1 : n * fact(n-1);
}

inline float sine(float rad) {
    float sin = 0;

    for(long i = 0; i < TERMS; i++) {
        sin += power(-1, i) * power(rad, 2 * i + 1) / fact(2 * i + 1);
    }
    return sin;
}

inline float cosine(float rad) {
    float cos = 0;

    for(long i = 0; i < TERMS; i++) {
        cos += power(-1, i) * power(rad, 2 * i) / fact(2 * i);
    }
    return cos;
}

inline float _atan2(float y, float x) {
    float abs_y = (y < 0.0f) ? -y : y;
    float abs_x = (x < 0.0f) ? -x : x;
    float angle, z, z2, term;
    
    if (x == 0.0f && y == 0.0f) return 0.0f;
    
    if (abs_x > abs_y) {
        z = y / x;
        z2 = z * z;
        angle = z;
        term = z;
        for (long n = 1; n < 20; n++) {
            term *= -z2;
            angle += term / (2*n + 1);
        }
        if (x < 0.0f) angle += (y >= 0.0f) ? PI : -PI;
    } else {
        z = x / y;
        z2 = z * z;
        angle = z;
        term = z;
        for (long n = 1; n < 20; n++) {
            term *= -z2;
            angle += term / (2*n + 1);
        }
        angle = (y >= 0.0f) ? PI/2.0f - angle : -PI/2.0f - angle;
    }
    
    return angle;
}

int main() {
    void *input_map = MAP_BY_FD(0), *out_map = MAP_BY_FD(2), *res;
    float obs_pos[3], obs_vel[3], result[3], t, a, e, omega;
    float targ_pos[3], targ_vel[3], diff[3], u_corrected[3], s_obs[3], tau = 0.0, dist, tau_old;

    // Fetch star infos from BPF maps
    for (long i = 0; i < 3; i++) {
        res = bpf_map_lookup_elem(input_map, &i);
        obs_pos[i] = *(float *)res;
    }

    for (long i = 0; i < 3; i++) {
        long j = i + 3;
        res = bpf_map_lookup_elem(input_map, &j);
        obs_vel[i] = *(float *)res;
    }
    
    // Observer velocity normalized by c for aberration
    s_obs[0] = obs_vel[0] / C_LIGHT;
    s_obs[1] = obs_vel[1] / C_LIGHT;
    s_obs[2] = obs_vel[2] / C_LIGHT;
    
    float beta2 = s_obs[0]*s_obs[0] + s_obs[1]*s_obs[1] + s_obs[2]*s_obs[2];
    float gamma = 1.0 / sqroot(1.0 - beta2);
    
    for (long iter = 0; iter < MAX_ITER; iter++) {
        // Target state at emission time - Keplerian orbit calculation
        float t_emit = t - tau;
        float M = omega * t_emit;
        float E = M;
        
        // Solve Kepler's equation
        for (long i = 0; i < 5; i++) {
            E = M + e * sine(E);
        }
        
        float nu = 2.0 * _atan2(sqroot(1+e) * sine(E/2), sqroot(1-e) * cosine(E/2));
        float r = a * (1 - e * cosine(E));
        
        targ_pos[0] = r * cosine(nu);
        targ_pos[1] = r * sine(nu);
        targ_pos[2] = 0.0;
        
        // Velocity (simplified)
        float h = sqroot(a * (1 - e*e) * 3.986004418e14);  // GM_sun approximation
        targ_vel[0] = -h/r * sine(nu);
        targ_vel[1] = h/r * (e + cosine(nu));
        targ_vel[2] = 0.0;
        
        // Geometric difference vector
        diff[0] = targ_pos[0] - obs_pos[0];
        diff[1] = targ_pos[1] - obs_pos[1];
        diff[2] = targ_pos[2] - obs_pos[2];
        
        dist = sqroot(diff[0]*diff[0] + diff[1]*diff[1] + diff[2]*diff[2]);
        
        // Unit direction vector
        float u[3];
        u[0] = diff[0] / dist;
        u[1] = diff[1] / dist;
        u[2] = diff[2] / dist;
        
        // Apply relativistic aberration correction
        // Formula: u' = (u + (gamma/(1+gamma))(s·u)s + s) / (gamma(1 + s·u))
        float s_dot_u = s_obs[0]*u[0] + s_obs[1]*u[1] + s_obs[2]*u[2];
        float denom = gamma * (1.0 + s_dot_u);
        float factor = gamma / (1.0 + gamma) * s_dot_u;

        u_corrected[0] = (u[0] + factor*s_obs[0] + s_obs[0]) / denom;
        u_corrected[1] = (u[1] + factor*s_obs[1] + s_obs[1]) / denom;
        u_corrected[2] = (u[2] + factor*s_obs[2] + s_obs[2]) / denom;
        
        // Normalize corrected direction
        float u_corr_mag = sqroot(u_corrected[0] * u_corrected[0] + 
                                  u_corrected[1] * u_corrected[1] + 
                                  u_corrected[2] * u_corrected[2]);
        u_corrected[0] /= u_corr_mag;
        u_corrected[1] /= u_corr_mag;
        u_corrected[2] /= u_corr_mag;
        
        // Update light-time with corrected direction
        tau_old = tau;
        tau = dist / C_LIGHT;
    }
    
    // Return last iteration result if didn't converge
    result[0] = obs_pos[0] + dist * u_corrected[0];
    result[1] = obs_pos[1] + dist * u_corrected[1];
    result[2] = obs_pos[2] + dist * u_corrected[2];

    for (long i = 0; i < 3; i++)
      bpf_map_update_elem(out_map, &i, &result[i], 0);

    return 0;
}
