event CommandLoaded(filePath: string) \ 
    severity activity high \
    format "{} load success" 

event CommandLoadFailed(
                          filePath: string
                          errMsg: string
                       ) \
    severity activity high \
    format "{} load failed: {}"
event CommandRunSuccessfully(filePath: string) \
    severity activity low format "{} run successfully"

event CommandRunFailed(
                         filePath: string
                         errMsg: string
                      ) \
    severity activity high \
    format "{} run failed: {}"
