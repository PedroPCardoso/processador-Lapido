module registerFile_tb();

reg enable;
reg [3:0] IN_OUT_A;
reg [3:0] OUT_B;
reg reset;
reg clock;
wire [31:0] A, B;
reg [31:0] E;

always begin
	#5;
	clock=~clock;
end

initial begin
	clock = 1'b1;
	enable = 1'b0;
	reset = 1'b1;

	#5
	reset = 1'b0;
	enable = 1'b0;
	IN_OUT_A = 4'b100;
	OUT_B = 4'b0;
	reset = 1'b0;
	#5
	reset = 1'b0;
	enable = 1'b1;
	IN_OUT_A = 4'b100;
	OUT_B = 4'b0;
	E = 32'b111111;
	#15
	enable = 1'b0;
	IN_OUT_A = 4'b100;
	OUT_B = 4'b0;
	reset = 1'b0;
end

registerFile registerFile(
	.enable(enable),
	.IN_OUT_A(IN_OUT_A),
	.OUT_B(OUT_B),
	.reset(reset),
	.clock(clock),
	.A(A),
	.B(B),
	.E(E)
);

endmodule