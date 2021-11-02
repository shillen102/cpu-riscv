module alu_control(funct7, funct3, ALUOp, ALUCtl);
	input [6:0] funct7;
	input [2:0] funct3;
	input [1:0] ALUOp;
	output reg [3:0] ALUCtl;

	parameter 	ANDOp = 4'b0000,
				OROp  = 4'b0001,
				ADDOp = 4'b0010,
				SUBOp = 4'b0110;	

	always @(*) begin
		if (ALUOp == 2'b00) begin				// load/store
			ALUOp = ADDOp;
		end
		// else if (ALUOp[0] == 1'b1) begin
		else if (ALUOp == 2'b01) begin			// beq
			ALUOp = SUBOp;
		end
		// else if (ALUOp[1] == 1'b1) begin
		else if (ALUOp == 2'b10) begin			// R-type
			if (funct3 == 3'b000) begin
				if (funct7[5] == 1'b1) begin
					ALUOp = SUBOp;
				end
				else begin
					ALUOp = ADDOp;
				end
			end
			else if (funct3 == 3'b111) begin
				ALUOp = ANDOp;
			end
			else if (funct3 == 3'b110) begin
				ALUOp = OROp;
			end
			else begin
				ALUOp = 4'bx; 
			end
	end
endmodule : alu_control