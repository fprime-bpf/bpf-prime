#include "Components/Tests/Tests.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Kalman.hpp"
#include "LowPassFilter.hpp"
#include "Matmul.hpp"

#include <algorithm>
#include <chrono>
#include <climits>
#include <fstream>
#include <random>
#include <sched.h>
#include <unistd.h>


using timer = std::chrono::high_resolution_clock;
using ms = std::chrono::milliseconds;

#define TIME_NATIVE_TEST(test) \
    test_name = #test; \
    start = timer::now(); \
    exit_status = test::main(); \
    end = timer::now();

namespace Components {

F64 Tests::get_benchmark_native(BENCHMARK_TEST test) {
    timer::time_point start, end;
    const char *test_name;
    volatile I32 exit_status;

    switch (test)
    {
    case BENCHMARK_TEST::LOW_PASS_FILTER:
        TIME_NATIVE_TEST(LowPassFilter);
        break;
    case BENCHMARK_TEST::KALMAN:
        TIME_NATIVE_TEST(Kalman);
        break;
    case BENCHMARK_TEST::MATMUL:
        TIME_NATIVE_TEST(Matmul);
        break;
    default:
        return -1;
    }

    if (exit_status) {
        this->log_WARNING_HI_TestFailed(Fw::LogStringArg(test_name), exit_status);
        return -1;
    }

    return std::chrono::duration<F64, ms::period>(end - start).count();
}

F64 BpfSequencer::get_benchmark_vm(BENCHMARK_TEST test, bool compile) {
    // TODO: Why does recompilation affect benchmark data? Fix.
    if (compile) {
        const char *bytecode_path;

        switch (test)
        {
        case BENCHMARK_TEST::LOW_PASS_FILTER:
            bytecode_path = "tests/low_pass_filter/a.o";
            break;
        case BENCHMARK_TEST::KALMAN:
            bytecode_path = "tests/kalman/a.o";
            break;
        case BENCHMARK_TEST::MATMUL:
            bytecode_path = "tests/matmul/a.o";
            break;
        default:
            return -1;
        }

        auto load_result = this->load(0, bytecode_path);

        if (load_result != Fw::Success::SUCCESS)
            return -1;
    }

    auto& vm = *this->vms[0];

    auto start = timer::now();
    volatile auto run_result = vm.exec(&bpf_mem, bpf_mem_size, res);
    auto end = timer::now();

    if (run_result)
        return -1;

    return std::chrono::duration<F64, ms::period>(end - start).count();
}

Fw::Success Tests::benchmark_test(U32 passes, BENCHMARK_TEST test, const char *test_name, void (*fill_maps)(Tests*)) {

    std::ofstream("BENCHMARK_RESULTS.txt", std::ios::app) << test_name << std::endl;

    for (U32 i = 0; i < passes; ++i) {
        fill_maps(this);
        auto native_time = this->getNativeBenchmark_handler(0, test);
        
        if (native_time < 0) {
            Fw::LogStringArg test_name_arg(test_name);
            this->log_WARNING_LO_FailedBenchmarkTest(test_name_arg, i, native_time);
            return Fw::Success::FAILURE;
        }

        fill_maps(this);
        auto vm_time = this->getVmBenchmark_out(0, test, i == 0);

        if (vm_time < 0) {
            Fw::LogStringArg test_name_arg(test_name);
            this->log_WARNING_LO_FailedBenchmarkTest(test_name_arg, i, vm_time);
            return Fw::Success::FAILURE;
        }
        // TODO: Output benchmark results via file or properly downlink?
        std::ofstream("BENCHMARK_RESULTS.txt", std::ios::app) << "(" << native_time  << ", " << vm_time << ")" << std::endl;
    }

    return Fw::Success::SUCCESS;
}

// Note: Compile the FPrime project with release build when benchmarking
Fw::Success Tests::benchmark() {
    const U32 passes = 10000;

    bpf_map_def map_def {
        .type = BpfSequencer_BPF_MAP_TYPE::BPF_MAP_TYPE_ARRAY,
        .key_size = 4,
        .value_size = 4,
        .max_entries = 100,
        .map_flags = 0
    };
    
    for (U32 fd : {0, 1, 2, 4}) {
        BpfSequencer::maps.create_map(map_def, fd);
    }

    struct sched_param p;
    p.sched_priority = 20;
    sched_setscheduler(getpid(), SCHED_RR, &p);

    struct TestInfo {
        U32 passes;
        BENCHMARK_TEST test;
        const char *test_name;
        void (*fill_maps)(Tests*);
    };
    
    TestInfo tests[] {
        {
            passes,
            BENCHMARK_TEST::LOW_PASS_FILTER,
            "Low Pass Filter",
            [](Tests *tests) {
                tests->populate_map_random(2, 0, 1);
            }
        },
        {
            passes,
            BENCHMARK_TEST::KALMAN,
            "Kalman",
            [](Tests *tests) {
                tests->populate_map_random(0, 0, 7);
            }
        },
        {
            passes,
            BENCHMARK_TEST::MATMUL,
            "Matmul",
            [](Tests *tests) {
                tests->populate_map_random(0, 0, 100);
                tests->populate_map_random(1, 0, 100);
            }
        }
    };

    std::ofstream("BENCHMARK_RESULTS.txt", std::ios::trunc);

    for (const auto& test : tests) {

        auto result = benchmark_test(
            test.passes, 
            test.test, 
            test.test_name, 
            tests->fill_maps
        );

        if (result != Fw::Success::SUCCESS) {
            return Fw::Success::FAILURE;
        }
    }
        
    return Fw::Success::SUCCESS;
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
