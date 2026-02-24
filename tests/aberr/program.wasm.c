#include "../wasm_shim.h"
#include <math.h>

#define C_LIGHT 299792458.0f
#define MAX_ITER 5
#define PI    3.14159265359f

int main() {
    uint64_t input_map = MAP_BY_FD(0), out_map = MAP_BY_FD(2);
    uint32_t res;
    float v[3], v_orig[3], s_obs[3], u_corrected[3];
    float t, a, e, omega, tau, dist, tau_old;
    float beta2, gamma, t_emit, M, E, nu, r, h;
    float s_dot_u, denom, factor, u_corr_mag;
    
    tau = 0.0f;
    
    // Load observer position into v
    for (long i = 0; i < 3; i++) {
        res = bpf_map_lookup_elem(input_map, i);
        v[i] = *(float *)res;
        v_orig[i] = v[i];
    }
    
    // Load and compute s_obs
    for (long i = 0; i < 3; i++) {
        long j = i + 3;
        res = bpf_map_lookup_elem(input_map, j);
        s_obs[i] = (*(float *)res) / C_LIGHT;
    }
    
    beta2 = s_obs[0] * s_obs[0] + s_obs[1] * s_obs[1] + s_obs[2] * s_obs[2];
    gamma = 1.0f / sqrt(1.0f - beta2);
    
    t = 4.03f; 
    a = 62.47f;
    e = 0.04f;
    omega = 100.0f;

    for (long iter = 0; iter < MAX_ITER; iter++) {
        t_emit = t - tau;
        M = omega * t_emit;
        E = M;
        
        E = M + e * sin(E);
        E = M + e * sin(E);
        E = M + e * sin(E);
        E = M + e * sin(E);
        E = M + e * sin(E);

        nu = 2.0f * atan2(sqrt(1+e) * sin(E/2), sqrt(1-e) * cos(E/2));
        r = a * (1 - e * cos(E));

        float cos_nu = cos(nu);
        float sin_nu = sin(nu);

        float d0 = r * cos_nu - v_orig[0];
        v[0] = d0; 
        float d1 = r * sin_nu - v_orig[1];
        v[1] = d1;
        float d2 = 0.0f - v_orig[2];
        v[2] = d2;

        dist = sqrt(d0 * d0 + d1 * d1 + d2 * d2);

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
        
        u_corr_mag = sqrt(u_corrected[0]*u_corrected[0] + 
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
        bpf_map_update_elem(out_map, i, result, 0);
    }
    
    return 0;
}
