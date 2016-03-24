module triStateMux32Bit(
din_0,		// Mux first input
din_1,		// Mux second input
din_2,		// Mux third input
sel,		// Select input
mux_out		// Mux output
);

input [31:0] din_0, din_1, din_2;
input [1:0] sel;
output [31:0] mux_out;

assign mux_out = ((sel == 2'b00) ? din_0 :
   ((sel == 2'b01) ? din_1 :
   ((sel == 2'b10) ? din_2 :
   32'bz)));

endmodule