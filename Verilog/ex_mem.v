module ex_mem(clock,
	ALUResult_in,
	memRead_in,
	memWrite_in,
	memToReg_in,
	ALUResult,
	memRead,
	memWrite,
	memToReg
);

input clock;
input [31:0] ALUResult_in;
input memRead_in, memWrite_in, memToReg_in;
output reg [31:0] ALUResult;
output reg memRead, memWrite, memToReg;

always @(negedge clock) begin
	ALUResult = ALUResult_in;
	memRead = memRead_in;
	memWrite = memWrite_in;
	memToReg = memToReg_in;
end

endmodule