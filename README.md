# Mini Toy RISC-V LLVM Backend

A minimal RISC-V LLVM backend implementation for learning and experimentation with LLVM's code generation infrastructure.

**Status:** Work in progress

## Overview

MiniToyRISCV is a learning project that aims to reimplement a small subset of the RISC-V LLVM backend from scratch.

The goal is to understand how LLVM's target-specific components work together to translate LLVM IR into RISC-V assembly, including instruction definitions, register information, instruction selection, and assembly emission.

## Current Progress

The backend is in its early development stage.

- [x] Define basic RISC-V instruction formats using TableGen.
- [x] Define initial register information using TableGen.
- [ ] Define instruction descriptions in `InstrInfo.td`.
- [ ] Implement target register information.
- [ ] Implement instruction selection from LLVM IR.
- [ ] Implement assembly emission through LLVM's MC layer.
- [ ] Test the backend with simple LLVM IR programs.

The current implementation only covers initial target descriptions. End-to-end code generation is not available yet.

## Testing

This section describes how to generate and inspect the TableGen records for the MiniToyRISCV register definitions and instruction formats.

### Prerequisites

1. Clone the [LLVM Project](https://github.com/llvm/llvm-project) repository and follow the official build instructions.
2. Copy the `MiniToyRISCV` target directory into the LLVM source tree:

   ```bash
   cp -r /path/to/MiniToyRiscv/llvm/lib/Target/MiniToyRISCV \
       /path/to/llvm-project/llvm/lib/Target/
   ```

### Generate Register Info Records

```bash
cd /path/to/llvm-project/llvm/lib/Target/MiniToyRISCV

/path/to/llvm-project/build/bin/llvm-tblgen \
    -I /path/to/llvm-project/llvm/include \
    MiniToyRISCVRegisterInfo.td \
    -print-records
```

### Generate Instruction Format Records

```bash
cd /path/to/llvm-project/llvm/lib/Target/MiniToyRISCV

/path/to/llvm-project/build/bin/llvm-tblgen \
    -I /path/to/llvm-project/llvm/include \
    -I /path/to/llvm-project/llvm/include/llvm/Target \
    MiniToyRISCVInstrFormat.td \
    -print-records
```
