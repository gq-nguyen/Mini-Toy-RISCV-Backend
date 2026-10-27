include "MiniToyRISCVRegisterInfo.td"

include "MiniToyRISCVInstrInfo.td"
def MiniToyRISCVInstrInfo : InstrInfo;

def MiniToyRISCV : Target {
	let InstructionSet = MiniToyRISCVInstrInfo
}