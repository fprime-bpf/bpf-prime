module Components {
    @ Component for F Prime FSW framework.
    active component WasmSequencer {

        @ Load and compile a sequence
        async command LOAD_SEQUENCE(
            sequenceFilePath: string
        )

        @ Runs a sequence
        async command RUN_SEQUENCE()

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