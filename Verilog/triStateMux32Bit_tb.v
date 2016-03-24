module triStateMux32Bit_tb();

reg [31:0] din_0, din_1, din_2;
reg [1:0] sel;
wire [31:0] mux_out;

triStateMux32Bit triStateMux32Bit(
	.din_0(din_0),
	.din_1(din_1),
	.din_2(din_2),
	.sel(sel),
	.mux_out(mux_out)
);

initial begin
	din_0 = 32'b0;
	din_1 = 32'b1;
	din_2 = 32'b0101010101;
	sel = 2'b00;
	#10;
	$display("Mux Out: %b", mux_out);
	sel = 2'b01;
	#10;
	$display("Mux Out: %b", mux_out);
	sel = 2'b10;
	#10;
	$display("Mux Out: %b", mux_out);
end

endmodule