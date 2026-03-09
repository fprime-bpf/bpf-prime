// ======================================================================
// \title  Main.cpp
// \brief main program for the F' application. Intended for CLI-based systems (Linux, macOS)
//
// ======================================================================
// Used to access topology functions
#include <BPFPrimeTest/Top/BPFPrimeTestTopology.hpp>
// OSAL initialization
#include <Os/Os.hpp>
#include <Svc/CmdSequencer/CmdSequencerImpl.hpp>
#include <Fw/Types/String.hpp>

// Used for signal handling shutdown
#include <signal.h>
// Used for command line argument processing
#include <getopt.h>
// Used for printf functions
#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <sched.h>
#include <unistd.h>

namespace BPFPrimeTest {
    extern Svc::CmdSequencerComponentImpl cmdSeq;
}

/**
 * \brief print command line help message
 *
 * This will print a command line help message including the available command line arguments.
 *
 * @param app: name of application
 */
void print_usage(const char* app) {
    (void)printf("Usage: ./%s [options]\n-a\thostname/IP address\n-p\tport_number\n", app);
}

/**
 * \brief shutdown topology cycling on signal
 *
 * The reference topology allows for a simulated cycling of the rate groups. This simulated cycling needs to be stopped
 * in order for the program to shutdown. This is done via handling signals such that it is performed via Ctrl-C
 *
 * @param signum
 */
static void signalHandler(int signum) {
    BPFPrimeTest::stopRateGroups();
}

/**
 * \brief execute the program
 *
 * This F´ program is designed to run in standard environments (e.g. Linux/macOs running on a laptop). Thus it uses
 * command line inputs to specify how to connect.
 *
 * @param argc: argument count supplied to program
 * @param argv: argument values supplied to program
 * @return: 0 on success, something else on failure
 */
int main(int argc, char* argv[]) {
    I32 option = 0;
    CHAR* hostname = nullptr, *seq_file = nullptr;
    U16 port_number = 0;

    Os::init();

    // Loop while reading the getopt supplied options
    while ((option = getopt(argc, argv, "hp:a:s:")) != -1) {
        switch (option) {
            // Handle the -a argument for address/hostname
            case 'a':
                hostname = optarg;
                break;
            // Handle the -p port number argument
            case 'p':
                port_number = static_cast<U16>(atoi(optarg));
                break;
            // Handle the -s argument for an input sequence
            case 's':
                seq_file = optarg;
                break;
            // Cascade intended: help output
            case 'h':
            // Cascade intended: help output
            case '?':
            // Default case: output help and exit
            default:
                print_usage(argv[0]);
                return (option == 'h') ? 0 : 1;
        }
    }
    // Object for communicating state to the topology
    BPFPrimeTest::TopologyState inputs;
    inputs.hostname = hostname;
    inputs.port = port_number;

    // Setup program shutdown via Ctrl-C
    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);
    (void)printf("Hit Ctrl-C to quit\n");

    // Setup, cycle, and teardown topology
    BPFPrimeTest::setupTopology(inputs);

    cpu_set_t cpuset;
    CPU_ZERO(&cpuset);
    CPU_SET(0, &cpuset);
    CPU_SET(1, &cpuset);
    CPU_SET(2, &cpuset);
    sched_setaffinity(getpid(), sizeof(cpu_set_t), &cpuset);

    // Trigger the sequence if the user provided one via '-s'
    if (seq_file != nullptr) {
        Fw::String seqFwStr(seq_file);
        printf("[INIT] Triggering auto-sequence: %s\n", seq_file);
        
        // Invoke the sequencer. 
        // Note: 'cmdSeq' is the default name. If your topology uses a namespace, 
        // it might be something like 'MyDeploy::cmdSeq' or 'state.cmdSeq'.
        cmdSeq.get_seqRunIn_InputPort(0)->invoke(seqFwStr);
    }

    BPFPrimeTest::startRateGroups(Fw::TimeInterval(0, 1000));  // Program loop cycling rate groups at 1kHz
    BPFPrimeTest::teardownTopology(inputs);
    (void)printf("Exiting...\n");
    return 0;
}
