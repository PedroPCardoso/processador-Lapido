// Hazard Detection Unit
module HDU(
	id_ex_memRead,
	id_ex_registerRD,
	if_id_registerA,
	if_id_registerB,
	branch,
	enablePC,
	muxSelector
);

input id_ex_memRead, branch;
input [3:0] id_ex_registerRD, if_id_registerA, if_id_registerB;
output enablePC, muxSelector;

assign muxSelector = (branch || (!id_ex_memRead &&
		((id_ex_registerRD == if_id_registerA) || (id_ex_registerRD == if_id_registerB)))) ? 1'b1
		: 1'b0;
assign enablePC = ~muxSelector;

endmodule