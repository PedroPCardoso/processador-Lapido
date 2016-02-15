module  ULA (A, B, opcode, Flag, Out);

  input [WIDTH-31:0] A, B;
  input opcode[WIDTH-4:0];
  output [WIDTH-31:0] Out, Flag;


  initial begin
    A=32'b00000000000000000000000000000000;
    B=32'b00000000000000000000000000000000;
    opcode=0;
  end

  always @ ( opcode ) begin


    case (opcode )

        00000:begin  Out = (A+B); end  // add
        00001:begin  Out = (A+B+1); end // addinc
        00011:begin  Out = (A+1); end // inca
        00100:begin  Out = (A-B-1); end // subdec
        00101:begin  Out = (A-B);  end // Sub
        00110:begin  Out = (A-1); end // deca
        01000:begin  Out = (A+B); end  // lsl
        01001:begin  Out = (A+B); end // asr
        10000:begin  Out = 0; end // zeros
        10001:begin  Out = (A&B); end// and
        10010:begin  Out = (~A&B); end // andnota
        10011:begin  Out = B; end // passb
        10100:begin  Out = (A&~B); // andnotb
        10101:begin  Out = A;end // passa
        10110:begin  Out = (A^B);end // xor
        10111:begin  Out = (A|B);end // or
        11000:begin  Out = (~A&~B);end // nand
        11001:begin  Out = ~(A^B); end // xnor
        11010:begin  Out = ~A; end // passnota
        11011:begin  Out = (~A)|B; end
        11100:begin  Out = ~B; end
        11101:begin  Out = A|(~B); end
        11110:begin  Out = ~A|~B;end
        11111:begin  Out = 1; //ones
        default:break;
        endcase
  end


endmodule
