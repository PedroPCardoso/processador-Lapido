  module  ULA (A, B, opcode, Flag, Out);

  input  [31:0] A;
  input  [31:0] B;
  input  [7:0] opcode;
  output [31:0] Out;
  output zero;


  wire signed [31:0] A, B; // dados para operacao
	wire [4:0] opcode;
	reg signed [31:0] Out;
	reg zero;

  initial begin
    Flag=0;
  end

  always @ ( opcode ) begin


    case (opcode )

        8'b00100000:begin  Out = (A+B); end  // add
        8'b00100001:begin  Out = (A+B+32'b01); end // addinc
        8'b00100011:begin  Out = (A+32'b01); end // inca
        8'b00100100:begin  Out = (A-B-32'b01); end // subdec
        8'b00100101:begin  Out = (A-B);  end // Sub
        8'b00100110:begin  Out = (A-32'b01); end // deca
        8'b00101000:begin  Out = (A<<1); end  // lsl
        8'b00101001:begin  Out = (A>>>1); end // asr
        8'b00110000:begin  Out = 32'b0; end // zeros
        8'b00110001:begin  Out = (A&B); end// and
        8'b00110010:begin  Out = (~A)&B; end // andnota
        8'b00110011:begin  Out = B; end // passb
        8'b00110100:begin  Out = A&(~B);end // andnotb
        8'b00110101:begin  Out = A;end // passa
        8'b00110110:begin  Out = (A^B);end // xor
        8'b00110111:begin  Out = (A|B);end // or
        8'b00111000:begin  Out = (~A)&(~B);end // nand
        8'b00111001:begin  Out = ~(A^B); end // xnor
        8'b00111010:begin  Out = ~A; end // passnota
        8'b00111011:begin  Out = (~A)|B; end
        8'b00111100:begin  Out = ~B; end  // passnotb
        8'b00111101:begin  Out = A|(~B); end
        8'b00111110:begin  Out = (~A)|(~B);end
        8'b00111111:begin  Out = 1;end //ones


 // JUMP
        //Jump True condição de igual dade
        5'b1010100:begin if A==B: 
        default:;
        endcase
  end


endmodule
