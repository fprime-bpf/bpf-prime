#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define C_LIGHT 299792458.0f
#define MAX_ITER 5
#define PI    3.14159265359f

inline float sqroot(float s) {
    float r = s / 2;
    if (s <= 0)
        return 0;

    int i = *(int*)&s;
    i = 0x5f3759df - (i >> 1);
    s = *(float*)&i;
    r = s * (1.5f - r * s * s);

    return 1.0f / r;
}

// Branch-free, table-driven piecewise-linear sine/cosine -- replaces the 15-way
// ternary cascade each of these used to have. RISC-V has no hardware FP
// select/cmov, so every `? :` compiled down to a real conditional branch (~339
// across aberr's hot loop on this target, confirmed by disassembly), each one
// data-dependent on the actual angle computed that call -- essentially
// unpredictable, which is expensive on an in-order core like the U54/NOEL-V.
// The bpf target doesn't hit this: its custom FPU extension lowers the same
// ternaries as branchless selects (confirmed via its optimized IR: 472 selects,
// only 24 br), which is what made it several times faster here than native even
// at matched -O3. This gives native/wasm the same branch-free shape by turning
// "which of 16 segments is rad in" into an array index instead of a threshold
// cascade -- SINE_TABLE[k]/COSINE_TABLE[k] are just sin(k*step)/cos(k*step) for
// k = 0..16 (index 16 is the wraparound, equal to index 0).
//
// seg is clamped to [0,15] for safe indexing, but `offset` is deliberately
// computed from the *unclamped* rad: the original cascade never clamped offset
// either, only which v1/v2 pair got used once every threshold had fired. This
// benchmark calls sine/cosine with the raw eccentric anomaly E, which is far
// outside [0, 2*PI) (E ~ omega*t_emit ~ 400 rad), so the single if-based wrap
// below doesn't fully normalize it -- reproducing that exact (if numerically
// odd) fallback behavior keeps native/wasm computing the identical result bpf
// does, rather than silently changing what the benchmark measures.
static const float SINE_TABLE[17] = {
    0.0f, 0.38268343f, 0.70710678f, 0.92387953f, 1.0f, 0.92387953f, 0.70710678f, 0.38268343f,
    0.0f, -0.38268343f, -0.70710678f, -0.92387953f, -1.0f, -0.92387953f, -0.70710678f, -0.38268343f,
    0.0f,
};
static const float COSINE_TABLE[17] = {
    1.0f, 0.92387953f, 0.70710678f, 0.38268343f, 0.0f, -0.38268343f, -0.70710678f, -0.92387953f,
    -1.0f, -0.92387953f, -0.70710678f, -0.38268343f, 0.0f, 0.38268343f, 0.70710678f, 0.92387953f,
    1.0f,
};

static inline int clamp_segment(int seg) {
    unsigned int neg_mask = 0u - (unsigned int)(seg < 0);
    seg &= (int)~neg_mask;
    unsigned int over_mask = 0u - (unsigned int)(seg > 15);
    return (int)(((unsigned int)seg & ~over_mask) | (15u & over_mask));
}

// Branch-free float select via bit-masking (same technique as clamp_segment,
// applied to the float's bit pattern -- same style as sqroot's `*(int*)&s`
// reinterpretation above). Needed for one case the table lookup alone doesn't
// cover: if the first threshold (rad >= step) never fires -- i.e. rad is still
// negative even after the single wrap-adjustment below, which happens for the
// out-of-domain angles this benchmark actually calls sine/cosine with -- the
// original cascade leaves `offset` at its *pre-wrap-adjustment* initial value,
// not the post-wrap `rad`. Reproducing that exactly (rather than "fixing" it)
// is what keeps this bit-for-bit identical to the branchy version.
static inline float select_f(int cond, float a, float b) {
    unsigned int mask = 0u - (unsigned int)(cond != 0);
    unsigned int ai = *(unsigned int*)&a;
    unsigned int bi = *(unsigned int*)&b;
    unsigned int ri = (ai & mask) | (bi & ~mask);
    return *(float*)&ri;
}

inline float sine(float rad) {
    float step = 0.125f * PI;
    float orig_rad = rad;

    if (rad < 0.0f)
        rad = rad + 2.0f * PI;
    if (rad >= 2.0f * PI)
        rad = rad - 2.0f * PI;

    int raw_seg = (int)(rad / step);
    int seg = clamp_segment(raw_seg);
    float offset = select_f(raw_seg >= 1, rad - (float)seg * step, orig_rad);
    float v1 = SINE_TABLE[seg];
    float v2 = SINE_TABLE[seg + 1];
    float frac = offset / step;
    return v1 + frac * (v2 - v1);
}

inline float cosine(float rad) {
    float step = 0.125f * PI;
    float orig_rad = rad;

    if (rad < 0.0f)
        rad = rad + 2.0f * PI;
    if (rad >= 2.0f * PI)
        rad = rad - 2.0f * PI;

    int raw_seg = (int)(rad / step);
    int seg = clamp_segment(raw_seg);
    float offset = select_f(raw_seg >= 1, rad - (float)seg * step, orig_rad);
    float v1 = COSINE_TABLE[seg];
    float v2 = COSINE_TABLE[seg + 1];
    float frac = offset / step;
    return v1 + frac * (v2 - v1);
}

inline float _atan2(float y, float x) {
    long y_bits = *(long*)&y & 0xFFFFFFFF;
    long x_bits = *(long*)&x & 0xFFFFFFFF;

    if (x_bits == 0 && y_bits == 0) {
        return 0.0f;
    }

    long abs_y_bits = y_bits & 0x7FFFFFFF;
    long abs_x_bits = x_bits & 0x7FFFFFFF;

    float div_result;
    int use_x = (abs_x_bits > abs_y_bits) ? 1 : 0;  // Integer comparison only

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


namespace Components {

namespace Aberr {

int main() {
    void *input_map = (void*)maps::map_by_fd(8), *out_map = (void*)maps::map_by_fd(9), *res;
    float v[3], v_orig[3], s_obs[3], u_corrected[3];
    float t, a, e, omega, tau, dist, tau_old;
    float beta2, gamma, t_emit, M, E, nu, r, h;
    float s_dot_u, denom, factor, u_corr_mag;
    
    tau = 0.0f;
    
    // Load observer position into v
    for (long i = 0; i < 3; i++) {
        res = maps::bpf_map_lookup_elem(input_map, &i);
        v[i] = *(float *)res;
        v_orig[i] = v[i];
    }
    
    // Load and compute s_obs
    for (long i = 0; i < 3; i++) {
        long j = i + 3;
        res = maps::bpf_map_lookup_elem(input_map, &j);
        s_obs[i] = (*(float *)res) / C_LIGHT;
    }
    
    beta2 = s_obs[0] * s_obs[0] + s_obs[1] * s_obs[1] + s_obs[2] * s_obs[2];
    gamma = 1.0f / sqroot(1.0f - beta2);
    
    t = 4.03f; 
    a = 62.47f;
    e = 0.04f;
    omega = 100.0f;

    for (long iter = 0; iter < MAX_ITER; iter++) {
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
        maps::bpf_map_update_elem(out_map, &i, &result, 0);
    }
    
    return 0;
}

} // namespace Aberr

} // namespace Components
