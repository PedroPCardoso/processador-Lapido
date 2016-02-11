module  ULA (A, B, opcode, Flag, Out);

input [31:0] A, B;
input opcode;
output [31:0] Out, Flag;


initial begin
A=32b'00000000000000000000000000000000
B=32b'00000000000000000000000000000000
opcode=0;
end

always @ ( opcode ) begin
switch (opcode)begin

case (opcode == 00000 ) // add

assign Out = (A+B);

endcase

case (opcode == 00001 ) // addinc

assign Out = (A+B+1);

endcase

case (opcode == 00011 ) // inca

assign Out = (A+1);

endcase

case (opcode == 00100 ) // subdec

assign Out = (A-B-1);

endcase


case (opcode == 00101 ) // Sub
assign Out = (A-B);

endcase


case (opcode == 00110 ) // deca

assign Out = (A-1);

endcase


case (opcode == 01000 ) // lsl

assign Out = (A+B);

endcase


case (opcode == 01001 ) // asr

assign Out = (A+B);

endcase


case (opcode == 10000 ) // zeros

assign Out = 0;

endcase


case (opcode == 10001 ) // and

assign Out = (A&B);

endcase


case (opcode == 10010 ) // andnota

assign Out = (~A&B);

endcase


case (opcode == 10011 ) // passb

assign Out = B;

endcase


case (opcode == 10100 ) // andnotb

assign Out = (A&~B);

endcase


case (opcode == 10101 ) // passa

assign Out = A;

endcase



case (opcode == 10110 ) // xor

assign Out = (A^B);

endcase



case (opcode == 10111 ) // or

assign Out = (A|B);

endcase




case (opcode == 11000 ) // nand

assign Out = (~A&~B);

endcase


case (opcode == 11001 ) // xnor

assign Out = ~(A^B);

endcase


case (opcode == 11010 ) // passnota

assign Out = ~A;

endcase


case (opcode == 11011 ) // ornota

assign Out = (~A)|B;

endcase


case (opcode == 11100 ) // passnotb

assign Out = ~B;

endcase


case (opcode == 11101 ) // ornotb

assign Out = A|(~B);

endcase


case (opcode == 11110 ) // nor

assign Out = ~A|~B;

endcase


case (opcode == 11111 )  //ones
assign Out = 1;

endcase

end

end


endmodule
