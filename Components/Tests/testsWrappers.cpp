#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/WasmSequencer/WasmSequencer.hpp"
#include "Components/Tests/Tests.hpp"
#include "Components/Tests/NativeTests.hpp"

#include <pthread.h>
#include <sched.h>
#include <unistd.h>
#include <algorithm>
#include <chrono>
#include <climits>
#include <fstream>
#include <random>
#include <sstream>

using timer = std::chrono::high_resolution_clock;
using ns = std::chrono::nanoseconds;

#define TIME_NATIVE_TEST(test)  \
    test_name = #test;          \
    start = timer::now();       \
    exit_status = test::main(); \
    end = timer::now();

namespace Components {

F64 Tests::get_benchmark_native(BENCHMARK_TEST test) {
    timer::time_point start, end;
    const char* test_name;
    I32 exit_status;

    switch (test) {
        case BENCHMARK_TEST::ABERR: TIME_NATIVE_TEST(Aberr); break;
        case BENCHMARK_TEST::AES: TIME_NATIVE_TEST(Aes); break;
        case BENCHMARK_TEST::KALMAN: TIME_NATIVE_TEST(Kalman); break;
        case BENCHMARK_TEST::LOW_PASS_FILTER: TIME_NATIVE_TEST(LowPassFilter); break;
        case BENCHMARK_TEST::MATMUL: TIME_NATIVE_TEST(Matmul); break;
        case BENCHMARK_TEST::NCC_SCORE: TIME_NATIVE_TEST(NCCScore); break;
        case BENCHMARK_TEST::STAR_TRACKER: TIME_NATIVE_TEST(StarTracker); break;
        default:
            return -1;
    }

    if (exit_status) {
        this->log_WARNING_HI_TestFailed(Fw::LogStringArg(test_name), exit_status);
        return -1;
    }

    return std::chrono::duration<F64, ns::period>(end - start).count();
}

const char *Tests::get_test_dir(BENCHMARK_TEST test) {
    switch (test) {
        case BENCHMARK_TEST::ABERR: return "tests/aberr/";
        case BENCHMARK_TEST::AES: return "tests/aes/";
        case BENCHMARK_TEST::KALMAN: return "tests/kalman/";
        case BENCHMARK_TEST::LOW_PASS_FILTER: return "tests/low_pass_filter/";
        case BENCHMARK_TEST::MATMUL: return "tests/matmul/";
        case BENCHMARK_TEST::NCC_SCORE: return "tests/nccscore/";
        case BENCHMARK_TEST::STAR_TRACKER: return "tests/startracker/";
        default:
            return "";
    }
}

F64 BpfSequencer::get_benchmark_bpf(BENCHMARK_TEST test, bool compile) {
    timer::time_point start, end;

    if (compile) {
        auto bytecode_path = std::string(Tests::get_test_dir(test)) + "a.o";
        auto load_result = this->load(test, bytecode_path.c_str());

        if (load_result != Fw::Success::SUCCESS)
            return -1;
    }

    auto vm = this->vms[test];

    start = timer::now();
    auto run_result = vm->bpf_vm.exec(&vm->bpf_mem, vm->bpf_mem_size, vm->res);
    end = timer::now();

    if (run_result)
        return -1;

    return std::chrono::duration<F64, ns::period>(end - start).count();
}

F64 WasmSequencer::get_benchmark_wasm(Components::BENCHMARK_TEST test, bool compile) {
    timer::time_point start, end;

    if (compile) {
        auto bytecode_path = std::string(Tests::get_test_dir(test)) + "a.wasm";
        auto load_result = this->load(bytecode_path.c_str());


        if (load_result != Fw::Success::SUCCESS)
            return -1;
    }

    start = timer::now();
    auto run_result = func.value().call(store, {});
    end = timer::now();
    
    if (!run_result)
        return -1;

    return std::chrono::duration<F64, ns::period>(end - start).count();
}

namespace {
const char* const OUTPUT_FILE_NAME = "BENCHMARK_RESULTS.yml";

void create_output_file() {
    std::ofstream(OUTPUT_FILE_NAME, std::ios::trunc);
}
void output_new_test(const char* test_name) {
    std::ofstream(OUTPUT_FILE_NAME, std::ios::app) << test_name << ":\n";
}
void output_test_results(const char *test_name, std::vector<std::tuple<F64, F64, F64>>& test_results) {
    output_new_test(test_name);

    std::ostringstream oss;

    for (auto& [bpf_time, native_time, wasm_time] : test_results) {
        oss << "  - [" 
            << bpf_time
            << ", "
            << native_time 
            << ", "
            << wasm_time
            << "]\n";
    }

    std::ofstream(OUTPUT_FILE_NAME, std::ios::app) << oss.str();
}
}  // namespace

Fw::Success Tests::benchmark_test(U32 passes, BENCHMARK_TEST test, const char* test_name, void (*fill_maps)(Tests*)) {
    std::vector<std::tuple<F64, F64, F64>> test_results;
    test_results.reserve(passes);

    for (U32 i = 0; i < passes; ++i) {
        fill_maps(this);
        auto bpf_time = this->getBpfBenchmark_out(0, test, i == 0);

        if (bpf_time < 0) {
            Fw::LogStringArg test_name_arg(test_name);
            this->log_WARNING_LO_FailedBenchmarkTest(test_name_arg, i, bpf_time);
            return Fw::Success::FAILURE;
        }

        fill_maps(this);
        auto native_time = this->get_benchmark_native(test);

        if (native_time < 0) {
            Fw::LogStringArg test_name_arg(test_name);
            this->log_WARNING_LO_FailedBenchmarkTest(test_name_arg, i, native_time);
            return Fw::Success::FAILURE;
        }
        
        fill_maps(this);
        auto wasm_time = this->getWasmBenchmark_out(0, test, i == 0);

        if (wasm_time < 0) {
            Fw::LogStringArg test_name_arg(test_name);
            this->log_WARNING_LO_FailedBenchmarkTest(test_name_arg, i, wasm_time);
            return Fw::Success::FAILURE;
        }

        test_results.emplace_back(bpf_time, native_time, wasm_time);
    }

    output_test_results(test_name, test_results);
    return Fw::Success::SUCCESS;
}

// Note: For accurate benchmarking results, compile the FPrime project in release mode
Fw::Success Tests::benchmark() {
    const U32 passes = 10000;

    const U32 max_entries[] = { 7, 7, 7, 7, 7, 100, 100, 100, 6, 3, 16, 256, 16, 2500, 25 };

    for (U32 fd = 0; fd < (sizeof(max_entries) / sizeof(max_entries[0])); fd++) {
        bpf_map_def map_def = {
            .type = BpfSequencer_BPF_MAP_TYPE::BPF_MAP_TYPE_ARRAY,
            .key_size = 4,
            .value_size = 4,
            .max_entries = max_entries[fd],
            .map_flags = 0
        };

        BpfSequencer::maps.create_map(map_def, fd);
    }

    struct sched_param p;
    p.sched_priority = 20;
    int rc = pthread_setschedparam(pthread_self(), SCHED_RR, &p);
    if (rc != 0) {
        this->log_WARNING_HI_BenchMarkFailed(
            Fw::LogStringArg(strerror(rc))
        );
        // return Fw::Success::FAILURE;
    }

    struct TestInfo {
        U32 passes;
        BENCHMARK_TEST test;
        const char* test_name;
        void (*fill_maps)(Tests*);
    };

    TestInfo tests[]{
        // TODO:
        // {passes, BENCHMARK_TEST::ABERR, "Aberration", [](Tests* tests) {
        //     tests->populate_map_random(8, 0, 6);
        //     tests->populate_map_random(9, 0, 3);
        // }},

        {passes, BENCHMARK_TEST::AES, "AES", [](Tests* tests) {
            tests->populate_map_random(10, 0, 16);
            tests->populate_map_random(11, 0, 256);
            tests->populate_map_random(12, 0, 16);
        }},

        {passes, BENCHMARK_TEST::KALMAN, "Kalman", [](Tests* tests) {
            tests->populate_map_random(3, 0, 7);
            tests->populate_map_random(4, 0, 7);
        }},

        {passes, BENCHMARK_TEST::LOW_PASS_FILTER, "Low Pass Filter", [](Tests* tests) {
            tests->populate_map_random(2, 0, 2);
            tests->populate_map_random(4, 0, 2);
        }},

        {passes, BENCHMARK_TEST::MATMUL, "Matmul", [](Tests* tests) {
        }},

        {passes, BENCHMARK_TEST::NCC_SCORE, "NCC Score", [](Tests* tests) {
            tests->populate_map_random(13, 0, 2500);
            tests->populate_map_random(14, 0, 25);
        }},

        {passes, BENCHMARK_TEST::STAR_TRACKER, "StarTracker", [](Tests* tests) {
            tests->populate_map_random(0, 0, 7);
            tests->populate_map_random(1, 0, 7);
            tests->populate_map_random(2, 0, 7);
        }}
    };


    create_output_file();

    for (const auto& test : tests) {
        auto result = benchmark_test(test.passes, test.test, test.test_name, tests->fill_maps);

        if (result != Fw::Success::SUCCESS) {
            this->log_WARNING_HI_BenchMarkFailed(Fw::LogStringArg("Benchmark test failed"));
            return Fw::Success::FAILURE;
        }
    }

    return Fw::Success::SUCCESS;
}

Fw::Success Tests::populate_map_random(U32 fd, U32 start, U32 length) {
    auto map = reinterpret_cast<Components::map*>(maps::map_by_fd(fd));
    if (!map) {
        auto errMsg = "Could not find map with fd " + std::to_string(fd);
        this->log_WARNING_LO_FailedToPopulateMap(Fw::LogStringArg(errMsg.c_str()));
        return Fw::Success::FAILURE;
    }

    const auto max_key_size = sizeof(size_t);
    if (map->key_size > max_key_size) {
        auto errMsg = "Map key size too large";
        this->log_WARNING_LO_FailedToPopulateMap(Fw::LogStringArg(errMsg));
        return Fw::Success::FAILURE;
    }

    if (start >= map->max_entries || length > map->max_entries - start) {
        auto errMsg = "Requested range exceeds map bounds";
        this->log_WARNING_LO_FailedToPopulateMap(Fw::LogStringArg(errMsg));
        return Fw::Success::FAILURE;
    }
    
    std::vector<U8> value(map->value_size);
    
    static thread_local
        std::independent_bits_engine<std::mt19937, CHAR_BIT, U8> engine(std::random_device{}());

    for (U32 i = 0; i < length; i++) {
        U32 key = start + i;
        std::generate(value.begin(), value.end(), std::ref(engine));
        map->update_elem(&key, value.data(), 0);
    }

    return Fw::Success::SUCCESS;
}

}  // namespace Components
