module  ULA (A, B, opcode, clock, zero, Out, overflow, carry);

  input  [31:0] A;
  input  [31:0] B;
  input  clock;
  input  [4:0] opcode;
  output  [31:0] Out;
  output reg carry;
  output reg overflow;
  output reg zero;
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

                if (Outest[32]  != 0 ) begin
                $display("overflow");
                overflow=1;
                end


                if (A[31] & B [31] || ( A[31] & B [31] && A [30] & B [30] ) )  begin
                  $display("carry");
                  carry=1;
                end

         end  // add
        5'b00001:begin Outest= (A+B+32'b01);
                Out = Outest;

                if (Outest[32]  != 0 ) begin
                $display("overflow");
                overflow=1;
                end


                if (A[31] & B [31] || ( A[31] & B [31] && A [30] & B [30] ) )  begin
                  $display("carry");
                  carry=1;
                end

        end // addinc

        5'b00011:begin  Outest = (A+32'b01);

                Out = Outest;

                if (Outest == 32'b1 ) begin
                  $display("overflow");
                  overflow=1;
                end


         end // inca
        5'b00100:begin  Out= (A-B-32'b01);

         end // subdec
        5'b00101:begin  Out = (A-B);  end // Sub
        5'b00110:begin  Out = (A-32'b01); end // deca
        5'b01000:begin  Out = (A<<1); end  // lsl
        5'b01001:begin  Out = (A>>>1); end // asr
        5'b10000:begin  Out = 32'b0; end // zeros
        5'b10001:begin  Out = (A&B); end// and
        5'b10010:begin  Out = (~A)&B; end // andnota
        5'b10011:begin  Out = B; end // passb
        5'b10100:begin  Out = A&(~B);end // andnotb
        5'b10101:begin  Out = A;end // passa
        5'b10110:begin  Out = (A^B);end // xor
        5'b10111:begin  Out = (A|B);end // or
        5'b11000:begin  Out = (~A)&(~B);end // nand
        5'b11001:begin  Out = ~(A^B); end // xnor
        5'b11010:begin  Out = ~A; end // passnota
        5'b11011:begin  Out = (~A)|B; end
        5'b11100:begin  Out = ~B; end  // passnotb
        5'b11101:begin  Out = A|(~B); end
        5'b11110:begin  Out = (~A)|(~B);end
        5'b11111:begin  Out = 1;end //ones
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

