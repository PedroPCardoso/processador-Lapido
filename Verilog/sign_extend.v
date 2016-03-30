module sign_extend(opcode, extend, extended);

	input [1:0] opcode;
	input [15:0] extend;
	output [31:0] extended;

	wire [31:0] extendedWithSignal, extendedZeroOnLow, extendedZeroOnHigh;

	assign extendedWithSignal[31:16] = (extend[15]) ? 16'b1111111111111111 : 16'b0 ;
	assign extendedWithSignal[15:0] = extend;

	assign extendedZeroOnLow[31:16] = extend;
	assign extendedZeroOnLow[15:0] = 16'b0;

	assign extendedZeroOnHigh[31:16] = 16'b0;
	assign extendedZeroOnHigh[15:0] = extend;

	assign extended = (opcode == 2'b00) ? extendedWithSignal
			: (opcode == 2'b01) ? extendedZeroOnLow
			: extendedZeroOnHigh;

endmodule
