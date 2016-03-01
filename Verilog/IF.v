//             IF Model
// +-----------------------------+
// |   Copyright 2016 #JustNow   |
// +-----------------------------+

module IF();
	reg enablePC;
	wire [31:0] outAdderInPC;
	wire [31:0] outPcInAdder;
	wire cout;
	
	initial begin
		enablePC=1'b0;
		#100
		enablePC=1'b1;
		#100
		enablePC=1'b0;
		#100
		enablePC=1'b1;
	end
	
	programcounter programcounter(
		.enablePC(enablePC),
		.memAddress(outAdderInPC),
		.memAddressOut(outPcInAdder)
	);
	
	adder adder(
		.dataA(outPcInAdder),
		.cin(1'b0),
		.cout(cout),
		.result(outAdderInPC)
	);
	
endmodule;