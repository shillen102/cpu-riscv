`timescale 1ns / 1ns
`define CLK_PERIOD 10
module instruction_fetch_tb();
	reg clk;
	reg rst;
	wire [31:0] instruction;

	always #(CLK_PERIOD/2) clk = ~clk;

	instruction_fetch if_unit(.clk(clk), .rst(rst), .instruction(instruction));

	initial begin
		clk = 0;
		rst = 0;
		#10 rst = 1;
		$monitor("Instruction: %x\n",instruction);
		#100;
		$finish;
	end

	initial begin
		$readmemh("simple.bin", if_unit.imem);
	end


endmodule : instruction_fetch_tb