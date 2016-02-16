module adder(dataA, dataB, cin, cout, result);

input[31:0] dataA;
input[31:0] dataB;
input cin;
output cout;
output[31:0] result;

assign {cout,result} = dataA + dataB + cin;

endmodule