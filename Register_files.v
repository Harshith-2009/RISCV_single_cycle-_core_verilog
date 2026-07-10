module Reg_file(A1, A2, A3, WE3, clk,rst, WD3, RD1, RD2);

	input [31:0] WD3;
	input clk, WE3, rst;
	input [4:0] A1, A2, A3;

	output [31:0] RD1, RD2;

	// memory
	reg [31:0] Registers [31:0]; 


	//read functionality
	assign RD1 = (!rst) ? 32'h00000000 : Registers[A1]  ;
	assign RD2 = (!rst) ? 32'h00000000 : Registers[A2];

	// write funtionality
	always @(posedge clk) begin
		if (WE3) 
			Registers[A3] <=WD3;
	end

	initial begin
		Registers[9] = 32'h00000020;
		Registers[6] = 32'h00000011;
		Registers[11] = 32'h00000028;
		Registers[12] = 32'h00000030;
	end

endmodule