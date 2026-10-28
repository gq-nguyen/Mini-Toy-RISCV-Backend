// The TargetRegisterInfo class is used to describe the register file of the target and any interactions between the registers.

include "Target.td"
class MiniToyRISCVRegister<bits<5> Enc, string n> : Register <n> {
  let Namespace = "MiniToyRISCV"; // overrides the default namespace of class Register
  let HWEncoding{4-0} = Enc;
}

class MiniToyRISCVGPRegister<bits<5> Enc, string n> : MiniToyRISCVRegister <Enc, n>;

let Namespace = "MiniToyRISCV" in {
  def ZERO : MiniToyRISCVGPRegister<0,  "x0">,   DwarfRegNum<[0]>;
  def RA   : MiniToyRISCVGPRegister<1,  "x1">,   DwarfRegNum<[1]>;
  def SP   : MiniToyRISCVGPRegister<2,  "x2">,   DwarfRegNum<[2]>;
  def GP   : MiniToyRISCVGPRegister<3,  "x3">,   DwarfRegNum<[3]>;
  def TP   : MiniToyRISCVGPRegister<4,  "x4">,   DwarfRegNum<[4]>;
  def T0   : MiniToyRISCVGPRegister<5,  "x5">,   DwarfRegNum<[5]>;
  def T1   : MiniToyRISCVGPRegister<6,  "x6">,   DwarfRegNum<[6]>;
  def T2   : MiniToyRISCVGPRegister<7,  "x7">,   DwarfRegNum<[7]>;
  def FP   : MiniToyRISCVGPRegister<8,  "x8">,   DwarfRegNum<[8]>;
  def S1   : MiniToyRISCVGPRegister<9,  "x9">,   DwarfRegNum<[9]>;
  def A0   : MiniToyRISCVGPRegister<10, "x10">,  DwarfRegNum<[10]>;
  def A1   : MiniToyRISCVGPRegister<11, "x11">,  DwarfRegNum<[11]>;
  def A2   : MiniToyRISCVGPRegister<12, "x12">,  DwarfRegNum<[12]>;
  def A3   : MiniToyRISCVGPRegister<13, "x13">,  DwarfRegNum<[13]>;
  def A4   : MiniToyRISCVGPRegister<14, "x14">,  DwarfRegNum<[10]>;
  def A5   : MiniToyRISCVGPRegister<15, "x15">,  DwarfRegNum<[11]>;
  def A6   : MiniToyRISCVGPRegister<16, "x16">,  DwarfRegNum<[12]>;
  def A7   : MiniToyRISCVGPRegister<17, "x17">,  DwarfRegNum<[13]>;
  def S2   : MiniToyRISCVGPRegister<18, "x18">,  DwarfRegNum<[18]>;
  def S3   : MiniToyRISCVGPRegister<19, "x19">,  DwarfRegNum<[19]>;
  def S4   : MiniToyRISCVGPRegister<20, "x20">,  DwarfRegNum<[20]>;
  def S5   : MiniToyRISCVGPRegister<21, "x21">,  DwarfRegNum<[21]>;
  def S6   : MiniToyRISCVGPRegister<22, "x22">,  DwarfRegNum<[22]>;
  def S7   : MiniToyRISCVGPRegister<23, "x23">,  DwarfRegNum<[23]>;
  def S8   : MiniToyRISCVGPRegister<24, "x24">,  DwarfRegNum<[24]>;
  def S9   : MiniToyRISCVGPRegister<25, "x25">,  DwarfRegNum<[25]>;
  def S10  : MiniToyRISCVGPRegister<26, "x26">,  DwarfRegNum<[26]>;
  def S11  : MiniToyRISCVGPRegister<27, "x27">,  DwarfRegNum<[27]>;
  def T3   : MiniToyRISCVGPRegister<28, "x28">,  DwarfRegNum<[28]>;
  def T4   : MiniToyRISCVGPRegister<29, "x29">,  DwarfRegNum<[29]>;
  def T5   : MiniToyRISCVGPRegister<30, "x30">,  DwarfRegNum<[30]>;
  def T6   : MiniToyRISCVGPRegister<31, "x31">,  DwarfRegNum<[31]>;
}

def IntRegs : RegisterClass<"MiniToyRISCV", [i32], 32,
    (add A0, A1, A2, A3, A4, A5, A6, A7,  // arguments/return values
         T0, T1, T2, T3, T4, T5, T6,      // Temporaries
         ZERO,
         FP, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, // Other
         RA, SP, GP, TP
    )>;