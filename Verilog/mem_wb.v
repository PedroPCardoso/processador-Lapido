module mem_wb(clock,
	DataOutDataMemory_in,
	memToReg_in,
	DataOutDataMemory,
	memToReg
);

input clock;
input [31:0] DataOutDataMemory_in;
input memToReg_in;
output reg [31:0] DataOutDataMemory;
output reg memToReg;

always @(negedge clock) begin
	DataOutDataMemory = DataOutDataMemory_in;
	memToReg = memToReg_in;
end

endmodule