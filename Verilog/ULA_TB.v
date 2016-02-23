module ULA_TB();

  reg [31:0] a, b;
  wire flag;
  wire  [31:0] out;
  reg [4:0] opcode;

  reg [5:0] soma ;
   ULA ULA(
      .A(a),
      .B(b),
      .opcode(opcode),
      .Flag(flag),
      .Out(out)
      );

    initial begin
      #100 ;
      a=32'b00000000000000000000000000000001;

      b=32'b00000000000000000000000000000010;

      opcode=5'b0000;  // add
      #100;


      if(out==32'b00000000000000000000000000000011)begin
          $display("Teste da Soma OK ");
          soma = 1;
          $display(soma);
      end





    //  $display(out+ "ssaiu isso");
      #100 ;
      a=32'b00000000000000000000000000000001;

      b=32'b00000000000000000000000000000001;

      opcode=5'b00001;  // addinc

      #100 ;
      if(out==32'b00000000000000000000000000000011)begin
          $display("Teste da Soma A+B  mais um OK ");
          soma = 2;
          $display(soma);
      end





      a=32'b00000000000000000000000000000011;

      b=32'b00000000000000000000000000000000;

      opcode=5'b00011; // inca
      #100 ;
      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste da Soma A mais um OK ");
          soma = 3;
          $display(soma);
      end

      #100;

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000001;
      opcode=5'b00100;  // subdec
      #100 ;
      if(out==32'b00000000000000000000000000000011)begin
          $display("Teste da Soma A -B-1 OK ");
          soma = 4;
          $display(soma);

      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000100;
      opcode=5'b00101; // Sub

      #100 ;

      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste da Soma A-B OK ");
          soma = 5;
          $display(soma);

      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b00110;  // deca

      #100 ;
      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste da Soma A-1 OK ");
          soma = 6;
          $display(soma);

      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b01000;  // lsl
      #100 ;
      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste q nao testei  OK ");
          soma = 7;
          $display(soma);

      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b01001;  //asr

      #100 ;

      if(out==32'b00000000000000000000000000000100)begin
          $display("Teste q nao testei  OK ");
          soma = 8;
          $display(soma);

      end

      a=32'b00000000000000000000000000000101;
      b=32'b00000000000000000000000000000000;
      opcode=5'b10000;
      #100 ;
      if(out==32'b00000000000000000000000000000000)begin
          $display("Teste out =0  OK ");
          soma = 9;
          $display(soma);

      end

      a=32'b00000000000000000000000000000001;
      b=32'b00000000000000000000000000000001;
      opcode=5'b10001;
      #100 ;
      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste And OK ");
          soma = 10;
          $display(soma);

      end


      b=32'b00000000000000000000000000000001;
      a=32'b11111111111111111111111111111110;
      opcode=5'b10010;
      #100 ;
      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste And Not A OK ");
          soma = 11;
          $display(soma);

      end


      a=32'b00000000000000000000000000000001;
      b=32'b11111111111111111111111111111110;
      opcode=5'b10011;
      #100 ;
      if(out==32'b11111111111111111111111111111110)begin
          $display("Teste Out=B OK ");
          soma = 12;
          $display(soma);

      end


      a=32'b00000000000000000000000000000001;
      b=32'b11111111111111111111111111111110;
      opcode=5'b10100;
      #100 ;
      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste And Not A OK ");
          soma = 13;
          $display(soma);

      end



      a=32'b00000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b10101;
      #100 ;
      if(out==32'b00000000000000000000000000000010)begin
          $display("Teste Out=A OK ");
          soma = 14;
          $display(soma);

      end



      a=32'b00000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b10110;
      #100 ;
      if(out==32'b11111111111111111111111111111100)begin
          $display("Teste A xor B OK ");
          soma = 15;
          $display(soma);

      end




      a=32'b00000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b10111;
      #100 ;
      if(out==32'b11111111111111111111111111111110)begin
          $display("Teste A or B OK ");
          soma = 16;
          $display(soma);

      end


      a=32'b00000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11000;
      #100 ;
      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste A nand B OK ");
          soma = 17;
          $display(soma);

      end



      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11001;
      #100 ;
      if(out==32'b10000000000000000000000000000011)begin
          $display("Teste A xnor B OK ");
          soma = 18;
          $display(soma);

      end





      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11010;
      #100 ;
      if(out==32'b01111111111111111111111111111101)begin
          $display("Teste neg A  OK ");
          soma = 19;
          $display(soma);

      end



      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11011;
      #100 ;
      if(out==32'b11111111111111111111111111111110)begin
          $display("Teste neg A or B OK ");
          soma = 20;
          $display(soma);

      end


      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11100;
      #100 ;
      if(out==32'b00000000000000000000000000000001)begin
          $display("Teste neg B  OK ");
          soma = 21;
          $display(soma);

      end


      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11101;
      #100 ;
      if(out==32'b10000000000000000000000000000011)begin
          $display("Teste neg b or a OK ");
          soma = 22;
          $display(soma);

      end



      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11110;
      #100 ;
      if(out==32'b01111111111111111111111111111101)begin
          $display("Teste neg b or neg a OK ");
          soma = 23;
          $display(soma);

      end




      a=32'b10000000000000000000000000000010;
      b=32'b11111111111111111111111111111110;
      opcode=5'b11111;
      #100 ;
      if(out==32'b01)begin
          $display("Teste out =1 OK ");
          soma = 24;
          $display(soma);

      end


      end









endmodule
