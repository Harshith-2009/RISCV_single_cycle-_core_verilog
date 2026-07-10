module data_memory(A, WD, rst, clk, WE, RD);

	input [31:0] A, WD;
	input clk, rst, WE;

	output [31:0] RD;

	reg [31:0] Data_mem [1023:0];

	// read
	assign RD = (~rst) ? 32'b0  : Data_mem[A];

	// write 
	always @(posedge clk) begin
		if (WE) 
			Data_mem[A] <= WD;
	end

	initial begin
		Data_mem[28] = 32'd32;
	end
endmodule