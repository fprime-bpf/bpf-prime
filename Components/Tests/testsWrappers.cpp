#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/Tests/Tests.hpp"

#include <pthread.h>
#include <sched.h>
#include <unistd.h>
#include <algorithm>
#include <chrono>
#include <climits>
#include <fstream>
#include <random>

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

F64 BpfSequencer::get_benchmark_vm(BENCHMARK_TEST test, bool compile) {
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

namespace {
const char* const OUTPUT_FILE_NAME = "BENCHMARK_RESULTS.yml";

void create_output_file() {
    std::ofstream(OUTPUT_FILE_NAME, std::ios::trunc);
}
void output_new_test(const char* test_name) {
    std::ofstream(OUTPUT_FILE_NAME, std::ios::app) << test_name << ":\n";
}
void output_pass_times(float bpf_time, float native_time) {
    std::ofstream(OUTPUT_FILE_NAME, std::ios::app) 
        << "  - [" 
        << bpf_time
        << ", "
        << native_time
        << "]\n";
}
}  // namespace

Fw::Success Tests::benchmark_test(U32 passes, BENCHMARK_TEST test, const char* test_name, void (*fill_maps)(Tests*)) {
    output_new_test(test_name);

    for (U32 i = 0; i < passes; ++i) {
        fill_maps(this);
        auto bpf_time = this->getVmBenchmark_out(0, test, i == 0);

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

        output_pass_times(bpf_time, native_time);
    }

    return Fw::Success::SUCCESS;
}

// Note: For accurate benchmarking results, compile the FPrime project in release mode
Fw::Success Tests::benchmark() {
    const U32 passes = 1000;

    bpf_map_def map_def = {
        .type = BpfSequencer_BPF_MAP_TYPE::BPF_MAP_TYPE_ARRAY,
        .key_size = 4,
        .value_size = 4,
        .max_entries = 2500,
        .map_flags = 0
    };
    BpfSequencer::maps.create_map(map_def, 0);

    map_def.max_entries = 256;
    BpfSequencer::maps.create_map(map_def, 1);

    map_def.max_entries = 100;
    BpfSequencer::maps.create_map(map_def, 2);

    map_def.max_entries = 1;
    BpfSequencer::maps.create_map(map_def, 4);

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
        {passes, BENCHMARK_TEST::ABERR, "Aberration", [](Tests* tests) {
            tests->populate_map_random(0, 0, 6);
        }},

        {passes, BENCHMARK_TEST::AES, "AES", [](Tests* tests) {
            tests->populate_map_random(0, 0, 16);
            tests->populate_map_random(1, 0, 256);
        }},

        {passes, BENCHMARK_TEST::KALMAN, "Kalman", [](Tests* tests) {
            tests->populate_map_random(0, 0, 7);
        }},

        {passes, BENCHMARK_TEST::LOW_PASS_FILTER, "Low Pass Filter", [](Tests* tests) {
            tests->populate_map_random(2, 0, 2);
        }},

        {passes, BENCHMARK_TEST::MATMUL, "Matmul", [](Tests* tests) {
            tests->populate_map_random(0, 0, 100);
            tests->populate_map_random(1, 0, 100);
        }},

        {passes, BENCHMARK_TEST::NCC_SCORE, "NCC Score", [](Tests* tests) {
            tests->populate_map_random(0, 0, 2500);
            tests->populate_map_random(1, 0, 25);
        }},

        {passes, BENCHMARK_TEST::STAR_TRACKER, "StarTracker", [](Tests* tests) {
            tests->populate_map_random(0, 0, 4);
            tests->populate_map_random(1, 0, 4);
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
        Fw::LogStringArg errMsg(("Could not find map with fd " + std::to_string(fd)).c_str());
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        return Fw::Success::FAILURE;
    }

    const auto max_key_size = sizeof(size_t);
    if (map->key_size > max_key_size) {
        Fw::LogStringArg errMsg(
            ("Map keys may not be greater than " + std::to_string(max_key_size) + " bytes").c_str());
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
        U8* value = &values[i * map->value_size];
        map->update_elem(&key, value, 0);
    }

    return Fw::Success::SUCCESS;
}

}  // namespace Components
