#include "Kalman.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"

namespace Components {

namespace Kalman {

inline void predict(float* preds) {
    for (int i = 0; i < 7; i++) {
        if (i != 6)
            preds[i] = preds[i + 1] / 1.5f;
        else
            preds[i] = preds[0] / 1.5f;
    }
}

int main() {
    void *in_map = (void*)maps::map_by_fd(0), *out_map = (void*)maps::map_by_fd(1), *result;
    float ins[7], preds[7];

    // Read in position and attitude
    for (int i = 0; i < 7; i++) {
        result = maps::bpf_map_lookup_elem(in_map, &i);
        ins[i] = *(float*)result;
        preds[i] = ins[i];
    }

    // Get predictions
    predict(preds);

    for (int i = 0; i < 7; i++) {
        // Diff with actual and multiply with factor
        ins[i] = ins[i] - preds[i];
        ins[i] *= 0.05f;

        // Write out estimate to BPF map
        preds[i] = preds[i] - ins[i];
        maps::bpf_map_update_elem(out_map, &i, &preds[i], 0);
    }

    return 0;
}

}  // namespace Kalman

}  // namespace Components
