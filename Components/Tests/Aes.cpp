#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define NUM_ROUND_KEYS_128 (11)

namespace Components {

namespace Aes {

typedef char AES_Block_t[16];
typedef char AES_Key128_t[256];

// Native-only specialization: MixColumns only ever calls GF_Mult with the
// literal constants 0x02 and 0x03, but LLVM doesn't fold the generic
// branch-free 8-round GF_Mult loop (see tests/aes/program.bpf.c) down to
// the trivial xtime form even with the multiplier inlined as a constant.
// program.bpf.c keeps the generic loop because the runtime-verifier's DFS
// WCET analyzer needs that specific branch-free shape to avoid a state
// explosion (33 calls/block x 16 data-dependent branches/call) -- that's
// a static-analysis constraint, not a property of the arithmetic, so the
// native path (not analyzed that way) is free to compute the same GF(2^8)
// values directly. Output is bit-identical to the generic form.
static inline unsigned char GF_Xtime(unsigned char x) {
  return (unsigned char)((x << 1) ^ (0x1b & (unsigned char)(0u - (x >> 7))));
}

static char GF_Mult2(char b) {
  return (char)GF_Xtime((unsigned char)b);
}

static char GF_Mult3(char b) {
  unsigned char ub = (unsigned char)b;
  return (char)(GF_Xtime(ub) ^ ub);
}

// Branch-free version of `if (v >= 0 && v < 16) v = key[v];` -- mirrors
// tests/aes/program.bpf.c's AES_MaybeSubstitute; see the comment there.
static char AES_MaybeSubstitute(char v, AES_Key128_t key) {
  unsigned char uv = (unsigned char)v;
  unsigned int any_hi_bit = ((uv >> 4) & 1u) | ((uv >> 5) & 1u) | ((uv >> 6) & 1u) | ((uv >> 7) & 1u);
  unsigned char oor_mask = (unsigned char)(0u - any_hi_bit);
  unsigned char in_mask = (unsigned char)~oor_mask;
  char subbed = key[uv & 0x0F];
  return (char)((subbed & in_mask) | (v & oor_mask));
}

static void AES_ShiftRows(AES_Block_t block) {
  // Shift row 1
  char temp0 = block[1];
  block[1] = block[5];
  block[5] = block[9];
  block[9] = block[13];
  block[13] = temp0;

  // Shift row 2
  temp0 = block[2];
  char temp1 = block[6];
  block[2] = block[10];
  block[6] = block[14];
  block[10] = temp0;
  block[14] = temp1;

  // Shift row 3
  temp0 = block[15];
  block[15] = block[11];
  block[11] = block[7];
  block[7] = block[3];
  block[3] = temp0;
}

static void AES_MixColumns(AES_Block_t block) {
  char temp[4] = {0};
  int base;

  base = 0 * 4;
  temp[0] = GF_Mult2(block[base]) ^ GF_Mult3(block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult2(block[base + 1]) ^ GF_Mult3(block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult2(block[base + 2]) ^ GF_Mult3(block[base + 3]);
  temp[3] = GF_Mult3(block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult2(block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];

  base = 1 * 4;
  temp[0] = GF_Mult2(block[base]) ^ GF_Mult3(block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult2(block[base + 1]) ^ GF_Mult3(block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult2(block[base + 2]) ^ GF_Mult3(block[base + 3]);
  temp[3] = GF_Mult3(block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult2(block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];

  base = 2 * 4;
  temp[0] = GF_Mult2(block[base]) ^ GF_Mult3(block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult2(block[base + 1]) ^ GF_Mult3(block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult2(block[base + 2]) ^ GF_Mult3(block[base + 3]);
  temp[3] = GF_Mult3(block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult2(block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];

  base = 3 * 4;
  temp[0] = GF_Mult2(block[base]) ^ GF_Mult3(block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult2(block[base + 1]) ^ GF_Mult3(block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult2(block[base + 2]) ^ GF_Mult3(block[base + 3]);
  temp[3] = GF_Mult3(block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult2(block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];
}

int main() {
  void *block_map = (void*)maps::map_by_fd(10), *key_map = (void*)maps::map_by_fd(11), *out_map = (void*)maps::map_by_fd(12), *result;

  AES_Block_t block = {12};
  AES_Key128_t key = {13};
  AES_Block_t zero = {0};
  
  for (int i = 0; i < 16; i++) {
    void *result = maps::bpf_map_lookup_elem(block_map, &i);
    block[i] = *(char *)result;
  }

  for (int i = 0; i < 256; i++) {
    void *result = maps::bpf_map_lookup_elem(key_map, &i);
    key[i] = *(char *)result;
  }

  // 128 blocks
  for (int i = 0; i < 128; i++) {

    // AddRoundKey
    block[0 * 4 + 0] ^= zero[0 * 4 + 0];
    block[0 * 4 + 1] ^= zero[0 * 4 + 1];
    block[0 * 4 + 2] ^= zero[0 * 4 + 2];
    block[0 * 4 + 3] ^= zero[0 * 4 + 3];

    block[1 * 4 + 0] ^= zero[1 * 4 + 0];
    block[1 * 4 + 1] ^= zero[1 * 4 + 1];
    block[1 * 4 + 2] ^= zero[1 * 4 + 2];
    block[1 * 4 + 3] ^= zero[1 * 4 + 3];

    block[2 * 4 + 0] ^= zero[2 * 4 + 0];
    block[2 * 4 + 1] ^= zero[2 * 4 + 1];
    block[2 * 4 + 2] ^= zero[2 * 4 + 2];
    block[2 * 4 + 3] ^= zero[2 * 4 + 3];

    block[3 * 4 + 0] ^= zero[3 * 4 + 0];
    block[3 * 4 + 1] ^= zero[3 * 4 + 1];
    block[3 * 4 + 2] ^= zero[3 * 4 + 2];
    block[3 * 4 + 3] ^= zero[3 * 4 + 3];

      //SubBytes
    int index;
    index = 0 * 4 + 0;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 0 * 4 + 1;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 0 * 4 + 2;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 0 * 4 + 3;
    block[index] = AES_MaybeSubstitute(block[index], key);

    index = 1 * 4 + 0;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 1 * 4 + 1;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 1 * 4 + 2;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 1 * 4 + 3;
    block[index] = AES_MaybeSubstitute(block[index], key);

    index = 2 * 4 + 0;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 2 * 4 + 1;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 2 * 4 + 2;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 2 * 4 + 3;
    block[index] = AES_MaybeSubstitute(block[index], key);

    index = 3 * 4 + 0;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 3 * 4 + 1;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 3 * 4 + 2;
    block[index] = AES_MaybeSubstitute(block[index], key);
    index = 3 * 4 + 3;
    block[index] = AES_MaybeSubstitute(block[index], key);

    AES_ShiftRows(block);

    AES_MixColumns(block);
  }

  for (int i = 0; i < 16; i++) {
    maps::bpf_map_update_elem(key_map, &i, &block[i], 0);
  }

  return 0;
}

} // namespace Aes

} // namespace Components
