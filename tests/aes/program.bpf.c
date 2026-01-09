#include "../bpf_shim.h"

#define NUM_ROUND_KEYS_128 (11)

typedef char AES_Column_t[4];
typedef AES_Column_t AES_Block_t[4];
typedef char AES_Key128_t[16];

inline char GF_Mult(char a, char b) {
  char result = 0;
  char shiftEscapesField = 0;

  // Loop through byte `b`
  for (char i = 0; i < 8; i++) {
    // If the LSB is set (i.e. we're not multiplying out by zero for this polynomial term)
    // then we xor the result with `a` (i.e. adding the polynomial terms of a)
    if (b & 1) {
      result ^= a;
    }

    // Double `a`, keeping track of whether that causes `a` to leave the field.
    shiftEscapesField = a & 0x80;
    a <<= 1;

    // Since the next bit we look at in `b` will represent multiplying the terms in `a`
    // by the next power of 2, we can achieve the same result by shifting `a` left.
    // If `a` left the field, we need to modulo with irreduciable polynomial term.
    if (shiftEscapesField) {
      // Note that we use 0x1b instead of 0x11b. If we weren't taking advantage of
      // u8 overflow (i.e. by using u16, we would use the "real" term)
      a ^= 0x1b;
    }

    // Shift `b` down in order to look at the next LSB (worth twice as much in the multiplication)
    b >>= 1;
  }

  return result;
}


inline void AES_ShiftRows(AES_Block_t block) {
}

inline void AES_MixColumns(AES_Block_t block) {
  AES_Column_t temp = { 0 };

  for (int i = 0; i < 4; i++) {
    temp[0] = GF_Mult(0x02, block[i][0]) ^ GF_Mult(0x03, block[i][1]) ^ block[i][2] ^ block[i][3];
    temp[1] = block[i][0] ^ GF_Mult(0x02, block[i][1]) ^ GF_Mult(0x03, block[i][2]) ^ block[i][3];
    temp[2] = block[i][0] ^ block[i][1] ^ GF_Mult(0x02, block[i][2]) ^ GF_Mult(0x03, block[i][3]);
    temp[3] = GF_Mult(0x03, block[i][0]) ^ block[i][1] ^ block[i][2] ^ GF_Mult(0x02, block[i][3]);

    block[i][0] = temp[0]; block[i][1] = temp[1]; block[i][2] = temp[2]; block[i][3] = temp[3];
  }
}

int main() {
  AES_Block_t block = {20};
  AES_Key128_t key = {134};
  AES_Block_t zero = {0};

  // 1000 blocks
  for (int i = 0; i < 1000; i++) {
    
    // AddRoundKey
    for (int col = 0; col < 4; col++) {
      for  (int row = 0; row < 4; row++) {
        block[col][row] ^= zero[col][row];
      }
    }

    //SubBytes
    char index;
    for (int col = 0; col < 4; col++) {
      for  (int row = 0; row < 4; row++) {
        index = block[col][row];
        block[col][row] = key[index];
      }
    }
    // ShiftRows
    char temp0;
    char temp1;

    // This implementation is a little awkward because of storing columns
    // in each array of the block instead of rows

    // Shift row 1
    // [0] [1] [2] [3] -> [1] [2] [3] [0]
    temp0 = block[0][1];
    block[0][1] = block[1][1];
    block[1][1] = block[2][1];
    block[2][1] = block[3][1];
    block[3][1] = temp0;

    // Shift row 2
    // [0] [1] [2] [3] -> [2] [3] [0] [1]
    temp0 = block[0][2];
    temp1 = block[1][2];
    block[0][2] = block[2][2];
    block[1][2] = block[3][2];
    block[2][2] = temp0;
    block[3][2] = temp1;

    // Shift row 3
    // [0] [1] [2] [3] -> [3] [0] [1] [2]
    temp0 = block[3][3];
    block[3][3] = block[2][3];
    block[2][3] = block[1][3];
    block[1][3] = block[0][3];
    block[0][3] = temp0;

//    AES_MixColumns(block);
  }

  return 0;
}

