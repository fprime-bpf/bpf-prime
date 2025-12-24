event CommandLoaded(filePath: string, vmId: U32) \ 
    severity activity high \
    format "{} load success into VM {}" 

event CommandLoadFailed(
                          filePath: string
                          errMsg: string
                       ) \
    severity activity high \
    format "{} load failed: {}"

event CommandRunSuccessfully(filePath: string, vmId: U32) \
    severity activity low \
    format "{} run successfully in VM {}"

event VmValidateFailed(
                         vmId: U32
                         errMsg: string
                      ) \
    severity activity high \
    format "VM {} validation failed: {}"

event CommandRunSuccess(
                          vmId: U32
                          runtime: F64
                       ) \
    severity activity low \
    format "VM {} run successfully in {} ms"

event CommandRunFailed(
                         vmId: U32
                         errMsg: string
                      ) \
    severity activity high \
    format "VM {} run failed: {}"


event SchedulerQueueFull(vm_id: U32) \ 
    severity warning high \
    format "Scheduler job queue full, dropping job for VM {}"

event SchedulerSlip(tick: U32) \ 
    severity warning high \
    format "Scheduler slip detected at tick {}"