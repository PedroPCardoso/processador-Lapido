module adder(dataA/*, cin, cout*/, result);

input[31:0] dataA;
/*input cin;
output cout;*/
output[31:0] result;

assign /*{cout,*/result/*}*/ = dataA + 32'b100/* + cin*/;

endmodule