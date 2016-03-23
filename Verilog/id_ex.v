module id_ex(clock,
	registerFileDataA_in,
	registerFileDataB_in,
	registerFileWrite_in,
	pcpp_in,
	extendedSignal_in,
	ALUOp_in,
	ALUSrc_in,
	memRead_in,
	memWrite_in,
	memToReg_in,
	regWrite_in,
	branch_in,
	registerFileDataA,
	registerFileDataB,
	registerFileWrite,
	pcpp,
	extendedSignal,
	ALUOp,
	ALUSrc,
	memRead,
	memWrite,
	memToReg,
	regWrite,
	branch
);

input clock;
input [31:0] registerFileDataA_in;
input [31:0] registerFileDataB_in;
input [3:0] registerFileWrite_in;
input [31:0] pcpp_in;
input [31:0] extendedSignal_in;
input [4:0] ALUOp_in;
input ALUSrc_in;
input memRead_in;
input memWrite_in;
input memToReg_in;
input regWrite_in;
input branch_in;
output reg [31:0] registerFileDataA;
output reg [31:0] registerFileDataB;
output reg [3:0] registerFileWrite;
output reg [31:0] pcpp;
output reg [31:0] extendedSignal;
output reg [4:0] ALUOp;
output reg ALUSrc;
output reg memRead;
output reg memWrite;
output reg memToReg;
output reg regWrite;
output reg branch;

always @(negedge clock) begin
	registerFileDataA = registerFileDataA_in;
	registerFileDataB = registerFileDataB_in;
	registerFileWrite = registerFileWrite_in;
	pcpp = pcpp_in;
	extendedSignal = extendedSignal_in;
	ALUOp = ALUOp_in;
	ALUSrc = ALUSrc_in;
	memRead = memRead_in;
	memWrite = memWrite_in;
	memToReg = memToReg_in;
	regWrite = regWrite_in;
	branch = branch_in;
end

endmodule