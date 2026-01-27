module Components {

    enum BENCHMARK_TEST {
        LOW_PASS_FILTER,
        KALMAN,
        MATMUL,
        STAR_TRACKER
    }

    port RunVmBenchmark(test: BENCHMARK_TEST, compile: bool) -> F64
    
}
