module sign_extend_tb;

reg[15:0] extend;
wire[31:0] extended;

sign_extend DUT (
	.extend(extend),
	.extended(extended)
);

initial begin
	extend = 16'b1111111111111111;
    #50
	extend = 16'b1110101010101010;
    #50
	$finish;
end

endmodule