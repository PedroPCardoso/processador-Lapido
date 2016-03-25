// Forwarding Unit
module FU(
	ex_mem_regWrite,
	ex_mem_registerRD,
	mem_wb_regWrite,
	mem_wb_registerRD,
	id_ex_registerA,
	id_ex_registerB,
	forwardA,
	forwardB
);

input ex_mem_regWrite, mem_wb_regWrite;
input [3:0] ex_mem_registerRD, mem_wb_registerRD;
input [3:0] id_ex_registerA, id_ex_registerB;
output [1:0] forwardA;
output [1:0] forwardB;

assign forwardA = ((ex_mem_regWrite && (ex_mem_registerRD == id_ex_registerA)) ? 2'b10
		:  (mem_wb_regWrite && (mem_wb_registerRD == id_ex_registerA)) ? 2'b01
		:  2'b00);

assign forwardB = ((ex_mem_regWrite && (ex_mem_registerRD == id_ex_registerB)) ? 2'b10 
		:  (mem_wb_regWrite && (mem_wb_registerRD == id_ex_registerB)) ? 2'b01
		:  2'b00);

endmodule