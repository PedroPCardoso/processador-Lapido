module mem_wb(clock,
	DataOutDataMemory_in,
	memToReg_in,
	ALUResult_in,
	registerFileWrite_in,
	regWrite_in,
	DataOutDataMemory,
	memToReg,
	ALUResult,
	registerFileWrite,
	regWrite
);

input clock;
input [31:0] DataOutDataMemory_in;
input memToReg_in;
input [31:0] ALUResult_in;
input [3:0] registerFileWrite_in;
input regWrite_in;
output reg [31:0] DataOutDataMemory;
output reg memToReg;
output reg [31:0] ALUResult;
output reg [3:0] registerFileWrite;
output reg regWrite;

always @(negedge clock) begin
	DataOutDataMemory = DataOutDataMemory_in;
	memToReg = memToReg_in;
	ALUResult = ALUResult_in;
	registerFileWrite = registerFileWrite_in;
	regWrite = regWrite_in;
end

endmodule