module sign_extend(extend, extended);

input [15:0] extend;
output [31:0] extended;

wire [15:0] extend;
reg[31:0] extended;


initial begin

 //always @ ( * ) begin    eu acho que precisa de uma condicao para isso mas ainda nao tenho certeza.

		if (extend[15]==0) begin

						extended = 32'b0000000000000000 + extend ;

						end
		else if (extend[15]==0) begin

		extended = 32'b1111111111111111 + extend ;

						end
end

 // send
endmodule
