#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "bpf.hpp"
#include "maps/maps.hpp"

#include <chrono>
#include <cstring>
#include <new>

namespace Components {

U32 BpfSequencer::bpf_iter_num_new(struct bpf_iter_num *it, I32 start, I32 end) noexcept {
    if (start > end) {
        it->fd = 0;
        return -1;
    }

    it->start = start;
    it->end = end;
    it->curr = start - 1;
    it->fd = 1;

    return 0;
}

I32 *BpfSequencer::bpf_iter_num_next(struct bpf_iter_num *it) noexcept {
    if (it->fd != 1)
        return NULL;

    if (it->curr + 1 == it->end)
        return NULL;

    it->curr += 1;
    return &it->curr;
}

void BpfSequencer::bpf_iter_num_destroy(struct bpf_iter_num *it) noexcept {
    it->fd = 2;
}

I32 BpfSequencer::bpf_rand_int(I32 min, I32 max) noexcept {
    return rand() % (max - min + 1) + min;
}

}  // namespace Components
