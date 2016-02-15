module ULA_TB();

  reg [31:0] a, b;
  reg Flag;
  logic [31:0] out;
  reg opcode;

   ULA ULA(
      .A(a),
      .B(b),
      .opcode(opcode),
      .Flag(Flag)
      .Out(out),
      );

    initial begin
      a=32'b00000000000000000000000000000000
      b=32'b00000000000000000000000000000000
      Flag=0;
      out=32'b00000000000000000000000000000000
      opcode=0;

    end

    always opcode begin

      case (opcode) begin
      5'b00000 : break;
      5'b00001: break;
      5'b00011:break;

      default : $display("Fodeu")
      endcase






    end

endmodule
