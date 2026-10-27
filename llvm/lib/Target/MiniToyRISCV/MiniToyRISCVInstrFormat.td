// used to emit instruction encoding by code emitter 
class InstrFormat<bits<2> val> {
	bits<2> Value = val;
}

def InstFormatR : InstrFormat<0>;
def InstFormatI : InstrFormat<1>;
def InstFormatS : InstrFormat<2>;
def InstFormatB : InstrFormat<3>;

// Generic instruction format
class MiniToyRISCVInstruction <dag outs, dag ins, string asmstr, list<dag> pattern, 
					InstrItinClass itin, Format f> : Instruction {
	bits<32> Inst;
	let Namespace = "MiniToyRISCV";
	let Size = 4;
	bits<7> opcode;
	let Inst{0-7} = opcode;

	let OutOperandList = outs;
	let InOperandList = ins;
	let AsmString = asmstr;
	let Pattern = pattern;
	let Itinerary = itin; // Execution steps used for scheduling.
}

//  31      30 29 28 27 26 25 24 23 22 21     20 19 18 17 16 15 14 13 12 11 10 9 8       7 6 5 4 3 2 1 0
// ┌─────────────────────────┬──────────────────┬──────────────┬────────┬─────────────────┬─────────────┐
// │         funct7          │       rs2        │     rs1      │ funct3 │       rd        │   opcode    │ R-type
// ├─────────────────────────┴──────────────────┼──────────────┼────────┼─────────────────┼─────────────┤

class FR <bits<7> opcode, bits<3> funct3, bits<7> funct7;, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass itin> :
		MiniToyRISCVInstruction <outs, ins, asmstr, pattern, itin, FormatR> {
	bits<5> rd;
	bits<5> rs1;
	bits<5> rs2;

	let Inst{7-11} = rd;
	let Inst{12-14} = funct3;
	let Inst{15-19} = rs1;
	let Inst{20-24} = rs2;
	let Inst{25-31} = funct7;
}

//  31      30 29 28 27 26 25 24 23 22 21   20   19 18 17 16 15 14 13 12 11 10 9 8     7   6 5 4 3 2 1 0
// ├─────────────────────────┴──────────────────┼──────────────┼────────┼─────────────────┼─────────────┤
// │                imm[11:0]                   │     rs1      │ funct3 │       rd        │   opcode    │ I-type
// ├─────────────────────────┬──────────────────┼──────────────┼────────┼─────────────────┼─────────────┤
class FI <
  bits<7> opcode, bits<3> funct3, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass itin
>: MiniToyRISCVInstruction <outs, ins, asmstr, pattern, itin, FormatR> {
  bits<5> rd;
  bits<5> rs1;
  bits<12> imm;

  let Inst{31-20} = imm;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Inst{6-0} = opcode;
}

//  31      30 29 28 27 26 25 24 23 22 21   20   19 18 17 16 15 14 13 12 11 10 9 8     7   6 5 4 3 2 1 0
// ├─────────────────────────┬──────────────────┼──────────────┼────────┼─────────────────┼─────────────┤
// │        imm[11:5]        │       rs2        │     rs1      │ funct3 │   imm[4:0]      │   opcode    │ S-type
// ├───────┬─────────────────┼──────────────────┼──────────────┼────────┼─────────┬───────┼─────────────┤
class FS <
  bits<7> opcode, bits<3> funct3, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass itin
>: MiniToyRISCVInstruction <outs, ins, asmstr, pattern, itin, FormatR> {
  bits<5> rs1;
  bits<5> rs2;
  bits<12> imm;

  let Inst{31-25} = imm{11-5};
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = imm{4-0};
  let Inst{6-0} = opcode;
}

//  31      30 29 28 27 26 25 24 23 22 21   20   19 18 17 16 15 14 13 12 11 10 9 8     7   6 5 4 3 2 1 0
// ├───────┬─────────────────┼──────────────────┼──────────────┼────────┼─────────┬───────┼─────────────┤
// │imm[12]│    imm[10:5]    │       rs2        │     rs1      │ funct3 │imm[4:1] │imm[11]│   opcode    │ B-type
// ├───────┴─────────────────┴──────────────────┴──────────────┴────────┼─────────┴───────┼─────────────┤
class FB <
  bits<7> opcode, bits<3> funct3, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass itin
>: MiniToyRISCVInstruction <outs, ins, asmstr, pattern, itin, FormatR> {
  bits<5> rs1;
  bits<5> rs2;
  bits<12> imm;

  let Inst{31} = imm{11};
  let Inst{30-25} = imm{9-4};
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-8} = imm{3-0};
  let Inst{7} = imm{10};
  let Inst{6-0} = opcode;
}