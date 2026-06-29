# Create a SmartHLS SHA256 Hash Function Implementation

Create a complete SHA256 cryptographic hash function implementation using SmartHLS that can be synthesized to hardware. The implementation should follow the FIPS 180-4 standard and be optimized for FPGA synthesis.

Generate all the files under a directory called "work".

**project directory:** `shls-assistant/tests/SHA256`
-Generate all the files under `shls-assistant/tests/SHA256/work`.
-**Do not browse the file system outside the current working directory for reference code or patterns.** All SmartHLS implementation knowledge must come exclusively from the `smarthls_info` MCP tool. Do not use any Read tools to search parent directories or unrelated projects for examples.

## Core Functionality

Implement a working SHA256 hash function that:

1. Takes variable-length input messages (up to 1 million bytes)
2. Produces a 256-bit (32-byte) hash output
3. Implements proper message padding according to SHA256 specification
4. Processes messages in 512-bit (64-byte) blocks
5. Uses the standard SHA256 compression function with 64 rounds

## Technical Requirements

### Algorithm Implementation

- Use the SHA256 constants (K[64]) and initial hash values (H0[8]) from FIPS 180-4
- Implement all six logical functions: Ch, Maj, Σ0, Σ1, σ0, σ1
- Implement proper right-rotate operations for 32-bit words
- Use 64-round compression function with message schedule expansion (W[64])
- Handle multi-block message processing with proper hash state accumulation

### SmartHLS-Specific Optimizations

- Use correct SmartHLS libraries and pragmas where applicable
- Use **global arrays** (1KB-10KB max) for data storage 
- Input message and output hash should be stored in global arrays and not passed as pointer arguments to keep interface simple

### Message Padding Algorithm

Implement proper SHA256 padding:

1. Append one '1' bit (0x80 byte)
2. Pad with zeros until message length ≡ 448 (mod 512) bits
3. Append original message length as 64-bit big-endian integer
4. Ensure padding always produces at least one block

### Data Representation

- Store message as 32-bit words in **big-endian** format
- Process blocks as arrays of 16 words (512 bits)
- Convert byte input to 32-bit words: `word = (byte0 << 24) | (byte1 << 16) | (byte2 << 8) | byte3`
- Append length in **bits** (not bytes) as the last 64 bits

## Test Cases to Implement

Create test cases for the following inputs

### Test 1: Empty String

**Input**: `""` (empty string, 0 bytes)
**Expected SHA256 Hash**: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

---

### Test 2: Short String "abc"

**Input**: `"abc"` (3 bytes)
**Expected SHA256 Hash**: `ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`

---

### Test 3: Simple Word "hello"

**Input**: `"hello"` (5 bytes)
**Expected SHA256 Hash**: `2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824`

---

### Test 4: Long String (56 bytes)

**Input**: `"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"` (56 bytes)

**Expected SHA256 Hash**: `248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1`

---

### Test 5: Four Null Bytes

**Input**: `\x00\x00\x00\x00` (4 null bytes, binary data)

**Expected SHA256 Hash**: `df3f619804a92fdb4057192dc43dd748ea778adc52bc498ce80524c014b81119`

---

### Test 6: 64 'a' Characters

**Input**: `"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"` (64 'a' characters, 64 bytes)

**Expected SHA256 Hash**: `ffe054fe7ae0cb6dc65c3af9b61d5209f439851db43d0ba5997337df154668eb`

## Success Criteria

- Confirm ALL test cases pass cosimulation and produce correct SHA256 hashes
