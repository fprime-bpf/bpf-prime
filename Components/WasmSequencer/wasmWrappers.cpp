#include "Components/WasmSequencer/WasmSequencer.hpp"
#include <wasm.h>
#include <wasmtime.h>

namespace Components {

Fw::Success WasmSequencer::load(const char* sequenceFilePath) {
    return Fw::Success::SUCCESS;
}

Fw::Success WasmSequencer::run() {
    return Fw::Success::SUCCESS;
}

}  // namespace Components
