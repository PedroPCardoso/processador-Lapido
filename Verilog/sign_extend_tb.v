module sign_extend_tb();
	reg[1:0] opcode;
	reg[15:0] extend;
	wire[31:0] extended;

	sign_extend sign_extend(
		.opcode(opcode),
		.extend(extend),
		.extended(extended)
	);

	initial begin
		opcode = 2'b00;
		extend = 16'b1111000000001111;
		$display("Extend 15: %b", extend[15]);
		#10;
		opcode = 2'b00;
		extend = 16'b0111000000001111;
		$display("Extend 15: %b", extend[15]);
		#10;
		opcode = 2'b01;
		extend = 16'b1111000000001111;
		#10;
		opcode = 2'b10;
		extend = 16'b1111000000001111;
	end

endmodule
