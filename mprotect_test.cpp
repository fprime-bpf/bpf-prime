#include <sys/mman.h>
#include <cerrno>
#include <cstring>
#include <cstdio>
#include <fstream>
#include <string>
#include <stdint.h>

// Function to read Linux memory maps and find the permissions of our JIT pointer
void check_memory_permissions(void* ptr) {
    unsigned long target_addr = (unsigned long)ptr;
    std::ifstream maps_file("/proc/self/maps");
    std::string line;

    printf("\n--- Checking /proc/self/maps for address: %p ---\n", ptr);

    if (!maps_file.is_open()) {
        printf("[!] Error: Could not open /proc/self/maps\n");
        return;
    }

    while (std::getline(maps_file, line)) {
        unsigned long start, end;
        char perms[5];

        // Parse the start address, end address, and the 4-character permission string
        if (sscanf(line.c_str(), "%lx-%lx %4s", &start, &end, perms) == 3) {
            // Check if our JIT pointer falls inside this memory region
            if (target_addr >= start && target_addr < end) {
                printf("=> FOUND TARGET MEMORY REGION:\n");
                printf("   Address Range: %lx - %lx\n", start, end);
                printf("   Permissions:   %s\n", perms);
                printf("------------------------------------------------\n\n");
                return;
            }
        }
    }
    printf("=> [!] Address %p not found in process memory maps!\n\n", ptr);
}

int main() {
    printf("\n--- Testing NOEL-V Kernel mprotect() Behavior ---\n");

    // 1. Ask the OS for a single 4KB page of Read/Write memory (like LLVM does)
    void* mem = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

    if (mem == MAP_FAILED) {
        printf("[!] mmap failed: %s\n", strerror(errno));
        return -1;
    }
    printf("=> mmap(PROT_READ | PROT_WRITE) succeeded at %p\n", mem);

    // 2. Write a minimal RV64 function that returns 42:
    //    C.LI a0, 42  (0x4529) - load immediate 42 into a0 (return value register)
    //    C.JR ra      (0x8082) - return
    // Both are 16-bit compressed instructions (zca extension).
    uint16_t* code = (uint16_t*)mem;
    code[0] = 0x4529; // C.LI a0, 42
    code[1] = 0x8082; // C.JR ra
    printf("=> Wrote RV64 'return 42' function to page\n");

    // 3. Flush I-cache: ensure the stores above are visible to instruction fetch
    __builtin___clear_cache((char*)mem, (char*)mem + 4);
    printf("=> __builtin___clear_cache (fence.i) issued\n");

    // 4. Ask the OS to transition it to Read/Execute
    int result = mprotect(mem, 4096, PROT_READ | PROT_EXEC);

    if (result == 0) {
        printf("=> mprotect(PROT_READ | PROT_EXEC) SUCCEEDED!\n");
        check_memory_permissions(mem);
    } else {
        printf("=> [!] mprotect FAILED! OS Error: %s (errno: %d)\n", strerror(errno), errno);
        munmap(mem, 4096);
        return -1;
    }

    // 5. Actually call the JIT'd function - this is the test the original missed
    printf("=> Attempting to execute from mmap'd page...\n");
    typedef uint64_t (*jit_fn)();
    jit_fn fn = (jit_fn)mem;
    uint64_t ret = fn();
    printf("=> Execution SUCCEEDED! Return value: %lu (expected 42)\n", ret);

    printf("-------------------------------------------------\n\n");
    munmap(mem, 4096);
    return 0;
}
