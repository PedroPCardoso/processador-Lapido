module ex_mem(clock,
	ALUResult_in,
	memRead_in,
	memWrite_in,
	memToReg_in,
	registerFileDataB_in,
	registerFileWrite_in,
	regWrite_in,
	pcpp_in,
	ALUResult,
	memRead,
	memWrite,
	memToReg,
	registerFileDataB,
	registerFileWrite,
	regWrite,
	pcpp
);

input clock;
input [31:0] ALUResult_in;
input memRead_in, memWrite_in;
input [1:0] memToReg_in;
input [31:0] registerFileDataB_in;
input [3:0] registerFileWrite_in;
input regWrite_in;
input [31:0] pcpp_in;
output reg [31:0] ALUResult;
output reg memRead, memWrite;
output reg [1:0] memToReg;
output reg [31:0] registerFileDataB;
output reg [3:0] registerFileWrite;
output reg regWrite;
output reg [31:0] pcpp;

always @(negedge clock) begin
	ALUResult = ALUResult_in;
	memRead = memRead_in;
	memWrite = memWrite_in;
	memToReg = memToReg_in;
	registerFileDataB = registerFileDataB_in;
	registerFileWrite = registerFileWrite_in;
	regWrite = regWrite_in;
	pcpp = pcpp_in;
end

endmodule