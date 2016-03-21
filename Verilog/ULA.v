  module  ULA (A, B, opcode, zero, Out);

  input  [31:0] A;
  input  [31:0] B;
  input  [4:0] opcode;
  output [31:0] Out;
  output reg zero;

  wire signed [31:0] A, B; // dados para operacao
	wire [4:0] opcode;
	reg signed [31:0] Out;

  initial begin
    zero=0;
  end

  always @ ( opcode ) begin


    case ( opcode )

        5'b00000:begin  Out = (A+B); end  // add
        5'b00001:begin  Out = (A+B+32'b01); end // addinc
        5'b00011:begin  Out = (A+32'b01); end // inca
        5'b00100:begin  Out = (A-B-32'b01); end // subdec
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
        default:;
        endcase
  end


endmodule