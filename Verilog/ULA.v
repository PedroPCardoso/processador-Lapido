module  ULA (A, B, opcode, clock, zero, Out, overflow, carry,neg);

  input  [31:0] A;
  input  [31:0] B;
  input  clock;
  input  [4:0] opcode;
  output  [31:0] Out;
  output reg carry;
  output reg overflow;
  output reg zero;
  output reg neg;
  reg [32:0] Outest;
  wire signed [31:0] A, B; // dados para operacao
  wire [4:0] opcode;
  reg signed [31:0] Out;


  initial begin
    zero=0;
  end

  always @ ( clock ) begin


    case ( opcode )

        5'b00000:begin  Outest = (A+B);
            Out = Outest;

            overflow = B > 0 ? (2147483647 - B) < A : (-2147483648 - B) > A;


            if (A[31] & B [31] || ( A[31] & B [31] && A [30] & B [30] ) )  begin
              $display("carry");
              carry=1;
            end

         end  // add
        5'b00001:begin Outest= (A+B+32'b01);
            Out = Outest;
            zero = Out == 0;
            neg = Out < 0;
            overflow = B > 0  ? (2147483647 - B) < A : (-2147483648 - B) > A;

            if (A[31] & B [31] || ( A[31] & B [31] && A [30] & B [30] ) )  begin
              $display("carry");
              carry=1;
            end

        end // addinc

        5'b00011:begin  Outest = (A+32'b01);

            Out = Outest;
            zero = Out == 0 ? 1 : 0;
            neg = Out < 0 ? 1 : 0;
            overflow = B > 0 ? (2147483647 - B) < A : (-2147483648 - B) > A;

         end // inca
        5'b00100:begin  Out= (A-B-32'b01);

         end // subdec
        5'b00101:begin  Out = (A-B);
            zero = Out == 0;
            neg = Out < 0;
            overflow = B > 0 ? (2147483647 - B) < A : (-2147483648 - B) > A;

        end // Sub
        5'b00110:begin  Out = (A-32'b01);
            zero = Out == 0 ? 1 : 0;
            neg = Out < 0 ? 1 : 0;
            overflow = B > 0 ? (2147483647 - B) < A : (-2147483648 - B) > A;
        end // deca


        5'b01000:begin  Out = (A<<1);
            zero = Out == 0 ? 1 : 0;
            neg = Out < 0 ? 1 : 0;
            overflow = 0;

        end  // lsl
        5'b01001:begin  Out = (A>>>1); end // asr
        5'b10000:begin  Out = 32'b0;
            neg=0;
            carry=0;
            overflow=0;
            zero=1;
          end // zeros
        5'b10001:begin  Out = (A&B); end// and
        5'b10010:begin  Out = (~A)&B;
            carry=0;
            overflow=0;
        end // andnota
        5'b10011:begin  Out = B;
            zero = Out == 0;
            neg = Out < 0;
            overflow = 0;
            carry = 0;
        end // passb
        5'b10100:begin  Out = A&(~B);end // andnotb
        5'b10101:begin  Out = A;
            zero = Out == 0;
            neg = Out < 0;
            overflow = 0;
            carry = 0;
        end // passa

        5'b10110:begin  Out = (A^B);
            zero = Out == 0;
            neg = Out < 0;
            overflow = 0;
            carry = 0;
        end // xor

        5'b10111:begin  Out = (A|B);
            zero = Out == 0;
            neg = Out < 0;
            overflow = 0;
            carry = 0;
        end // or

        5'b11000:begin  Out = (~A)&(~B);
            zero = Out == 0 ? 1 : 0;
            neg = Out < 0 ? 1: 0;
            overflow = 0;
            carry = 0;
        end // nand

        5'b11001:begin  Out = ~(A^B);
            zero = Out == 0 ? 1 : 0;
            neg = Out < 0 ? 1 : 0;
            overflow = 0;
            carry = 0;
          end // xnor
        5'b11010:begin  Out = ~A;
            neg = Out < 0;
            zero = Out == 0;
            overflow = 0;
            carry = 0;
        end // passnota
        5'b11011:begin  Out = (~A)|B;
            neg=0;
            zero=0;
            carry=0;
            overflow=0;
        end
        5'b11100:begin  Out = ~B;
            neg = Out < 0;
            zero = Out == 0;
            overflow = 0;
            carry = 0;

        end  // passnotb
        5'b11101:begin  Out = A|(~B);
            neg = Out < 0;
            zero = Out == 0;
            overflow = 0;
            carry = 0;
        end
        5'b11110:begin  Out = (~A)|(~B);
            neg = Out < 0;
            zero = Out == 0;
            overflow = 0;
            carry = 0;
          end
        5'b11111:begin  Out = 32'b11111111111111111111111111111111;
            neg=0;
	    zero=0;
            carry=0;
            overflow=0;

              end //ones
      	// beq
      	5'b00010:begin
        		if(A==B) begin
        			$display("Condicao verdadeira");
        			zero = 1;
        		end else begin
        			$display("Condicao falsa");
        			zero = 0;
        		end
      	end
      	// bne
      	5'b00111:begin
        		if(A!=B) begin
        			$display("Condicao verdadeira");
        			zero = 1;
        		end else begin
        			$display("Condicao falsa");
        			zero = 0;
        		end
      	end
      	// jump
      	5'b01010:begin
        		zero = 1;
      	end
      	5'b01011:begin Out[15:0]= A[15:0];
      			Out[31:16] = B[31:16];
      		end	// Atribuicao menos sig A
      	5'b01100:begin Out[31:16] = A[31:16];
      			Out[15:0] = B[15:0];
      		end	// Atribuicao menos sig B
              default:;
              endcase
  end

endmodule
