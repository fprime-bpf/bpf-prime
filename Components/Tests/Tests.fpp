module Components {
    @ Component for testing the BpfSequencer
    active component Tests {

        @ Run kalman filter test natively (without an eBPF runtime)
        async command KALMAN()

        @ Run low pass filter test natively
        async command LOW_PASS_FILTER()

        @ Run matmul test natively
        async command MATMUL()

        @ Report failed test
        event TestFailed(
                testName: string,
                exitCode: I32 
            ) \
            severity warning high \
            format "Test '{}' failed! Exit code: {}"

        @ Populate a BPF map with random values. Indended for arraymaps
        async command POPULATE_MAP_RANDOM(
                fd : U32, @< Map file descriptor
                start : U32, @< Starting index
                length : U32 @< Number of entries to write
            )

        @ Report error with POPULATE_MAP_RANDOM command
        event FailedToPopulateMap(errMsg: string) \
            severity warning low \
            format "Failed to populate map: {}"

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Port for sending command registrations
        command reg port cmdRegOut

        @ Port for receiving commands
        command recv port cmdIn

        @ Port for sending command responses
        command resp port cmdResponseOut

        @ Port for sending textual representation of events
        text event port logTextOut

        @ Port for sending events to downlink
        event port logOut

        @ Port for sending telemetry channels to downlink
        telemetry port tlmOut

        @ Port to return the value of a parameter
        param get port prmGetOut

        @Port to set the value of a parameter
        param set port prmSetOut
    }
}
