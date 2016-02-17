module ULA_TB();

  reg [31:0] a, b;
  wire flag;
  wire [31:0] out;
  reg [4:0] opcode;

   ULA ULA(
      .A(a),
      .B(b),
      .opcode(opcode),
      .Flag(flag),
      .Out(out)
      );

    initial begin
      a=32'b00000000000000000000000000000001;
      b=32'b00000000000000000000000000000000;
      opcode=5'b0000;
      $display(out);
      #100 ;
      a=32'b00000000000000000000000000000001;
      b=32'b00000000000000000000000000000000;
      opcode=5'b00001;


      $display (out);


      end







endmodule
