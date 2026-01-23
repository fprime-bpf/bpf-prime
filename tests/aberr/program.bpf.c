#include "../bpf_shim.h"

#define C_LIGHT 299792458.0f
#define ITER 1000000
#define PI    3.14159265359f

inline float sqroot(float s) { 
    float r = s / 2;
    if (s <= 0)
        return 0;

    int i = * (int *) &s;
    i = 0x5f3759df - ( i >> 1 );
    s = * (float *) &i;
    r = s * (1.5f - r * s * s);

    return 1.0f / r;
}

inline float sine(float rad) {
    float step = 0.125f * PI, v1 = 0.0f, v2 = 0.38268343f, frac, offset = rad;

    if (rad < 0.0f)
        rad = rad + 2.0f * PI;
    if (rad >= 2.0f * PI)
        rad = rad - 2.0f * PI;

    offset = (rad >= step) ? (rad - step) : offset;
    v1 = (rad >= step) ? 0.38268343f : v1;
    v2 = (rad >= step) ? 0.70710678f : v2;
    
    offset = (rad >= 2.0f * step) ? (rad - 2.0f * step) : offset;
    v1 = (rad >= 2.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 2.0f * step) ? 0.92387953f : v2;
    
    offset = (rad >= 3.0f * step) ? (rad - 3.0f * step) : offset;
    v1 = (rad >= 3.0f * step) ? 0.92387953f : v1;
    v2 = (rad >= 3.0f * step) ? 1.0f : v2;
    
    offset = (rad >= 4.0f * step) ? (rad - 4.0f * step) : offset;
    v1 = (rad >= 4.0f * step) ? 1.0f : v1;
    v2 = (rad >= 4.0f * step) ? 0.92387953f : v2;
    
    offset = (rad >= 5.0f * step) ? (rad - 5.0f * step) : offset;
    v1 = (rad >= 5.0f * step) ? 0.92387953f : v1;
    v2 = (rad >= 5.0f * step) ? 0.70710678f : v2;
    
    offset = (rad >= 6.0f * step) ? (rad - 6.0f * step) : offset;
    v1 = (rad >= 6.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 6.0f * step) ? 0.38268343f : v2;
    
    offset = (rad >= 7.0f * step) ? (rad - 7.0f * step) : offset;
    v1 = (rad >= 7.0f * step) ? 0.38268343f : v1;
    v2 = (rad >= 7.0f * step) ? 0.0f : v2;
    
    offset = (rad >= 8.0f * step) ? (rad - 8.0f * step) : offset;
    v1 = (rad >= 8.0f * step) ? 0.0f : v1;
    v2 = (rad >= 8.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 9.0f * step) ? (rad - 9.0f * step) : offset;
    v1 = (rad >= 9.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 9.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 10.0f * step) ? (rad - 10.0f * step) : offset;
    v1 = (rad >= 10.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 10.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 11.0f * step) ? (rad - 11.0f * step) : offset;
    v1 = (rad >= 11.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 11.0f * step) ? -1.0f : v2;
    
    offset = (rad >= 12.0f * step) ? (rad - 12.0f * step) : offset;
    v1 = (rad >= 12.0f * step) ? -1.0f : v1;
    v2 = (rad >= 12.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 13.0f * step) ? (rad - 13.0f * step) : offset;
    v1 = (rad >= 13.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 13.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 14.0f * step) ? (rad - 14.0f * step) : offset;
    v1 = (rad >= 14.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 14.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 15.0f * step) ? (rad - 15.0f * step) : offset;
    v1 = (rad >= 15.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 15.0f * step) ? 0.0f : v2;

    frac = offset / step;
    return v1 + frac * (v2 - v1);
}

inline float cosine(float rad) {
    float step = 0.125f * PI, v1 = 1.0f, v2 = 0.92387953f, frac, offset = rad;

    if (rad < 0.0f)
        rad = rad + 2.0f * PI;
    if (rad >= 2.0f * PI)
        rad = rad - 2.0f * PI;

   offset = (rad >= step) ? (rad - step) : offset;
    v1 = (rad >= step) ? 0.92387953f : v1;
    v2 = (rad >= step) ? 0.70710678f : v2;
    
    offset = (rad >= 2.0f * step) ? (rad - 2.0f * step) : offset;
    v1 = (rad >= 2.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 2.0f * step) ? 0.38268343f : v2;
    
    offset = (rad >= 3.0f * step) ? (rad - 3.0f * step) : offset;
    v1 = (rad >= 3.0f * step) ? 0.38268343f : v1;
    v2 = (rad >= 3.0f * step) ? 0.0f : v2;
    
    offset = (rad >= 4.0f * step) ? (rad - 4.0f * step) : offset;
    v1 = (rad >= 4.0f * step) ? 0.0f : v1;
    v2 = (rad >= 4.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 5.0f * step) ? (rad - 5.0f * step) : offset;
    v1 = (rad >= 5.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 5.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 6.0f * step) ? (rad - 6.0f * step) : offset;
    v1 = (rad >= 6.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 6.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 7.0f * step) ? (rad - 7.0f * step) : offset;
    v1 = (rad >= 7.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 7.0f * step) ? -1.0f : v2;
    
    offset = (rad >= 8.0f * step) ? (rad - 8.0f * step) : offset;
    v1 = (rad >= 8.0f * step) ? -1.0f : v1;
    v2 = (rad >= 8.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 9.0f * step) ? (rad - 9.0f * step) : offset;
    v1 = (rad >= 9.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 9.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 10.0f * step) ? (rad - 10.0f * step) : offset;
    v1 = (rad >= 10.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 10.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 11.0f * step) ? (rad - 11.0f * step) : offset;
    v1 = (rad >= 11.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 11.0f * step) ? 0.0f : v2;
    
    offset = (rad >= 12.0f * step) ? (rad - 12.0f * step) : offset;
    v1 = (rad >= 12.0f * step) ? 0.0f : v1;
    v2 = (rad >= 12.0f * step) ? 0.38268343f : v2;
    
    offset = (rad >= 13.0f * step) ? (rad - 13.0f * step) : offset;
    v1 = (rad >= 13.0f * step) ? 0.38268343f : v1;
    v2 = (rad >= 13.0f * step) ? 0.70710678f : v2;
    
    offset = (rad >= 14.0f * step) ? (rad - 14.0f * step) : offset;
    v1 = (rad >= 14.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 14.0f * step) ? 0.92387953f : v2;
    
    offset = (rad >= 15.0f * step) ? (rad - 15.0f * step) : offset;
    v1 = (rad >= 15.0f * step) ? 0.92387953f : v1;
    v2 = (rad >= 15.0f * step) ? 1.0f : v2;
    
    frac = offset / step; 
    return v1 + frac * (v2 - v1);
}

inline float _atan2(float y, float x) {
    long y_bits = *(long *)&y;
    long x_bits = *(long *)&x;
    
    if (x_bits == 0 && y_bits == 0) {
        return 0.0f;
    }

    long abs_y_bits = y_bits & 0x7FFFFFFF;
    long abs_x_bits = x_bits & 0x7FFFFFFF;
    
    float div_result;
    long use_x = (abs_x_bits > abs_y_bits) ? 1 : 0;  // Integer comparison only
    
    if (use_x) {
        div_result = y / x;
    } else {
        div_result = x / y;
    }
    
    float z_squared = div_result * div_result;
    float neg_z_squared = -z_squared;
    
    float term1 = div_result;
    float term2 = term1 * neg_z_squared / 3.0f;
    float term3 = term2 * neg_z_squared / 5.0f;
    float term4 = term3 * neg_z_squared / 7.0f;
    float term5 = term4 * neg_z_squared / 9.0f;
    
    float sum = term1 + term2 + term3 + term4 + term5;
    
    if (use_x == 0) {
        if (y_bits >= 0) {
            sum = 1.5707963f - sum;
        } else {
            sum = -1.5707963f - sum;
        }
        return sum;
    }
    
    if (x_bits < 0) {
        if (y_bits >= 0) {
            sum = sum + PI;
        } else {
            sum = sum - PI;
        }
    }
    
    return sum;
}

int main() {
    void *input_map = MAP_BY_FD(0), *out_map = MAP_BY_FD(2), *res;
    volatile float v[3], v_orig[3], s_obs[3], u_corrected[3];
    float t, a, e, omega, tau, dist, tau_old;
    float beta2, gamma, t_emit, M, E, nu, r, h;
    float s_dot_u, denom, factor, u_corr_mag;
    
    tau = 0.0f;
    
    // Load observer position into v
    for (long i = 0; i < 3; i++) {
        res = bpf_map_lookup_elem(input_map, &i);
        v[i] = *(float *)res;
        v_orig[i] = v[i];
    }
    
    // Load and compute s_obs
    for (long i = 0; i < 3; i++) {
        long j = i + 3;
        res = bpf_map_lookup_elem(input_map, &j);
        s_obs[i] = (*(float *)res) / C_LIGHT;
    }
    
    beta2 = s_obs[0] * s_obs[0] + s_obs[1] * s_obs[1] + s_obs[2] * s_obs[2];
    gamma = 1.0f / sqroot(1.0f - beta2);
    
    t = 4.03f; 
    a = 62.47f;
    e = 0.04f;
    omega = 100.0f;

    for (long iter = 0; iter < ITER; iter++) {
        t_emit = t - tau;
        M = omega * t_emit;
        E = M;
        
        E = M + e * sine(E);
        E = M + e * sine(E);
        E = M + e * sine(E);
        E = M + e * sine(E);
        E = M + e * sine(E);

        nu = 2.0f * _atan2(sqroot(1+e) * sine(E/2), sqroot(1-e) * cosine(E/2));
        r = a * (1 - e * cosine(E));

        float cos_nu = cosine(nu);
        float sin_nu = sine(nu);

        float d0 = r * cos_nu - v_orig[0];
        v[0] = d0; 
        float d1 = r * sin_nu - v_orig[1];
        v[1] = d1;
        float d2 = 0.0f - v_orig[2];
        v[2] = d2;

        dist = sqroot(d0 * d0 + d1 * d1 + d2 * d2);

        // Normalize v (which is diff) to get unit vector
        v[0] /= dist;
        v[1] /= dist;
        v[2] /= dist;
        
        // Aberration correction
        s_dot_u = s_obs[0]*v[0] + s_obs[1]*v[1] + s_obs[2]*v[2];
        denom = gamma * (1.0f + s_dot_u);
        factor = gamma / (1.0f + gamma) * s_dot_u;
        
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
        float result = v_orig[i] + dist * u_corrected[i];
        bpf_map_update_elem(out_map, &i, &result, 0);
    }
    
    return 0;
}
