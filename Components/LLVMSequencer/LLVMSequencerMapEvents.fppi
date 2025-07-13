event MapCommandSuccess(commandName: string) \
    severity diagnostic \
    format "BPF map command '{}' completed successfully"

event MapCommandFailed(commandName: string, errorMsg: string) \
    severity activity high \
    format "BPF map command '{}' failed: {}"

event MapCommandFailedErrno(commandName: string, errorMsg: string, errnoMsg: string) \
    severity activity high \
    format "BPF map command '{}' failed: {} ({})"
