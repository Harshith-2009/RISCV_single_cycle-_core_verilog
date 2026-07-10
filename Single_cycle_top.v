`include "P_c.v"
`include "inst_mem.v"
`include "Register_files.v"
`include "sign_extend.v"
`include "ALU.v"
`include "Control_unit.v"
`include "data_mem.v"
`include "PC_Adder.v"

module Single_Cycle_Top (clk, rst);

	input clk, rst;

	//wires 
	wire [31:0] PC_Top, RD_Instr, RD1_Top, Imm_Ext_Top, ALUResult, PCPlus4,ReadData,RD2_Top;
	wire [2:0] ALUControl_top;
	wire RegWrite;
	wire [1:0] ImmSrc_Top;

	P_C PC ( 
		.clk(clk),
		.rst(rst), 
		.PC(PC_Top),
		.PC_NEXT(PCPlus4)
	);
	PC_Adder PC_Plus4 ( 
		.a(PC_Top),
		.b(32'd4),
		.c(PCPlus4)
	);
	Instr_Mem instr_Mem (
		.rst(rst),
		.A(PC_Top),
		.RD(RD_Instr)
	);
	Reg_file Register_file ( 
		.A1(RD_Instr[19:15]),
		.A2(RD_Instr[24:20]),
		.A3(RD_Instr[11:7]),
		.WE3(RegWrite),
		.clk(clk),
		.rst(rst),
		.WD3(ReadData),
		.RD1(RD1_Top),
		.RD2(RD2_Top)
	);
	Sign_extend Sign_extentison ( 
		.In(RD_Instr),
		.Imm_Ext(Imm_Ext_Top),
		.ImmSrc(ImmSrc_Top)  
	);
	alu ALU ( 
		.A(RD1_Top),
		.B(Imm_Ext_Top),
		.ALUControl(ALUControl_top),
		.Result(ALUResult),
		.Z(),
		.N(),
		.V(),
		.C()
	);

	Control_Unit_Top Cotrol_Unit ( 
		.Op(RD_Instr[6:0]),
		.RegWrite(),
		.ImmSrc(ImmSrc_Top),
		.ALUSrc(),
		.MemWrite(MemWrite_Top),
		.ResultSrc(),
		.Branch(),
		.funct3(RD_Instr[14:12]),
		.funct7(),
		.ALUControl(ALUControl_top)
	);

	data_memory Data_Memory ( 
		.clk(clk),
		.rst(rst),  
		.WE(MemWrite_Top),
		.WD(RD2_Top), 
		.A(ALUResult),
		.RD(ReadData)

	);

endmodule