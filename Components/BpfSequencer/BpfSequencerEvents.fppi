event CommandLoaded(filePath: string, vmId: U32) \ 
    severity activity high \
    format "{} load success into VM {}" 

event CommandLoadFailed(
                          filePath: string
                          errMsg: string
                       ) \
    severity activity high \
    format "{} load failed: {}"

event CommandRunSuccess(
                               vmId: F64
                               runtime: string
                            ) \
    severity activity low \
    format "VM {} run successfully in {} ms"

event CommandRunFailed(
                         filePath: string
                         errMsg: string
                      ) \
    severity activity high \
    format "{} run failed: {}"
