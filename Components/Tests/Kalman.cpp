#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

namespace Kalman {

int main() {
    void *in_map = (void*)maps::map_by_fd(3), *out_map = (void*)maps::map_by_fd(4);
    const int N_SAMPLES = 7;

    // Scalar Kalman filter: state x (e.g. a single-axis position/attitude
    // estimate) and its estimate covariance p, carried across steps.
    float x = 0.0f;           // initial state estimate (no prior)
    float p = 1000.0f;        // initial estimate covariance (low confidence)
    const float q = 0.01f;    // process noise covariance
    const float r = 0.5f;     // measurement noise covariance

    for (int i = 0; i < N_SAMPLES; i++) {
        void *result = maps::bpf_map_lookup_elem(in_map, &i);
        float z = *((float *)result);

        // Predict
        float p_pred = p + q;

        // Update: Kalman gain, then correct state and covariance estimate
        float k = p_pred / (p_pred + r);
        x = x + k * (z - x);
        p = (1.0f - k) * p_pred;

        maps::bpf_map_update_elem(out_map, &i, &x, 0);
    }

    return 0;
}

} // namespace Kalman

} // namespace Components
