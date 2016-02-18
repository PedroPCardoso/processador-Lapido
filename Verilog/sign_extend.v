module sign_extend(extend, extended);

	input [15:0] extend;
	output [31:0] extended;

	wire [15:0] extend;
	reg[31:0] extended;



	always @ ( extend ) begin

		 //always @ ( * ) begin    eu acho que precisa de uma condicao para isso mas ainda nao tenho certeza.

				if (extend[15]==0) begin // encontrar uma forma de extender esse sinal, pq ele ja esta entrando nos ifs, mas nao consigo add os bits
								$display("entrou nessa zorra !");
								extended = 16'b0000000000000000 + extend ;

								end
				if (extend[15]==1) begin
								$display ( "entrou nesse wtf");
							extended = 16'b1111111111111111 + extend ;

								end

	end
	 // send
endmodule
