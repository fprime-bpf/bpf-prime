#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "bpf.hpp"
#include "maps/maps.hpp"

#include <chrono>
#include <cstring>
#include <new>

namespace Components {

struct bpf_iter_num {
    U32 fd;
    U32 start;
    U32 end;
    U32 curr;
};

U32 BpfSequencer::bpf_iter_num_new(struct bpf_iter_num *it, U32 start, U32 end) noexcept {
    if (start < end) {
        it->fd = 0;
        return NULL;
    }

    it->start = start;
    it->end = end;
    it->curr = start - 1;
    it->fd = 1;

    return it->fd;
}

U32 BpfSequencer::bpf_iter_num_next(struct bpf_iter_num *it) noexcept {
    if (it->fd != 1)
        return NULL;

    if (it->curr + 1 == it->end)
        return NULL;

    it->curr += 1;
    return it->curr;
}

void BpfSequencer::bpf_iter_num_destroy(struct bpf_iter_num *it) noexcept {
    it->fd = 2;
}

}  // namespace Components
