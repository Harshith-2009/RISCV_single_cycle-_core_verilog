module Single_cycle_top_tb();

	reg clk, rst;

	Single_Cycle_Top Single_Cycle_Top( 
				.clk(clk),
				.rst(rst)
	);

	initial begin
		$dumpfile("Single Cycle.vcd");
		$dumpvars(0);
	end

	initial begin
		clk = 0;
		forever #50 clk = ~clk;
	end

	initial 
	begin
		rst = 1'b0;
		#100;

		rst = 1'b1;
		#300;
		$finish;
	end

endmodule