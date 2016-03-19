module id_ex(clock, registerFileDataA_in, registerFileDataB_in, registerFileWrite_in, pcpp_in, extendedSignal_in, registerFileDataA, registerFileDataB, registerFileWrite, pcpp, extendedSignal);

input clock;
input [31:0] registerFileDataA_in;
input [31:0] registerFileDataB_in;
input [31:0] registerFileWrite_in;
input [31:0] pcpp_in;
input [31:0] extendedSignal_in;
output reg [31:0] registerFileDataA;
output reg [31:0] registerFileDataB;
output reg [31:0] registerFileWrite;
output reg [31:0] pcpp;
output reg [31:0] extendedSignal;

always @(negedge clock) begin
	registerFileDataA = registerFileDataA_in;
	registerFileDataB = registerFileDataB_in;
	registerFileWrite = registerFileWrite_in;
	pcpp = pcpp_in;
	extendedSignal = extendedSignal_in;
end

endmodule;