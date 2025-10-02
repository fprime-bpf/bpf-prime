#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "maps/maps.hpp"
#include "bpf.hpp"

#include <cstring>
#include <new>

// Virtual Machine Class Header for BPF bytecode execution
namespace Components {
    class BpfVM {
        public :

            enum State {
                UNINITIALIZED,
                LOADED,
                COMPILED,
                RUNNING,
                ERROR
            };

            enum RateGroup {
                RG_100HZ,
                RG_10HZ,
                RG_1HZ
            };

            BpfVM();
            ~BpfVM();

            Fw::Success set_state(State state);

            State get_state() const;

            Fw::Success set_rate_group(RateGroup rate_group);

            RateGroup get_rate_group() const;

            // Load & Compile BPF bytecode from file
            Fw::Success load(const char* sequenceFilePath);

            // Run the compiled BPF bytecode
            Fw::Success run();

        private :
            bpftime::llvmbpf_vm *vm;
            State state;
            RateGroup rate_group;
            const char* seqeunce_file_path;
    };
}