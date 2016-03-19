module if_id(clock, pcpp_in, instruction_in, pcpp, instruction);

input clock;
input [31:0] pcpp_in;
input [31:0] instruction_in;
output reg [31:0] pcpp;
output reg [31:0] instruction;

always @(negedge clock) begin
	instruction = instruction_in;
	pcpp = pcpp_in;
end

endmodule;