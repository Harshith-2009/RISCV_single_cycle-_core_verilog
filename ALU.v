module alu(A,B,ALUControl, Result, Z ,N, V, C);
	//declaring port types and lengths
	input [31:0] A, B;
	input [2:0] ALUControl;
	output [31:0] Result;
	output Z,N,V,C;

	// declaring wires 
	wire [31:0] a_and_b, a_or_b, b_not, b_mux_select, sum, mux_2, slt;
	wire cout;
	// Logic design 

	//And operation
	assign a_and_b = A & B;

	//Or operation
	assign a_or_b = A | B;

	// sum and sub operations
    assign b_not = ~B;
	assign b_mux_select = ALUControl[0] ? b_not : B;
	assign {cout, sum} = A + b_mux_select + ALUControl[0];
	
	// zero extension
	assign slt = {{31{1'b0}}, sum[31]};

	//4by1 mux 
	assign mux_2 = (ALUControl[2:0] == 3'b000) ? sum : 
				   (ALUControl[2:0] == 3'b001) ? sum : 
				   (ALUControl[2:0] == 3'b010) ? a_and_b : 
				   (ALUControl[2:0] == 3'b011) ? a_or_b :
				   (ALUControl[2:0] == 3'b101) ? slt : 32'h00000000;

	assign Result = mux_2; 

	assign Z = &(~Result); // zero flag

	assign N = Result[31]; // negative flag

	assign C = ~ALUControl[1] & cout; // carry flag

	assign V = (~ALUControl[1]) & (A[31]^sum[31]) & (~(A[31]^B[31]^ALUControl[0])); 

endmodule