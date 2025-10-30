module Components {
    @ Sequencer Module using llvmbpf runtime
    active component BpfSequencer {

        enum SUCCESS {
            SUCCESS
            FAILURE 
        }

        ############ Commands ############
        include "BpfSequencerCommands.fppi"
        include "BpfSequencerEvents.fppi"
        include "BpfSequencerMapCommands.fppi"
        include "BpfSequencerMapEvents.fppi"

        # Ports for the Sequencer
        @ output port for commands from the sequencer
        output port cmdOut: Fw.Com

        @ Ping in port - highest priority
        async input port pingIn: Svc.Ping priority 10 assert

        @ Ping out port
        output port pingOut: Svc.Ping 

        @ Port to handle Fast Rate Group 
        sync input port schedInFast: Svc.Sched 

        @Port to handle medium rate group
        sync input port schedInMedium: Svc.Sched

        @Port to handle slow rate group
        sync input port schedInSlow: Svc.Sched

        telemetry ticks: U32

        sync command SetVMRateGroup(vm_id: U32, rate_group_hz: F32)
        event RateGroupSet(vm_id: U32, rate_group_hz: F32) severity activity low format "VM {} set to rate group {} hz"
        event SchedInTick() severity activity low format "Tick Received"

        sync command StopRateGroup(vm_id: U32)
        event RateGroupStopped(vm_id: U32) severity activity low format "VM {} rate group stopped"

        @ Port to handle fast rate group


        

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
