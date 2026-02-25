module Components {
    @ Component for F Prime FSW framework.
    active component WasmSequencer {

        @ Load and compile a sequence
        async command LOAD_SEQUENCE(
            sequenceFilePath: string
        )

        @ Runs a sequence
        async command RUN_SEQUENCE()

        event WasmLoadFailed(
                            filePath: string
                            errMsg: string
                        ) \
        severity activity high \
        format "{} load failed: {}"

        event WasmRunFailed(
                            errMsg: string
                        ) \
        severity activity high \
        format "VM run failed: {}"

        event WasmRegisterFunctionsFailed(
                                        errnoMsg: string
                                    ) \
        severity warning high \
        format "Failed to register BPF functions in VM {} "

        @ Run wasm benchmark, return runtime (IN)
        sync input port getBenchmark: RunWasmBenchmark

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Enables command handling
        import Fw.Command

        @ Enables event handling
        import Fw.Event

        @ Enables telemetry channels handling
        import Fw.Channel

        @ Port to return the value of a parameter
        param get port prmGetOut

        @Port to set the value of a parameter
        param set port prmSetOut

    }
}