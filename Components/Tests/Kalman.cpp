#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

namespace Kalman {

int main() {
    void *in_map = (void*)maps::map_by_fd(0), *out_map = (void*)maps::map_by_fd(1), *result;
    BpfSequencer::bpf_iter_num it;
    float ins[7], preds[7];
    int *i;

    // Read in position and attitude
    BpfSequencer::bpf_iter_num_new(&it, 0, 7);
    while ((i = BpfSequencer::bpf_iter_num_next(&it))) {
        result = maps::bpf_map_lookup_elem(in_map, i);
        ins[*i] = *(float *)result;
        preds[*i] = ins[*i];
    }
    BpfSequencer::bpf_iter_num_destroy(&it);

    // Get predictions
    BpfSequencer::bpf_iter_num_new(&it, 0, 7);
    while ((i = BpfSequencer::bpf_iter_num_next(&it))) {
        if (*i != 6)
            preds[*i] = preds[*i + 1] / 1.5f;
        else
            preds[*i] = preds[0] / 1.5f;
    }
    BpfSequencer::bpf_iter_num_destroy(&it);

    BpfSequencer::bpf_iter_num_new(&it, 0, 7);
    while ((i = BpfSequencer::bpf_iter_num_next(&it))) {
        // Diff with actual and multiply with factor
        ins[*i] = ins[*i] - preds[*i];
        ins[*i] *= 0.05f;

        // Write out estimate to BPF map
        preds[*i] = preds[*i] - ins[*i];
        maps::bpf_map_update_elem(out_map, i, &preds[*i], 0);
    }
    BpfSequencer::bpf_iter_num_destroy(&it);

    return 0;
}

} // namespace Kalman

} // namespace Components
