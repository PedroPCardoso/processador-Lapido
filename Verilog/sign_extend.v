module sign_extend(clock,opcode , extend, extended);

	input [15:0] extend;
	output [31:0] extended;

	wire [15:0] extend;
	reg[31:0] extended;

	always @ ( clock ) begin

		if (opcode == 2'b11) begin
					case ( extend[15] )
					1'b0:begin
							extended[31:16] = 16'b0000000000000000 ;
							extended[15:0] = extend;
					end
					1'b1:begin
							extended[31:16] = 16'b1111111111111111 ;
							extended[15:0] = extend;
					end
					endcase
			end


		else begin

							case ( extend[0] )
							1'b0:begin
									extended[31:16] =extend;
									extended[15:0] =  16'b0000000000000000 ;
							end
							1'b1:begin
									extended[31:16] =   extend;
									extended[15:0] =16'b1111111111111111;
							end

							endcase


		end


		end
endmodule
