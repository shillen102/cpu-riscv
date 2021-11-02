`timescale 1ns / 1ns
`define CLK_PERIOD 10
module instruction_fetch_tb();
	reg clk;
	reg rst;
	wire [31:0] instruction;
	// reg [31:0] imem2 [0:2];

	always #(`CLK_PERIOD/2) clk = ~clk;

	instruction_fetch if_unit(.clk(clk), .rst(rst), .instruction(instruction));

	initial begin
		clk = 0;
		rst = 0;
		#10;
		// $readmemb("C:/_Project/cpu-riscv/simple.txt", imem2);
		#10 rst = 1;
		$readmemb("C:/_Project/cpu-riscv/simple.txt", if_unit.imem);
		#10;
		$monitor("Instruction: %x\n",instruction);
		#100;
		$finish;
	end


endmodule : instruction_fetch_tb