#include "../bpf_shim.h"

#define C_LIGHT 299792458.0f
#define PI 3.14159265359f

// sqroot/sine/cosine/atan2 are now real libm calls via the bpf_math_* helpers
// (tests/bpf_shim.h) instead of the hand-rolled piecewise-linear/ternary-chain
// approximations this file used to have. Those approximations produced ~750
// genuinely data-dependent branches (sine/cosine alone, called 10x per
// Newton-Raphson iteration x5 iterations), which made the runtime-verifier's
// DFS search space combinatorially intractable (OOM). A bpf_math_* call is a
// single BPF CALL instruction with a flat, profile-calibrated cost
// (CALL_9..12 in runtime-verifier's dfs.py/profiles) -- no branches to fork
// on at all. This also matches program.wasm.c and Components/Tests/Aberr.cpp,
// which now call real sinf/cosf/sqrtf/atan2f too, so all three variants
// compute the same values again.
int main() {
    void *input_map = MAP_BY_FD(8), *out_map = MAP_BY_FD(9), *res;
    volatile float v[3], v_orig[3], s_obs[3], u_corrected[3];
    volatile float t, a, e, omega, tau, dist, tau_old;
    volatile float beta2, gamma, t_emit, M, E, nu, r, h;
    volatile float s_dot_u, denom, factor, u_corr_mag;
    long key;

    tau = 0.0f;

    // Load observer position into v
    key = 0;
    res = bpf_map_lookup_elem(input_map, &key);
    v[0] = *(float*)res;
    v_orig[0] = v[0];

    key = 1;
    res = bpf_map_lookup_elem(input_map, &key);
    v[1] = *(float*)res;
    v_orig[1] = v[1];

    key = 2;
    res = bpf_map_lookup_elem(input_map, &key);
    v[2] = *(float*)res;
    v_orig[2] = v[2];

    // Load and compute s_obs
    key = 3;
    res = bpf_map_lookup_elem(input_map, &key);
    s_obs[0] = (*(float*)res) / C_LIGHT;

    key = 4;
    res = bpf_map_lookup_elem(input_map, &key);
    s_obs[1] = (*(float*)res) / C_LIGHT;

    key = 5;
    res = bpf_map_lookup_elem(input_map, &key);
    s_obs[2] = (*(float*)res) / C_LIGHT;

    beta2 = s_obs[0] * s_obs[0] + s_obs[1] * s_obs[1] + s_obs[2] * s_obs[2];
    gamma = 1.0f / bpf_math_sqrt(1.0f - beta2);

    t = 4.03f;
    a = 62.47f;
    e = 0.04f;
    omega = 100.0f;

#define ABERR_ITER_BODY \
    t_emit = t - tau; \
    M = omega * t_emit; \
    E = M; \
    E = M + e * bpf_math_sin(E); \
    E = M + e * bpf_math_sin(E); \
    E = M + e * bpf_math_sin(E); \
    E = M + e * bpf_math_sin(E); \
    E = M + e * bpf_math_sin(E); \
    nu = 2.0f * bpf_math_atan2(bpf_math_sqrt(1 + e) * bpf_math_sin(E / 2), bpf_math_sqrt(1 - e) * bpf_math_cos(E / 2)); \
    r = a * (1 - e * bpf_math_cos(E)); \
    { \
        float cos_nu = bpf_math_cos(nu); \
        float sin_nu = bpf_math_sin(nu); \
        float d0 = r * cos_nu - v_orig[0]; \
        v[0] = d0; \
        float d1 = r * sin_nu - v_orig[1]; \
        v[1] = d1; \
        float d2 = 0.0f - v_orig[2]; \
        v[2] = d2; \
        dist = bpf_math_sqrt(d0 * d0 + d1 * d1 + d2 * d2); \
        v[0] /= dist; \
        v[1] /= dist; \
        v[2] /= dist; \
        s_dot_u = s_obs[0] * v[0] + s_obs[1] * v[1] + s_obs[2] * v[2]; \
        denom = gamma * (1.0f + s_dot_u); \
        factor = gamma / (1.0f + gamma) * s_dot_u; \
        u_corrected[0] = (v[0] + factor * s_obs[0] + s_obs[0]) / denom; \
        u_corrected[1] = (v[1] + factor * s_obs[1] + s_obs[1]) / denom; \
        u_corrected[2] = (v[2] + factor * s_obs[2] + s_obs[2]) / denom; \
        u_corr_mag = bpf_math_sqrt(u_corrected[0] * u_corrected[0] + u_corrected[1] * u_corrected[1] + \
                             u_corrected[2] * u_corrected[2]); \
        u_corrected[0] /= u_corr_mag; \
        u_corrected[1] /= u_corr_mag; \
        u_corrected[2] /= u_corr_mag; \
        tau = dist / C_LIGHT; \
    }

    { ABERR_ITER_BODY } // iteration 0
    { ABERR_ITER_BODY } // iteration 1
    { ABERR_ITER_BODY } // iteration 2
    { ABERR_ITER_BODY } // iteration 3
    { ABERR_ITER_BODY } // iteration 4

#undef ABERR_ITER_BODY

    // Write results
    key = 0;
    {
        float result = v_orig[0] + dist * u_corrected[0];
        bpf_map_update_elem(out_map, &key, &result, 0);
    }
    key = 1;
    {
        float result = v_orig[1] + dist * u_corrected[1];
        bpf_map_update_elem(out_map, &key, &result, 0);
    }
    key = 2;
    {
        float result = v_orig[2] + dist * u_corrected[2];
        bpf_map_update_elem(out_map, &key, &result, 0);
    }

    return 0;
}
