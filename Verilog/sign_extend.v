module sign_extend(extend, extended);

	input [15:0] extend;
	output [31:0] extended;

	wire [15:0] extend;
	reg[31:0] extended;

	always @ ( extend ) begin
		extended[31:16] = 16'b0000000000000000 ;
		extended[15:0] = extend;
	end
endmodule
