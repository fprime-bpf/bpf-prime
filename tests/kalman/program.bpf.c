#include "../bpf_shim.h"

#define N_SAMPLES 7

int main() {
    void *in_map = MAP_BY_FD(3), *out_map = MAP_BY_FD(4), *result;
    struct bpf_iter_num it;
    long long* i;

    // Scalar Kalman filter: state x (e.g. a single-axis position/attitude
    // estimate) and its estimate covariance p, carried across steps.
    float x = 0.0f;           // initial state estimate (no prior)
    float p = 1000.0f;        // initial estimate covariance (low confidence)
    const float q = 0.01f;    // process noise covariance
    const float r = 0.5f;     // measurement noise covariance

    bpf_iter_num_new(&it, 0, N_SAMPLES);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(in_map, i);
        float z = *(float*)result;

        // Predict
        float p_pred = p + q;

        // Update: Kalman gain, then correct state and covariance estimate
        float k = p_pred / (p_pred + r);
        x = x + k * (z - x);
        p = (1.0f - k) * p_pred;

        bpf_map_update_elem(out_map, i, &x, 0);
    }
    bpf_iter_num_destroy(&it);

    return 0;
}
