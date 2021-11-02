module control_unit(clk,rstn, opcode, funct, regWrite, memToReg, memRead, memWrite, branch, ALUOp, ALUSrc, RegDst);
	input clk, rstn;
	input [5:0] opcode, funct;

	output reg ALUSrc, regWrite, memToReg, memRead, memWrite, branch;
	output reg [1:0] ALUOp;


	parameter 	RTYPE = 7'b0110011,
				ITYPE = 7'b00x0011,
				STYPE = 7'b0100011,
				BTYPE = 7'b1100011,
				UTYPE = 7'b0x10111,
				JTYPE = 7'b1101111;

	always @(*) begin
		case (opcode)
			RTYPE: begin
				ALUSrc = 0;
				memToReg = 0;
				regWrite = 1;
				memRead = 0;
				memWrite = 0;
				branch = 0;
				ALUOp = 2'b10;
			end
			ITYPE: begin

				if (opcode[3] == 0) // load inst.
					ALUSrc = 1;
					memToReg = 1;
					regWrite = 1;
					memRead = 1;
					memWrite = 0;
					branch = 0;
					ALUOp = 2'b00;
				else				// imm. arithmetic
					ALUSrc = 1;
					memToReg = 0;
					regWrite = 1;
					memRead = 0;
					memWrite = 0;
					branch = 0;
					ALUOp = 2'b;
			end
			STYPE: begin
				ALUOp = 2'b00;
			end
			BTYPE: begin
				ALUOp = 2'b01;
	end

endmodule : control_unit
