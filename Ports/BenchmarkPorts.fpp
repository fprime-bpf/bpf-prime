module Components {

    enum BENCHMARK_TEST {
        ABERR,
        AES,
        KALMAN,
        LOW_PASS_FILTER,
        MATMUL,
        NCC_SCORE,
        STAR_TRACKER,
        CCSDS,
        REED_SOLOMON,
        CFDP_CHUNK
    }

    port RunBpfBenchmark(test: BENCHMARK_TEST, compile: bool, splitInto: U16) -> F64
    port RunWasmBenchmark(test: BENCHMARK_TEST, compile: bool) -> F64
    
}
