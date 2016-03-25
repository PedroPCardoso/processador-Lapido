// Forwarding Unit
module FU(
	ex_mem_regWrite,
	ex_mem_registerRD,
	id_ex_registerA,
	id_ex_registerB,
	forwardA,
	forwardB
);

input ex_mem_regWrite;
input [3:0] ex_mem_registerRD;
input [3:0] id_ex_registerA, id_ex_registerB;
output forwardA;
output [1:0] forwardB;

assign forwardA = ((ex_mem_regWrite && (ex_mem_registerRD == id_ex_registerA)) ? 1'b1 : 1'b0);

assign forwardB = ((ex_mem_regWrite && (ex_mem_registerRD == id_ex_registerA)) ? 2'b10 : 2'b00);

endmodule