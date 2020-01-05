module CPU(clock, reset, 
					PCin,PCout,
					inst,
					RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch,
					ALUOp,
					WriteReg,
					ReadData1, ReadData2,
					Extend64,
					ALU_B,
					ShiftOut,
					ALUCtl,
					Zero,
					ALUOut,
					AddOut,
					Add4Out,
					AndOut,
					ReadData,
					WriteData_Reg);

	input clock;
	input reset;

	initial begin 
		reset = 1;
		#5 reset = 0;
	end

	//Program Counter//
	output wire [63:0] PCin, PCout;
	PC pc_0(.clock(clock), .reset(reset), .PCin(PCin), .PCout(PCout));


	//Instruction Memory//
	output wire [31:0] inst;
	InstMem instmem_0(.clock(clock), .address(PCin), .inst(inst));

	//Control//
	output wire RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch;
	output wire [1:0] ALUOp;
	Control control_0(.Opcode(inst[6:0]), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg),
					  .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp(ALUOp));

	//Register File//
	output wire [31:0] ReadData1, ReadData2;
	RegFile regfile_0(.clock(clock), .ReadReg1(inst[19:15]), .ReadReg2(inst[24:20]), .RegWrite(RegWrite),
						.WriteReg(WriteReg), .WriteData(WriteData_Reg), .ReadData1(ReadData1), .ReadData2(ReadData2));


	//Register File Multiplexer//
	output wire [11:7] WriteReg;
	MuxReg muxreg_0(.inst24_20(inst[24:20]), .inst19_15(inst[19:15]), .WriteReg(WriteReg));

	//Sign Extend//
	output wire [63:0] Extend64;
	SignExtend sign_extend_0(.inst32_0(inst[31:0]), .Extend64(Extend64));

	//Shift by 2//
	output wire [31:0] ShiftOut;
	Shift shift_0(.ShiftIn(Extend64), .ShiftOut(ShiftOut));

	//ALU Control//
	output wire [3:0] ALUCtl;
	ALUControl alu_control_0(.ALUOp(ALUOp), .FuncCode(inst[5:0]), .ALUCtl(ALUCtl));

	//ALU//
	output wire Zero;
	output wire [31:0] ALUOut;
	ALU alu_0(.A(ReadData1), .B(ALU_B), .ALUCtl(ALUCtl), .ALUOut(ALUOut), .Zero(Zero));
	
	//ALU Adder//
	output wire [31:0] Add_ALUOut;
	Add_ALU add_alu_0(.PCout(PCout), .ShiftOut(ShiftOut), .Add_ALUOut(Add_ALUOut));
	
	//And Gate//
	output wire AndGateOut;
	AndGate and_gate_0(.Branch(Branch), .Zero(Zero), .AndGateOut(AndGateOut));
	
	//Data Memory//
	output wire [31:0] ReadData;
	DataMemory  data_memory_0(.clock(clock), .address(ALUOut), .MemWrite(MemWrite), .MemRead(MemRead), .WriteData(ReadData2), .ReadData(ReadData));

	//Adder Multiplexer//
	output wire [31:0] PCin;
	MuxAdd mux_add_0(.PCout(PCout), .AddOut(AddOut), .AndOut(AndOut), .Add4Out(Add4Out), .PCin(PCin));


	//Memory Multiplexer//
	output wire [63:0] WriteData_Reg;
	MuxMem mux_mem_0(.ReadData(ReadData), .ALUOut(ALUOut), .WriteData_Reg(WriteData_Reg), .MemtoReg(MemtoReg));
	

	//Register Multiplexer//
	output wire [63:0] ALU_B;
	MuxReg mux_reg_0(.ALUSrc(ALUSrc), .ReadData2(ReadData2), .Extend64(Extend64), .ALU_B(ALU_B));







