module mux15bits(
din_0      , // Mux first input
din_1      , // Mux second input
sel        , // Select input
mux_out      // Mux output
);

input [14:0] din_0, din_1;
input sel;

output [14:0] mux_out;

wire [14:0] mux_out;

assign mux_out = (sel) ? din_1 : din_0;

endmodule