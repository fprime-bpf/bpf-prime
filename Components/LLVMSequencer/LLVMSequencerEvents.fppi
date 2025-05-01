event CommandLoaded(filePath: string) \ 
    severity activity high \
    format "Command Loaded: {}" 

event CommandLoadFailed(filePath: string) \
    severity activity high \
    format "Command Load Failed: {}"

event CommandCompile(filePath: string) \
    severity activity high \
    format "Command Compile: {}"

event CommandCompileFailed(filePath: string) \
    severity activity high \
    format "Command Compile Failed: {}"

event CommandRun(filePath: string) \
    severity activity high \
    format "Command Run: {}"

event CommandRunFailed(filePath: string) \  
    severity activity high \
    format "Command Run Failed: {}"