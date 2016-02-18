module sign_extend_tb();

	reg[15:0] extend;
	wire[31:0] extended;

	sign_extend DUT (
		.extend(extend),
		.extended(extended)
	);

	initial begin
				extend = 16'b1000111111111111;
				#100;
				$display("%b",extend);
				$display("%b",extended);
				extend = 16'b1110101010101010;
				#100;
				$display("%b",extend);
				$display("%b",extended);


		end

endmodule
