module alu(ALUCtl, rs1, rs2, zero, ALUresult);
	input [3:0] ALUCtl;
	input [31:0] rs1, rs2;
	output reg zero;
	output reg [31:0] ALUresult;

	parameter 	ANDOp = 4'b0000,
				OROp  = 4'b0001,
				ADDOp = 4'b0010,
				SUBOp = 4'b0110;

	always @(*) begin
		case(ALUCtl)
			ANDOp: 	
				ALUresult = rs1 & rs2;
			OROp: 
				ALUresult = rs1 | rs2;
			ADDOp:
				ALUresult = rs1 + rs2;
			SUBOp: begin
				ALUresult = rs1 - rs2;
				zero = (ALUresult == 32'b0) ? 1 : 0;
			end
			default:
				ALUresult = 32'bx;
				zero = 1'bx;
		endcase // ALUCtl
	end
endmodule : alu