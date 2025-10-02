event CommandLoaded(filePath: string) \ 
    severity diagnostic \
    format "{} load success" 

event CommandLoadFailed(
                          filePath: string
                          errMsg: string
                       ) \
    severity activity high \
    format "{} load failed: {}"
event CommandRunSuccessfully() \
    severity activity low format "Command Run Successfully"

event CommandRunFailed(
                         filePath: string
                         errMsg: string
                      ) \
    severity activity high \
    format "{} run failed: {}"
