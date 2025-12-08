module Components {

    enum BENCHMARK_TEST {
        LOW_PASS_FILTER,
        KALMAN,
        MATMUL,
        STAR_TRACKER
    }

    port RunNativeBenchmark(test: BENCHMARK_TEST) -> F64
    port RunVmBenchmark(test: BENCHMARK_TEST, compile: bool) -> F64
    
}
