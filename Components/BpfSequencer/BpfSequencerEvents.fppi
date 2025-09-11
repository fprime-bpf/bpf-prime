event CommandLoaded(filePath: string) \ 
    severity diagnostic \
    format "{} load success" 

event CommandLoadFailed(
                          filePath: string
                          errMsg: string
                       ) \
    severity activity high \
    format "{} load failed: {}"

event CommandRun(filePath: string) \
    severity diagnostic \
    format "{} run"

event CommandRunFailed(
                         filePath: string
                         errMsg: string
                      ) \
    severity activity high \
    format "{} run failed: {}"
