module adder_tb;

reg[31:0] dataA;
reg[31:0] dataB;
reg cin;
wire cout;
wire[31:0] result;

adder DUT (
	.dataA(dataA),
	.dataB(dataB),
	.cin(cin),
	.cout(cout),
	.result(result)
);

initial begin
	$display("----------------------\nFull-Adder\n----------------------\n");
	dataA = 32'b11;
	dataB = 32'b10;
	cin = 0;
	#50
	$finish;
end

endmodule;