module mem_wb(clock,
	DataOutDataMemory_in,
	memToReg_in,
	ALUResult_in,
	DataOutDataMemory,
	memToReg,
	ALUResult
);

input clock;
input [31:0] DataOutDataMemory_in;
input memToReg_in;
input [31:0] ALUResult_in;
output reg [31:0] DataOutDataMemory;
output reg memToReg;
output reg [31:0] ALUResult;

always @(negedge clock) begin
	DataOutDataMemory = DataOutDataMemory_in;
	memToReg = memToReg_in;
	ALUResult = ALUResult_in;
end

endmodule