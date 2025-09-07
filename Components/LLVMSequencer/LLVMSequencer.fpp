module Components {
    @ Sequencer Module using llvmbpf runtime
    active component LLVMSequencer {

        #Typedef SUCCESS
        enum SUCCESS {
            SUCCESS
            FAILURE 
        }

        ############ Commands ############
        include "LLVMSequencerCommands.fppi"
        include "LLVMSequencerEvents.fppi"
        include "LLVMSequencerMapCommands.fppi"
        include "LLVMSequencerMapEvents.fppi"

        # Ports for the Sequencer
        @ output port for commands from the sequencer
        output port cmdOut: Fw.Com

        @ responses back from commands from the sequencer
        async input port cmdResponseIn: Fw.CmdResponse priority 5 assert

        @ Ping in port - highest priority
        async input port pingIn: Svc.Ping priority 10 assert

        @ Ping out port
        output port pingOut: Svc.Ping 

        @ Port to check the timers
        async input port checkTimers: Svc.Sched priority 4 assert

        @ Port to write all telemetry
        async input port writeTlm: Svc.Sched priority 1 assert

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
