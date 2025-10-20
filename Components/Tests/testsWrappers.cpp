#include "Components/Tests/Tests.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

F64 Tests::get_benchmark_native(BENCHMARK_TEST test) {
    // TODO:
}

F64 BpfSequencer::get_benchmark_vm(BENCHMARK_TEST test, bool compile) {
    // TODO:
}
    
Fw::Success Tests::benchmark() {
    // TODO:
}

Fw::Success Tests::populate_map_random(U32 fd, U32 start, U32 length) {

    auto map = reinterpret_cast<Components::map*>(maps::map_by_fd(fd));
    if (!map) {
        Fw::LogStringArg errMsg(("Could not find map with fd " + std::to_string(fd)).c_str());
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        return Fw::Success::FAILURE;
    }

    const auto max_key_size = sizeof(size_t);
    if (map->key_size > max_key_size) {
        Fw::LogStringArg errMsg(("Map keys may not be greater than " + std::to_string(max_key_size) + " bytes").c_str());
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        return Fw::Success::FAILURE;
    }
    if (map->max_entries < start + length) {
        Fw::LogStringArg errMsg("Requested range exceeds map bounds");
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        return Fw::Success::FAILURE;
    }
    
    const size_t totalBytes = map->value_size * length;
    U8 values[totalBytes];

    std::independent_bits_engine<std::mt19937, CHAR_BIT, U8> engine(std::random_device{}());
    
    std::generate(values, values + totalBytes, std::ref(engine));

    for (size_t i = 0; i < length; ++i) {
        size_t key = start + i;
        U8 *value = &values[i * map->value_size];
        map->update_elem(&key, value, 0);
    }

    return Fw::Success::SUCCESS;
}

}
