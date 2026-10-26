class InstrFormat<bits<2> val> {
	bits<2> Value = val;
}

def InstFormatR : InstrFormat<0>;
def InstFormatI : InstrFormat<1>;
def InstFormatS : InstrFormat<2>;
def InstFormatD : InstrFormat<3>;

