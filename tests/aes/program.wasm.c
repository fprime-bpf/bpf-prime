#include "../wasm_shim.h"

#define NUM_ROUND_KEYS_128 (11)

typedef char AES_Block_t[16];
typedef char AES_Key128_t[256];

char GF_Mult(char a, char b) {
  char result = 0;
  char shiftEscapesField = 0;

  // Loop through byte `b`
  // // If the LSB is set (i.e. we're not multiplying out by zero for this polynomial term)
  // // then we xor the result with `a` (i.e. adding the polynomial terms of a)
  // if (b & 1) {
  //   result ^= a;
  // }
  //
  // // Double `a`, keeping track of whether that causes `a` to leave the field.
  // shiftEscapesField = a & 0x80;
  // a <<= 1;
  //
  // // Since the next bit we look at in `b` will represent multiplying the terms in `a`
  // // by the next power of 2, we can achieve the same result by shifting `a` left.
  // // If `a` left the field, we need to modulo with irreduciable polynomial term.
  // if (shiftEscapesField) {
  //   // Note that we use 0x1b instead of 0x11b. If we weren't taking advantage of
  //   // u8 overflow (i.e. by using u16, we would use the "real" term)
  //   a ^= 0x1b;
  // }
  //
  // // Shift `b` down in order to look at the next LSB (worth twice as much in the multiplication)
  // b >>= 1;

  // i = 0
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 1
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 2
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 3
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 4
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 5
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 6
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  // i = 7
  if (b & 1)
    result ^= a;
  shiftEscapesField = a & 0x80;
  a <<= 1;
  if (shiftEscapesField)
	a ^= 0x1b;
  b >>= 1;

  return result;
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

  AES_Block_t block = {12};
  AES_Key128_t key = {13};
  AES_Block_t zero = {0};
  
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
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 0 * 4 + 1;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 0 * 4 + 2;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 0 * 4 + 3;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];

    index = 1 * 4 + 0;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 1 * 4 + 1;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 1 * 4 + 2;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 1 * 4 + 3;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];

    index = 2 * 4 + 0;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 2 * 4 + 1;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 2 * 4 + 2;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 2 * 4 + 3;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];

    index = 3 * 4 + 0;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 3 * 4 + 1;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 3 * 4 + 2;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];
    index = 3 * 4 + 3;
    if (block[index] >= 0 && block[index] < 16)
      block[index] = key[block[index]];

    AES_ShiftRows(block);

    AES_MixColumns(block);
  }

  for (int i = 0; i < 16; i++) {
    bpf_map_update_elem(key_map, i, block[i], 0);
  }

  return 0;
}
