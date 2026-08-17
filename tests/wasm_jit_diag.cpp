// Standalone WAMR JIT diagnostic: loads a .wasm file, sets Mode_LLVM_JIT, and
// calls its exported "run" once, so aot_create_comp_context's stdout dump
// (target cpu / cpu features / opt level) and the resolved running mode are
// both visible. Kept out of BPFPrimeTest so this stays a throwaway tool, not
// a change to the deployed test binary's behavior.
#include "wasm_export.h"
#include "Components/BpfSequencer/cpu_cycles.hpp"
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>

namespace {

uint32_t stub_map_lookup_elem(wasm_exec_env_t, uint64_t, uint32_t) {
    return 0;
}
uint32_t stub_map_update_elem(wasm_exec_env_t, uint64_t, uint32_t, uint32_t, uint64_t) {
    return 0;
}
uint32_t stub_map_delete_elem(wasm_exec_env_t, uint64_t, uint32_t) {
    return 0;
}
int32_t stub_rand_int(wasm_exec_env_t, int32_t min, int32_t) {
    return min;
}
uint64_t stub_map_by_fd(wasm_exec_env_t, uint32_t fd) {
    return (uint64_t)fd;
}

}  // namespace

int main(int argc, char** argv) {
    setvbuf(stdout, nullptr, _IOLBF, 0);

    if (argc < 2) {
        fprintf(stderr, "usage: %s <path-to-a.wasm>\n", argv[0]);
        return 1;
    }

    static NativeSymbol bpf_helpers[] = {
        {"bpf_map_lookup_elem", (void*)stub_map_lookup_elem, "(Ii)i", nullptr},
        {"bpf_map_update_elem", (void*)stub_map_update_elem, "(IiiI)i", nullptr},
        {"bpf_map_delete_elem", (void*)stub_map_delete_elem, "(Ii)i", nullptr},
        {"bpf_rand_int", (void*)stub_rand_int, "(ii)i", nullptr},
        {"MAP_BY_FD", (void*)stub_map_by_fd, "(i)I", nullptr},
    };

    if (!wasm_runtime_init()) {
        fprintf(stderr, "wasm_runtime_init failed\n");
        return 1;
    }
    // The runtime-JIT path (create_target_machine_detect_host in aot_llvm.c,
    // the branch actually taken for Mode_LLVM_JIT) only reports its resolved
    // CPU/features via LOG_VERBOSE, not the unconditional os_printf the
    // offline-AOT-file branch uses -- raise the log level so it isn't dropped.
    wasm_runtime_set_log_level(WASM_LOG_LEVEL_VERBOSE);
    if (!wasm_runtime_register_natives("env", bpf_helpers,
                                        sizeof(bpf_helpers) / sizeof(NativeSymbol))) {
        fprintf(stderr, "wasm_runtime_register_natives failed\n");
        return 1;
    }

    FILE* f = fopen(argv[1], "rb");
    if (!f) {
        fprintf(stderr, "cannot open %s\n", argv[1]);
        return 1;
    }
    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);
    uint8_t* buf = new uint8_t[size];
    size_t nread = fread(buf, 1, (size_t)size, f);
    fclose(f);
    if (nread != (size_t)size) {
        fprintf(stderr, "short read on %s\n", argv[1]);
        return 1;
    }

    char error_buf[128];
    wasm_module_t module = wasm_runtime_load(buf, (uint32_t)size, error_buf, sizeof(error_buf));
    if (!module) {
        fprintf(stderr, "wasm_runtime_load failed: %s\n", error_buf);
        return 1;
    }

    wasm_module_inst_t inst = wasm_runtime_instantiate(module, 8192, 8192, error_buf, sizeof(error_buf));
    if (!inst) {
        fprintf(stderr, "wasm_runtime_instantiate failed: %s\n", error_buf);
        return 1;
    }

    bool mode_ok = wasm_runtime_set_running_mode(inst, Mode_LLVM_JIT);
    printf("[wasm_jit_diag] %s: set_running_mode=%d get_running_mode=%d\n",
           argv[1], (int)mode_ok, (int)wasm_runtime_get_running_mode(inst));

    wasm_function_inst_t func = wasm_runtime_lookup_function(inst, "run");
    if (!func) {
        fprintf(stderr, "lookup of exported 'run' failed\n");
        return 1;
    }

    wasm_exec_env_t exec_env = wasm_runtime_create_exec_env(inst, 8192);
    if (!exec_env) {
        fprintf(stderr, "wasm_runtime_create_exec_env failed\n");
        return 1;
    }

    // WasmSequencer::wamr_register_thread() always does this before calling
    // wasm_runtime_call_wasm() -- required per wasm_export.h when the calling
    // thread wasn't created by the runtime itself (true for both this tool's
    // main thread and the real Tests component's thread). Missing this was
    // this tool's bug, not (necessarily) anything about the real benchmark.
    if (!wasm_runtime_init_thread_env()) {
        fprintf(stderr, "wasm_runtime_init_thread_env failed\n");
        return 1;
    }

    // Repeated, rdcycle-timed calls on the already-JIT-compiled function --
    // mirrors the real benchmark's warm-steady-state methodology (skip early
    // passes, look at what survives) on a small scale, so a single run can
    // directly compare e.g. aberr vs nccscore's per-call cost once hot,
    // instead of relying on a single cold call.
    const int reps = (argc >= 3) ? atoi(argv[2]) : 30;
    const int warmup = reps / 5 > 0 ? reps / 5 : 1;
    std::vector<double> times_ns;
    times_ns.reserve(reps);
    bool call_ok = true;
    for (int i = 0; i < reps && call_ok; i++) {
        uint32_t call_argv[1] = {0};
        uint64_t start = get_cpu_cycles();
        call_ok = wasm_runtime_call_wasm(exec_env, func, 0, call_argv);
        uint64_t end = get_cpu_cycles();
        times_ns.push_back(cpu_cycles_to_ns(end - start));
    }
    printf("[wasm_jit_diag] call_wasm=%d\n", (int)call_ok);
    if (!call_ok) {
        fprintf(stderr, "exception: %s\n", wasm_runtime_get_exception(inst));
    }
    printf("[wasm_jit_diag] per-call times (ns), %d reps, first %d marked as warmup:\n",
           reps, warmup);
    for (size_t i = 0; i < times_ns.size(); i++) {
        printf("  [%2zu]%s %.0f\n", i, (int)i < warmup ? " (warmup)" : "", times_ns[i]);
    }
    if ((int)times_ns.size() > warmup) {
        std::vector<double> steady(times_ns.begin() + warmup, times_ns.end());
        std::sort(steady.begin(), steady.end());
        printf("[wasm_jit_diag] steady-state median: %.0f ns, min: %.0f ns, max: %.0f ns\n",
               steady[steady.size() / 2], steady.front(), steady.back());
    }

    wasm_runtime_destroy_exec_env(exec_env);
    wasm_runtime_deinstantiate(inst);
    wasm_runtime_unload(module);
    delete[] buf;
    wasm_runtime_destroy();
    return call_ok ? 0 : 1;
}
