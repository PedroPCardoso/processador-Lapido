module ULA_TB();

  reg [31:0] a, b;
  wire flag;
  wire  [31:0] out;
  reg [4:0] opcode;
  wire carry;

   ULA ULA(
      .A(a),
      .B(b),
      .opcode(opcode),
      .zero(flag),
      .Out(out),
      .Carry(carry)
      );

    initial begin
      #100 ;
      a=32'b00000000000000000000000000000001;

      b=32'b00000000000000000000000000000010;

      opcode=5'b00000;  // add
      #100;

      $display(out);

      if(out==32'b00000000000000000000000000000011)begin
          $display("Teste da Soma OK ");
      end



    //  $display(out+ "ssaiu isso");
      #100 ;
      a=32'b111111111111111111111111111111100;
      $display(a);
      b=32'b111111111111111111111111111111111;
      $display(b);
      opcode=5'b00001;  // addinc
      $display("resultado");
        #100 ;
      $display (out);
      if(out==32'b00000000000000000000000000000010)begin
          $display("Teste da Soma mais um OK ");
      end
/*
end
endmodule
*/



      a=32'b00000000000000000000000000000011;
      $display(a);
      b=32'b00000000000000000000000000000000;
      $display(b);
      opcode=5'b00011; // inca
      $display (out);
      $display ("antes");
      #100 ;
      $display (out);
      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste da Soma A mais um OK ");
      end

      #100;
      $display (out);

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000001;
      opcode=5'b00100;  // subdec
      #100 ;
      if(out==32'b00000000000000000000000000000011)begin
          $display("Teste da Soma A -B-1 OK ");
      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000100;
      opcode=5'b00101; // Sub

      #100 ;

      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste da Soma A-B OK ");
      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b00110;  // deca

      #100 ;
      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste da Soma A-1 OK ");
      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b01000;  // lsl
      #100 ;
      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste q nao testei  OK ");
      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b01001;  //asr

      #100 ;

      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste q nao testei  OK ");
      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b10000;
      #100 ;
      if(out==32'b00000000000000000000000000000000)begin
          $display("Teste out =0 ");
      end

      a=32'b00000000000000000000000000000001;
      b=32'b00000000000000000000000000000001;
      opcode=5'b10001;
      #100 ;
      if(out==32'b00000000000000000000000000000000)begin
          $display("Teste And  ");
      end


      end
      endmodule
