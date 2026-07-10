module Instr_Mem(A, rst, RD);

	input [31:0] A;
	input rst;

	output [31:0] RD;

	// memory
	reg [31:0] Memory [1023:0];

	assign RD = (rst == 1'b0) ? 32'h00000000 : Memory[A[31:2]];

	initial begin
		//Memory[0] = 32'hFFC4A303;
		Memory[0] = 32'h0064A423;
		Memory[1] = 32'h00B62423;
	end
    
endmodule