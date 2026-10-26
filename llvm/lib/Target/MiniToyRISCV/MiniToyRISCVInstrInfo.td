class RegisterClass<string namespace,
list<ValueType> regTypes, int alignment, dag regList> {
  string Namespace = namespace;
  list<ValueType> RegTypes = regTypes;
  int Size = 0;  // spill size, in bits; zero lets tblgen pick the size
  int Alignment = alignment;

  // CopyCost is the cost of copying a value between two registers
  // default value 1 means a single instruction
  // A negative value means copying is extremely expensive or impossible
  int CopyCost = 1;
  dag MemberList = regList;

  // for register classes that are subregisters of this class
  list<RegisterClass> SubRegClassList = [];

  code MethodProtos = [{}];  // to insert arbitrary code
  code MethodBodies = [{}];
}
