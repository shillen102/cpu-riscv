`define MEM32BIT 4294967296
`define MEM16BIT 65535

module instruction_fetch(clk,rst,instruction);
	input clk;
	input rst;
	output [31:0] instruction;

	reg [31:0] pc, next_pc;
	reg [31:0] imem [0:MEM16BIT];

	@always @(posedge clk or negedge rst) begin
		if(~rst) begin
			pc <= 0;
		end else begin
			pc <= next_pc;
		end
	end

	assign next_pc = pc + 4;

	assign instruction = imem[pc];

endmodule : instruction_fetch