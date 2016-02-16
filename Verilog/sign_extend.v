module sign_extend(extend, extended);

input[15:0] extend;
output[31:0] extended;

assign extended = extend;
	
endmodule