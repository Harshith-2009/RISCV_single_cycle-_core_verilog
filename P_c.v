module P_C(PC_NEXT, PC, rst, clk);

	input [31:0] PC_NEXT;
	input clk,rst;

	output reg [31:0] PC;

	always @(posedge clk) begin
		if (rst == 1'b0)
			PC <= 32'h00000000;
		else 
			PC <= PC_NEXT; 
	end

endmodule