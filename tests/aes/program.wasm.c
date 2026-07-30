#include "../wasm_shim.h"

#define NUM_ROUND_KEYS_128 (11)

typedef char AES_Block_t[16];
typedef char AES_Key128_t[256];

// Branch-free GF(2^8) multiply -- kept in lockstep with tests/aes/program.bpf.c's
// GF_Mult, which was rewritten this way to fix a DFS state-explosion problem in
// the runtime-verifier (33 calls/block x 16 data-dependent branches/call). This
// wasm copy is mirrored so all three (bpf/native/wasm) benchmark paths keep
// computing the exact same thing.
char GF_Mult(char a, char b) {
  unsigned char result = 0;
  unsigned char ua = (unsigned char)a;
  unsigned char ub = (unsigned char)b;
  unsigned char lsb_mask, hi_mask;

  // i = 0
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 1
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 2
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 3
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 4
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 5
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 6
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  // i = 7
  lsb_mask = (unsigned char)(0u - (ub & 1u));
  result ^= ua & lsb_mask;
  hi_mask = (unsigned char)(0u - (ua >> 7));
  ua = (unsigned char)(ua << 1) ^ (0x1b & hi_mask);
  ub >>= 1;

  return (char)result;
}

// Branch-free version of `if (v >= 0 && v < 16) v = key[v];` -- mirrors
// tests/aes/program.bpf.c's AES_MaybeSubstitute; see the comment there.
char AES_MaybeSubstitute(char v, AES_Key128_t key) {
  unsigned char uv = (unsigned char)v;
  unsigned int any_hi_bit = ((uv >> 4) & 1u) | ((uv >> 5) & 1u) | ((uv >> 6) & 1u) | ((uv >> 7) & 1u);
  unsigned char oor_mask = (unsigned char)(0u - any_hi_bit);
  unsigned char in_mask = (unsigned char)~oor_mask;
  char subbed = key[uv & 0x0F];
  return (char)((subbed & in_mask) | (v & oor_mask));
}

void AES_ShiftRows(AES_Block_t block) {
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

void AES_MixColumns(AES_Block_t block) {
  char temp[4] = {0};
  int base;

  base = 0 * 4;
  temp[0] = GF_Mult(0x02, block[base]) ^ GF_Mult(0x03, block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult(0x02, block[base + 1]) ^ GF_Mult(0x03, block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult(0x02, block[base + 2]) ^ GF_Mult(0x03, block[base + 3]);
  temp[3] = GF_Mult(0x03, block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult(0x02, block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];

  base = 1 * 4;
  temp[0] = GF_Mult(0x02, block[base]) ^ GF_Mult(0x03, block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult(0x02, block[base + 1]) ^ GF_Mult(0x03, block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult(0x02, block[base + 2]) ^ GF_Mult(0x03, block[base + 3]);
  temp[3] = GF_Mult(0x03, block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult(0x02, block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];

  base = 2 * 4;
  temp[0] = GF_Mult(0x02, block[base]) ^ GF_Mult(0x03, block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult(0x02, block[base + 1]) ^ GF_Mult(0x03, block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult(0x02, block[base + 2]) ^ GF_Mult(0x03, block[base + 3]);
  temp[3] = GF_Mult(0x03, block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult(0x02, block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];

  base = 3 * 4;
  temp[0] = GF_Mult(0x02, block[base]) ^ GF_Mult(0x03, block[base + 1]) ^ block[base + 2] ^ block[base + 3];
  temp[1] = block[base] ^ GF_Mult(0x02, block[base + 1]) ^ GF_Mult(0x03, block[base + 2]) ^ block[base + 3];
  temp[2] = block[base] ^ block[base + 1] ^ GF_Mult(0x02, block[base + 2]) ^ GF_Mult(0x03, block[base + 3]);
  temp[3] = GF_Mult(0x03, block[base]) ^ block[base + 1] ^ block[base + 2] ^ GF_Mult(0x02, block[base + 3]);

  block[base] = temp[0];
  block[base + 1] = temp[1];
  block[base + 2] = temp[2];
  block[base + 3] = temp[3];
}

int main() {
  uint64_t block_map = MAP_BY_FD(10), key_map = MAP_BY_FD(11), out_map = MAP_BY_FD(12), *result;

  AES_Block_t block;
  AES_Key128_t key;
  AES_Block_t zero;
  
  for (int i = 0; i < 16; i++) {
    uint32_t result = bpf_map_lookup_elem(block_map, i);
    block[i] = result;
  }

  for (int i = 0; i < 256; i++) {
    uint32_t result = bpf_map_lookup_elem(key_map, i);
    key[i] = result;
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
    bpf_map_update_elem(key_map, i, block[i], 0);
  }

  return 0;
}
