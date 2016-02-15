module  ULA (A, B, opcode, Flag, Out);

  input reg [31:0] A, B;
  input reg opcode[4:0];
  reg [31:0] resultado;
  output [31:0] Out, Flag;


  initial begin
    A=32'b00000000000000000000000000000000;
    B=32'b00000000000000000000000000000000;
    opcode=5'b00000;
  end

  always @ ( opcode ) begin


    case (opcode ) 

        5'b00000:begin  resultado = (A+B); end  // add
        5'b00001:begin  resultado = (A+B+1); end // addinc
        5'b00011:begin  resultado = (A+1); end // inca
        5'b00100:begin  resultado = (A-B-1); end // subdec
        5'b00101:begin  resultado = (A-B);  end // Sub
        5'b00110:begin  resultado = (A-1); end // deca
        5'b01000:begin  resultado = (A+B); end  // lsl
        5'b01001:begin  resultado = (A+B); end // asr
        5'b10000:begin  resultado = 0; end // zeros
        5'b10001:begin  resultado = (A&B); end// and
        5'b10010:begin  resultado = (~A&B); end // andnota
        5'b10011:begin  resultado = B; end // passb
        5'b10100:begin  resultado = (A&~B); end // andnotb
        5'b10101:begin  resultado = A;end // passa
        5'b10110:begin  resultado = (A^B);end // xor
        5'b10111:begin  resultado = (A|B);end // or
        5'b11000:begin  resultado = (~A&~B);end // nand
        5'b11001:begin  resultado = ~(A^B); end // xnor
        5'b11010:begin  resultado = ~A; end // passnota
        5'b11011:begin  resultado = (~A)|B; end
        5'b11100:begin  resultado = ~B; end
        5'b11101:begin  resultado = A|(~B); end
        5'b11110:begin  resultado = ~A|~B;end
        5'b11111:begin  resultado = 1; end//ones
        default:break;
        endcase

   Out = resultado;
  end


endmodule
