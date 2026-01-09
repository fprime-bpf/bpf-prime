#include "../bpf_shim.h"

#define C_LIGHT 299792458.0f
#define MAX_ITER 10
#define PI    3.14159265359f
#define TERMS 10

static __attribute__((always_inline)) float sqroot(float s) { 
    float r = s / 2;
    if (s <= 0)
        return 0;

    long i = * (long *) &s;
    i = 0x5f3759df - ( i >> 1 );
    s = * (float *) &i;
    r = s * (1.5f - r * s * s);

    return 1.0f / r;
}

static __attribute__((always_inline)) float power(float base, long exp) {
    if (exp == 0) return 1.0f;
    if (exp == 1) return base;
    
    float result = 1.0f;
    long abs_exp = (exp < 0) ? -exp : exp;
    
    for (long i = 0; i < abs_exp; i++) {
        result *= base;
    }
    
    if (exp < 0) {
        if (base == 0.0f) return 0.0f;
        return 1.0f / result;
    }
    
    return result;
}

static __attribute__((always_inline)) long fact(long n) {
    if (n <= 0) return 1;
    
    long result = 1;
    for (long i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

static __attribute__((always_inline)) float sine(float rad) {
    float sin = 0;

    for(long i = 0; i < TERMS; i++) {
        sin += power(-1, i) * power(rad, 2 * i + 1) / fact(2 * i + 1);
    }
    return sin;
}

static __attribute__((always_inline)) float cosine(float rad) {
    float cos = 0;

    for(long i = 0; i < TERMS; i++) {
        cos += power(-1, i) * power(rad, 2 * i) / fact(2 * i);
    }
    return cos;
}

static __attribute__((always_inline)) float _atan2(float y, float x) {
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
    float v[3], s_obs[3], u_corrected[3];  // Only 3 arrays
    float t, a, e, omega, tau, dist, tau_old;
    float beta2, gamma, t_emit, M, E, nu, r, h;
    float s_dot_u, denom, factor, u_corr_mag;
    
    tau = 0.0;
    
    // Load observer position into v
    for (long i = 0; i < 3; i++) {
        res = bpf_map_lookup_elem(input_map, &i);
        v[i] = *(float *)res;
    }
    
    // Load and compute s_obs
    for (long i = 0; i < 3; i++) {
        long j = i + 3;
        res = bpf_map_lookup_elem(input_map, &j);
        s_obs[i] = (*(float *)res) / C_LIGHT;
    }
    
    beta2 = s_obs[0]*s_obs[0] + s_obs[1]*s_obs[1] + s_obs[2]*s_obs[2];
    gamma = 1.0 / sqroot(1.0 - beta2);
    
    // Load orbital params (add these to your map indices 6-9)
    long idx = 6;
    res = bpf_map_lookup_elem(input_map, &idx);
    t = *(float *)res;
    idx = 7;
    res = bpf_map_lookup_elem(input_map, &idx);
    a = *(float *)res;
    idx = 8;
    res = bpf_map_lookup_elem(input_map, &idx);
    e = *(float *)res;
    idx = 9;
    res = bpf_map_lookup_elem(input_map, &idx);
    omega = *(float *)res;
    
    for (long iter = 0; iter < MAX_ITER; iter++) {
        t_emit = t - tau;
        M = omega * t_emit;
        E = M;
        
        for (long i = 0; i < 5; i++) {
            E = M + e * sine(E);
        }
        
        nu = 2.0 * _atan2(sqroot(1+e) * sine(E/2), sqroot(1-e) * cosine(E/2));
        r = a * (1 - e * cosine(E));
        
        // Reuse v for target position, then compute diff inline
        // diff = target - obs_pos (but obs_pos is in v, so reload it)
        dist = 0.0;
        for (long i = 0; i < 3; i++) {
            res = bpf_map_lookup_elem(input_map, &i);
            float obs = *(float *)res;
            float targ = (i == 0) ? r * cosine(nu) : ((i == 1) ? r * sine(nu) : 0.0);
            float d = targ - obs;
            dist += d * d;
            v[i] = d;  // Store diff in v
        }
        
        dist = sqroot(dist);
        
        // Normalize v (which is diff) to get unit vector
        v[0] /= dist;
        v[1] /= dist;
        v[2] /= dist;
        
        // Aberration correction
        s_dot_u = s_obs[0]*v[0] + s_obs[1]*v[1] + s_obs[2]*v[2];
        denom = gamma * (1.0 + s_dot_u);
        factor = gamma / (1.0 + gamma) * s_dot_u;
        
        u_corrected[0] = (v[0] + factor*s_obs[0] + s_obs[0]) / denom;
        u_corrected[1] = (v[1] + factor*s_obs[1] + s_obs[1]) / denom;
        u_corrected[2] = (v[2] + factor*s_obs[2] + s_obs[2]) / denom;
        
        u_corr_mag = sqroot(u_corrected[0]*u_corrected[0] + 
                           u_corrected[1]*u_corrected[1] + 
                           u_corrected[2]*u_corrected[2]);
        u_corrected[0] /= u_corr_mag;
        u_corrected[1] /= u_corr_mag;
        u_corrected[2] /= u_corr_mag;
        
        tau = dist / C_LIGHT;
    }
    
    // Write results
    for (long i = 0; i < 3; i++) {
        res = bpf_map_lookup_elem(input_map, &i);
        float result = (*(float *)res) + dist * u_corrected[i];
        bpf_map_update_elem(out_map, &i, &result, 0);
    }
    
    return 0;
}
