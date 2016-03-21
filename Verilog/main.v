module main();
//-------------------------------------------------------
// Memory Variables
//-------------------------------------------------------
reg [31:0] Address;
wire [31:0] Data, DataOut, DataOutDataMemory, DataOutDataMemory_mem_wb;
reg CS;					// Chip select
reg WE;					// Write enable
reg OE;					// Output enable
reg clock;
reg onBios;				// Sinal que diz se a bios esta executando
reg [31:0] memAddress; 			// Entrada de PC
wire [31:0] memAddressOutAdder;		// Saida do somador (pc++)
wire [31:0] memAddressOutPC;		// Saida de PC
wire [31:0] muxOut;			// Saida de muxIF
wire [31:0] muxULABOut;			// Saida de mux dado B para ULA
wire [31:0] pcpp;			// pc++
wire [31:0] pcpp_id_ex;			// pc++ armazenado em if_id
wire [31:0] instruction;		// Instrucao
wire [31:0] extended;			// Sinal extendido
wire [31:0] extendedSignal_id_ex;	// Sinal extendido armazenado em id_ex
reg resetRegisterFile;
wire [31:0] registerFileDataA;		// Saida do registrador A
wire [31:0] registerFileDataA_id_ex;	// Saida do registrador A armazenada em id_ex
wire [31:0] registerFileDataB;		// Saida do registrador B
wire [31:0] registerFileDataB_id_ex;	// Saida do registrador B armazenada em id_ex
wire [3:0] registerFileWrite_id_ex;	// Id do registrador de escrita em id_ex
wire [3:0] registerFileWrite_ex_mem;	// Id do registrador de escrita em ex_mem
wire [3:0] registerFileWrite_mem_wb;	// Id do registrador de escrita em mem_wb
wire [31:0] muxWBOut;			// Saida do mux do WB
wire [31:0] ALUResult;			// Resultado da ULA
wire [31:0] ALUResult_ex_mem;		// Resultado da ULA em ex_mem
wire [31:0] ALUResult_mem_wb;		// Resultado da ULA em mem_wb
//-------------------------------------------------------
// Signals
//-------------------------------------------------------
reg enablePC;
wire memRead, branch, memWrite, memToReg, ALUSrc, regWrite/*, enablePC*/;
wire memRead_id_ex, memRead_ex_mem;
wire memToReg_id_ex, memToReg_ex_mem, memToReg_mem_wb;
wire regWrite_id_ex, regWrite_ex_mem;
wire [4:0] ALUOp, ALUOp_id_ex;
//-------------------------------------------------------
// Flags
//-------------------------------------------------------
wire zero;
//-------------------------------------------------------
// Clock
//-------------------------------------------------------
	always begin
		#5;
		clock=~clock;
	end
//-------------------------------------------------------
// Instruction Memory
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
// Data Memory
//-------------------------------------------------------
	memory dataMemory(
		.Address(ALUResult_ex_mem),
		.Data(32'b0),
		.CS(1'b0),
		.WE(memWrite_ex_mem),
		.OE(memRead_ex_mem),
		.DataOut(DataOutDataMemory)
	);
//-------------------------------------------------------
// Bios
//-------------------------------------------------------
	bios bios(
		.clock(clock),
		.captured_data(Data)
	);
//-------------------------------------------------------
// Mux
//-------------------------------------------------------
	// Instruction Fetch
	mux muxIF (
		.din_0(memAddressOutAdder),
		.din_1(32'b1111),
		.sel(1'b0),
		.mux_out(muxOut)
	);
	// Mux ULA data B
	mux muxULAB (
		.din_0(registerFileDataA_id_ex),
		.din_1(extendedSignal_id_ex),
		.sel(1'b1),
		.mux_out(muxULABOut)
	);
	// Write Back
	mux muxWB (
		.din_0(ALUResult_mem_wb),
		.din_1(DataOutDataMemory_mem_wb),
		.sel(memToReg_mem_wb),
		.mux_out(muxWBOut)
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
		.enable(regWrite),
		.OUT_A(instruction[19:16]),
		.OUT_B(instruction[15:12]),
		.IN_C(registerFileWrite_mem_wb),
		.reset(resetRegisterFile),
		.clock(clock),
		.A(registerFileDataA),
		.B(registerFileDataB),
		.E(muxWBOut)
	);
//-------------------------------------------------------
// Sign Extend
//-------------------------------------------------------
	sign_extend sign_extend(
		.extend(instruction[15:0]),
		.extended(extended)
	);
//-------------------------------------------------------
// ULA
//-------------------------------------------------------
	ULA ULA (
		.A(registerFileDataA_id_ex),
		.B(muxULABOut),
		.opcode(ALUOp_id_ex),
		.zero(zero),
		.Out(ALUResult)
	);
//-------------------------------------------------------
// Control Unit
//-------------------------------------------------------
	control control(
		.clock(clock),
		.instruction(instruction),
		.branch(branch),
		.memRead(memRead),
		.memWrite(memWrite),
		.memToReg(memToReg),
		.ALUOp(ALUOp),
		.ALUSrc(ALUSrc),
		.regWrite(regWrite)/*,
		.enablePC(enablePC)*/
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
		.registerFileWrite_in(instruction[23:20]),
		.pcpp_in(pcpp),
		.extendedSignal_in(extended),
		.ALUOp_in(ALUOp),
		.memRead_in(memRead),
		.memWrite_in(memWrite),
		.memToReg_in(memToReg),
		.registerFileDataA(registerFileDataA_id_ex),
		.registerFileDataB(registerFileDataB_id_ex),
		.registerFileWrite(registerFileWrite_id_ex),
		.pcpp(pcpp_id_ex),
		.extendedSignal(extendedSignal_id_ex),
		.ALUOp(ALUOp_id_ex),
		.memRead(memRead_id_ex),
		.memWrite(memWrite_id_ex),
		.memToReg(memToReg_id_ex)
	);

	ex_mem ex_mem(
		.clock(clock),
		.ALUResult_in(ALUResult),
		.memRead_in(memRead_id_ex),
		.memWrite_in(memWrite_id_ex),
		.memToReg_in(memToReg_id_ex),
		.registerFileWrite_in(registerFileWrite_id_ex),
		.ALUResult(ALUResult_ex_mem),
		.memRead(memRead_ex_mem),
		.memWrite(memWrite_ex_mem),
		.memToReg(memToReg_ex_mem),
		.registerFileWrite(registerFileWrite_ex_mem)
	);

	mem_wb mem_wb(
		.clock(clock),
		.DataOutDataMemory_in(DataOutDataMemory),
		.memToReg_in(memToReg_ex_mem),
		.ALUResult_in(ALUResult_ex_mem),
		.registerFileWrite_in(registerFileWrite_ex_mem),
		.DataOutDataMemory(DataOutDataMemory_mem_wb),
		.memToReg(memToReg_mem_wb),
		.ALUResult(ALUResult_mem_wb),
		.registerFileWrite(registerFileWrite_mem_wb)
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
		resetRegisterFile = 1'b1;
		#60
		onBios = 0;
		resetRegisterFile = 1'b0;
	end

	always @(negedge onBios) begin
		WE = 1;
		OE = 0;
		//Address = 32'b0;
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
endmodule