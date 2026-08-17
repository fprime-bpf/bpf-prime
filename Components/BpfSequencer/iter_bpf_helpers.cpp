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

I32 BpfSequencer::bpf_math_sqrt(I32 elem_bits) noexcept {
    F32 elem = *reinterpret_cast<F32*>(&elem_bits);
    F32 result = std::sqrt(elem);
    return *reinterpret_cast<I32*>(&result);
}

I32 BpfSequencer::bpf_math_sin(I32 elem_bits) noexcept {
    F32 elem = *reinterpret_cast<F32*>(&elem_bits);
    F32 result = std::sin(elem);
    return *reinterpret_cast<I32*>(&result);
}

I32 BpfSequencer::bpf_math_cos(I32 elem_bits) noexcept {
    F32 elem = *reinterpret_cast<F32*>(&elem_bits);
    F32 result = std::cos(elem);
    return *reinterpret_cast<I32*>(&result);
}

I32 BpfSequencer::bpf_math_atan2(I32 x_bits, I32 y_bits) noexcept {
    F32 x = *reinterpret_cast<F32*>(&x_bits);
    F32 y = *reinterpret_cast<F32*>(&y_bits);
    F32 result = std::atan2(x, y);
    return *reinterpret_cast<I32*>(&result);
}


}  // namespace Components
