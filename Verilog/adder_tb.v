module adder_tb;

reg[31:0] dataA;
reg cin;
wire cout;
wire[31:0] result;

adder DUT (
	.dataA(dataA),
	.cin(cin),
	.cout(cout),
	.result(result)
);

initial begin
	$display("----------------------\nFull-Adder\n----------------------\n");
	dataA = 32'b0000;
	cin = 0;
	$display("Esperado 0000 + 0100 = 100");
	#100
	$display("Resultado: %b", result);
	#100
	dataA = 32'b0100;
	cin = 0;
	$display("Esperado 0100 + 0100 = 1000");
	#100
	$display("Resultado: %b", result);
	#100
	$finish;
end

endmodule;
