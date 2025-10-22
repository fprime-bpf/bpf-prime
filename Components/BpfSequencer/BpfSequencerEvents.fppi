event CommandLoaded(filePath: string, vmId: U32) \ 
    severity activity high \
    format "{} load success into VM {}" 

event CommandLoadFailed(
                          filePath: string
                          errMsg: string
                       ) \
    severity activity high \
    format "{} load failed: {}"
event CommandRunSuccessfully(filePath: string, vmId: U32   ) \
    severity activity low format "{} run successfully in VM {}"

event CommandRunFailed(
                         filePath: string
                         errMsg: string
                      ) \
    severity activity high \
    format "{} run failed: {}"
