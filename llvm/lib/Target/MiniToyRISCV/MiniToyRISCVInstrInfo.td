/* The TargetInstrInfo class is used to describe the machine instructions supported by the target. Descriptions define things like the mnemonic for the opcode, the number of operands, the list of implicit register uses and defs, whether the instruction has certain target-independent properties (accesses memory, is commutable, etc), and holds any target-specific flags. */

// the LLVM IR code is converted to a SelectionDAG with nodes that are instances of the SDNode class containing target instructions.
// An SDNode has an opcode, operands, type requirements, and operation properties.

/*
TableGen uses the following target description (.td) input files to generate much of the code for instruction definition:

    Target.td — Where the Instruction, Operand, InstrInfo, and other fundamental classes are defined.

    TargetSelectionDAG.td — Used by SelectionDAG instruction selection generators, contains SDTC* classes (selection DAG type constraint), definitions of SelectionDAG nodes (such as imm, cond, bb, add, fadd, sub), and pattern support (Pattern, Pat, PatFrag, PatLeaf, ComplexPattern.

    XXXInstrFormats.td — Patterns for definitions of target-specific instructions.

    XXXInstrInfo.td — Target-specific definitions of instruction templates, condition codes, and instructions of an instruction set. For architecture modifications, a different file name may be used. For example, for Pentium with SSE instruction, this file is X86InstrSSE.td, and for Pentium with MMX, this file is X86InstrMMX.td.
*/

/*
XXXInstrInfo contains an array of XXXInstrDescriptor objects, each of which describes one instruction. An instruction descriptor defines:

    Opcode mnemonic

    Number of operands

    List of implicit register definitions and uses

    Target-independent properties (such as memory access, is commutable)

    Target-specific flags
*/

include "MiniToyRISCVInstrFormat.td"
