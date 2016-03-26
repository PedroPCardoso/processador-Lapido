// Hazard Detection Unit
module HDU(
	id_ex_memRead,
	id_ex_registerRD,
	if_id_registerA,
	if_id_registerB,
	enablePC,
	muxSelector
);

input id_ex_memRead;
input [3:0] id_ex_registerRD, if_id_registerA, if_id_registerB;
output enablePC, muxSelector;

assign muxSelector = (!id_ex_memRead &&
		((id_ex_registerRD == if_id_registerA) || (id_ex_registerRD == if_id_registerB))) ? 1'b1
		: 1'b0;
assign enablePC = ~muxSelector;

endmodule