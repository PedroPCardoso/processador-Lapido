module main();
//-------------------------------------------------------
// Memory Variables
//-------------------------------------------------------
reg [31:0] Address;
wire [31:0] Data;
reg CS;
reg WE;
reg OE;
reg clock;
reg [31:0] memAddress; 		// Entrada de PC
wire [31:0] memAddressOutAdder;
wire [31:0] memAddressOutPC;
reg [31:0] memAddressOut; 	// Saida de PC
wire [31:0] muxOut;		// Saida de muxIF
//-------------------------------------------------------
// Signals
//-------------------------------------------------------
reg enablePC;
//-------------------------------------------------------
// Clock
//-------------------------------------------------------
	always begin
		#5;
		clock=~clock;
	end
//-------------------------------------------------------
// Memory
//-------------------------------------------------------
	memory memory(
		.Address(Address),
		.Data(Data),
		.CS(CS),
		.WE(WE),
		.OE(OE)
	);
//-------------------------------------------------------
// Bios
//-------------------------------------------------------
	bios bios(
		.clock(clock),
		.Data(Data)
	);
//-------------------------------------------------------
// Mux Instruction Fetch
//-------------------------------------------------------
	mux muxIF (
		.din_0(memAddressOutAdder),
		.din_1(32'b1111),
		.sel(1'b0),
		.mux_out(muxOut)
	);
//-------------------------------------------------------
// Adder
//-------------------------------------------------------
	adder adder(
		.dataA(memAddressOutPC),
		.result(memAddressOutAdder)
	);
//-------------------------------------------------------
// Program Counter
//-------------------------------------------------------
	programcounter programcounter (
		.enablePC(enablePC),
		.memAddress(memAddress),
		.memAddressOut(memAddressOutPC)
	);
//-------------------------------------------------------
	initial begin
		clock=1;
		CS = 0;
		OE = 1;
		WE = 1;
		Address = 32'b0;
		memAddress = 32'b0;
	end

	always @(posedge clock) begin
		WE=1;
	end

	always @(negedge clock) begin
		WE=0;
		Address = Address + 32'b100;
	end
//-------------------------------------------------------
// Depois que a bios encerra as atividades
//-------------------------------------------------------
	always #100 @(posedge clock) begin
		enablePC = 1'b1;
		Address = memAddressOut;
	end

	always #100 @(negedge clock) begin
		enablePC = 1'b0;
	end
endmodule;