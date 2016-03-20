module main();
//-------------------------------------------------------
// Memory Variables
//-------------------------------------------------------
reg [31:0] Address;
wire [31:0] Data, DataOut;
reg CS;					// Chip select
reg WE;					// Write enable
reg OE;					// Output enable
reg clock;
reg onBios;				// Sinal que diz se a bios esta executando
reg [31:0] memAddress; 			// Entrada de PC
wire [31:0] memAddressOutAdder;		// Saida do somador (pc++)
wire [31:0] memAddressOutPC;		// Saida de PC
//reg [31:0] memAddressOut;
wire [31:0] muxOut;			// Saida de muxIF
wire [31:0] pcpp;			// pc++
wire [31:0] pcpp_id_ex;			// pc++ armazenado em if_id
wire [31:0] instruction;		// Instrucao
wire [31:0] extended;			// Sinal extendido
wire [31:0] extendedSignal_id_ex;		// Sinal extendido armazenado em id_ex
reg enableRegisterFile;
reg resetRegisterFile;
wire [31:0] registerFileDataA;		// Saida do registrador A
wire [31:0] registerFileDataA_id_ex;	// Saida do registrador A armazenada em id_ex
wire [31:0] registerFileDataB;		// Saida do registrador B
wire [31:0] registerFileDataB_id_ex;	// Saida do registrador B armazenada em id_ex
wire [3:0] registerFileWrite;		// Id do registrador de escrita
wire [31:0] WBMuxOut;			// Saida do mux do WB
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
		.OE(OE),
		.DataOut(DataOut)
	);
//-------------------------------------------------------
// Bios
//-------------------------------------------------------
	bios bios(
		.clock(clock),
		.captured_data(Data)
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
		.memAddress(muxOut),
		.memAddressOut(memAddressOutPC)
	);

//-------------------------------------------------------
// Register file
//-------------------------------------------------------
	registerFile registerFile(
		.enable(enableRegisterFile),
		.OUT_A(instruction[19:16]),
		.OUT_B(instruction[15:12]),
		.IN_C(instruction[23:20]),
		.reset(resetRegisterFile),
		.clock(clock),
		.A(registerFileDataA),
		.B(registerFileDataB),
		.E(WBMuxOut)
	);
//-------------------------------------------------------
// Sign Extend
//-------------------------------------------------------
	sign_extend sign_extend(
		.extend(instruction[15:0]),
		.extended(extended)
	);
//-------------------------------------------------------
// Pipeline registers
//-------------------------------------------------------
	if_id if_id (
		.clock(clock),
		.pcpp_in(memAddressOutAdder),
		.instruction_in(DataOut),
		.pcpp(pcpp),
		.instruction(instruction)
	);

	id_ex id_ex(
		.clock(clock),
		.registerFileDataA_in(registerFileDataA),
		.registerFileDataB_in(registerFileDataB),
		.registerFileWrite_in(32'b0),
		.pcpp_in(pcpp),
		.extendedSignal_in(extended),
		.registerFileDataA(registerFileDataA_id_ex),
		.registerFileDataB(registerFileDataB_id_ex),
		.registerFileWrite(registerFileWrite),
		.pcpp(pcpp_id_ex),
		.extendedSignal(extendedSignal_id_ex)
	);
//-------------------------------------------------------
	initial begin
		onBios = 1;
		clock = 1;
		CS = 0;
		OE = 1;
		WE = 0;
		Address = 32'b0;
		memAddress = 32'b0;
		enableRegisterFile = 1'b0;
		resetRegisterFile = 1'b1;
		#60
		onBios = 0;
		enableRegisterFile = 1'b0;
		resetRegisterFile = 1'b0;
	end

	always @(negedge onBios) begin
		WE = 1;
		OE = 0;
		//Address = 32'b1;
	end

	always @(posedge clock) begin
		if(onBios == 0) begin
			enablePC = 1'b1;
		end else begin
			WE=1;
		end
	end

	always @(negedge clock) begin
		if(onBios == 0) begin
			Address = memAddressOutPC;
			enablePC = 1'b0;
		end else begin
			WE=0;
			Address = Address + 32'b1;
		end
	end
endmodule;