module Components {
    @ Sequencer Module using llvmbpf runtime
    active component BpfSequencer {

        enum SUCCESS {
            SUCCESS
            FAILURE 
        }

        @ Run vm benchmark, return runtime (IN)
        sync input port getVmBenchmark: RunVmBenchmark

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

        @ Port to handle rate groups
        sync input port schedIn: Svc.Sched 

        telemetry ticks: U32

        @ Set a VM to run at a specific rate group frequency
        @ @param vm_id The VM ID (0-63)
        @ @param rate_group_hz The rate group frequency in Hz
        @ @param runtime_ms Expected runtime of the VM in milliseconds (used to calculate deadline)
        sync command SetVMRateGroup(vm_id: U32, rate_group_hz: F32, runtime_ms: F32)
        event RateGroupSet(vm_id: U32, rate_group_hz: F32) severity activity low format "VM {} set to rate group {} hz"
        event SchedInTick() severity activity low format "Tick Received"

        sync command StopRateGroup(vm_id: U32)
        event RateGroupStopped(vm_id: U32) severity activity low format "VM {} rate group stopped"

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
