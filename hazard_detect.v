module hazard_detect(readReg1, readReg2, preWriteReg, hazard);
	input [4:0] readReg1, readReg2;
	input [4:0] preWriteReg [0:3];
	output hazard;

	reg temp;

	always @(*) begin
		if (readReg1 != 4'd0 && readReg2 != 4'd0) begin
			temp =
		end
	end

	// control hazard
	/// check if opcode is branch or jump
	// => hold next inst in fetch, pass noop to decode



	// if hazard detect, disable i-fetch and pc
endmodule : hazard_detect
