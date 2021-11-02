module regfile(clk, rstn, readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);
	input clk, rstn;
	input [4:0] readReg1, readReg2, writeReg;
	input [31:0] writeData;
	input regWrite;
	output [31:0] readData1, readData2;

	reg [31:0] registers[0:31];

	always @(posedge clk) begin


endmodule : regfile