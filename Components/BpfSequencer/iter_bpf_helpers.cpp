#include "BpfSequencer.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "bpf.hpp"
#include "maps/maps.hpp"

#include <chrono>
#include <cmath>
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

I64 *BpfSequencer::bpf_iter_num_next(struct bpf_iter_num *it) noexcept {
    if (it->fd != 1)
        return NULL;

    it->curr += 1;

    if (it->curr >= it->end)
        return NULL;

    return &it->curr;
}

void BpfSequencer::bpf_iter_num_destroy(struct bpf_iter_num *it) noexcept {
    it->fd = 2;
}

I32 BpfSequencer::bpf_rand_int(I32 min, I32 max) noexcept {
    return rand() % (max - min + 1) + min;
}

F32 BpfSequencer::bpf_math_sqrt(F32 elem) noexcept {
    return std::sqrt(elem);
}

F32 BpfSequencer::bpf_math_sin(F32 elem) noexcept {
    return std::sin(elem);
}

F32 BpfSequencer::bpf_math_cos(F32 elem) noexcept {
    return std::cos(elem);
}

F32 BpfSequencer::bpf_math_atan2(F32 x, F32 y) noexcept {
    return std::atan2(x, y);
}


}  // namespace Components
