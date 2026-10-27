# In process implement RISC-V Instruction

| LLVM IR | RISC-V Instruction |
|---|---|	
| `add i32` | `add rd, rs1, rs2` |
| `sub i32` | `sub rd, rs1, rs2` |
| `and i32` | `and rd, rs1, rs2` |
| `or i32` | `or rd, rs1, rs2` |
| `xor i32` | `xor rd, rs1, rs2` |
| `icmp eq` | `xor` + `sltiu` |
| `icmp ne` | `xor` + `sltu` |
| `icmp slt` | `slt rd, rs1, rs2` |
| `alloca i32` | `addi` (stack address calculation) |
| `load i32` | `lw rd, offset(rs1)` |
| `store i32` | `sw rs2, offset(rs1)` |
| `br label %dest` | `jal zero, dest` |
| `br i1 %cond, label %true, label %false` | `bne` / `beq` + `jal zero, dest` |
| `ret i32` | `addi a0, rd, 0` + `jalr zero, 0(ra)` |
| `ret void` | `jalr zero, 0(ra)` |