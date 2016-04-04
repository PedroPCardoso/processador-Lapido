module ULA_TB();

  reg [31:0] a, b;
  wire zero, overflow, carry, neg;
  wire [31:0] out;
  reg [4:0] opcode;
  reg clock;

  reg [5:0] soma ;
   ULA ULA(
	.A(a),
	.B(b),
	.opcode(opcode),
	.clock(clock),
	.zero(zero),
	.Out(out),
	.overflow(overflow),
	.carry(carry),
	.neg(neg)
      );

	
    initial begin
	a=32'b00000000000000000000000000000001;
	b=32'b01111111111111111111111111111110;
	opcode=5'b00000;  // add
	clock = 1'b1;
	#10 ;

      end


endmodule
