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
wire onBios;				// Sinal que diz se a bios esta executando
reg [31:0] memAddress; 			// Entrada de PC
wire [31:0] memAddressOutAdder;		// Saida do somador (pc++)
wire [31:0] memAddressOutPC;		// Saida de PC
wire [31:0] muxOut;			// Saida de muxIF
wire [31:0] muxULABOut;			// Saida de mux dado B para ULA
wire [31:0] pcpp;			// pc++ armazenado em if_id
wire [31:0] pcpp_id_ex;			// pc++ armazenado em id_ex
wire [31:0] pcpp_ex_mem;		// pc++ armazenado em ex_mem
wire [31:0] pcpp_mem_wb;		// pc++ armazenado em mem_wb
wire [31:0] instruction;		// Instrucao
wire [31:0] extended;			// Sinal extendido
wire [31:0] extendedSignal_id_ex;	// Sinal extendido armazenado em id_ex
reg resetRegisterFile;
wire [31:0] registerFileDataA;		// Saida do registrador A
wire [31:0] registerFileDataA_id_ex;	// Saida do registrador A armazenada em id_ex
wire [31:0] registerFileDataB;		// Saida do registrador B
wire [31:0] registerFileDataB_id_ex;	// Saida do registrador B armazenada em id_ex
wire [31:0] registerFileDataB_ex_mem;	// Saida do registrador B armazenada em ex_mem
wire [3:0] registerFileWrite_id_ex;	// Id do registrador de escrita em id_ex
wire [3:0] registerFileWrite_ex_mem;	// Id do registrador de escrita em ex_mem
wire [3:0] registerFileWrite_mem_wb;	// Id do registrador de escrita em mem_wb
wire [3:0] registerA_id_ex;		// Id do registrador de leitura A em id_ex
wire [3:0] registerB_id_ex;		// Id do registrador de leitura B em id_ex
wire [31:0] muxWBOut;			// Saida do mux do WB
wire [31:0] ALUResult;			// Resultado da ULA
wire [31:0] ALUResult_ex_mem;		// Resultado da ULA em ex_mem
wire [31:0] ALUResult_mem_wb;		// Resultado da ULA em mem_wb
wire [3:0] muxDataBRegisterFileOut;	// Resultado do mux que decide o endereco do registrador de leitura B
wire [31:0] muxJumpRegisterOut;		// Resultado do mux do jump register
wire [31:0] muxForwardAOut;		// Resultado do mux forward A
wire [31:0] muxForwardBOut;		// Resultado do mux forward B
wire [14:0] control_signals;		// Sinais de controle
wire [14:0] control_signals_mux_out;	// Sinais de controle resultado do mux controlado pela HDU
wire [1:0] opcodeSignExtend;		// Opcode do modo de operacao do extensor de sinal
//-------------------------------------------------------
// Signals
//-------------------------------------------------------
reg enablePC;
wire enablePC2; 
wire memRead, branch, memWrite, ALUSrc, regWrite, registerB, updateB;
wire memRead_id_ex, memRead_ex_mem;
wire jumpRegister, jumpRegister_id_ex;
wire ALUSrc_id_ex;
wire [1:0] memToReg, memToReg_id_ex, memToReg_ex_mem, memToReg_mem_wb;
wire regWrite_id_ex, regWrite_ex_mem, regWrite_mem_wb;
wire [4:0] ALUOp, ALUOp_id_ex;
wire branch_id_ex, branchResult;
// --
wire [1:0] forwardA, forwardB;
wire controlSignalsMuxSelector;
//-------------------------------------------------------
// Flags
//-------------------------------------------------------
wire zero, overflow, carry, neg;
//-------------------------------------------------------
// Clock
//-------------------------------------------------------
	always begin
		#5;
		clock=~clock;
	end
//-------------------------------------------------------
// Branch Result
//-------------------------------------------------------
	assign branchResult = zero & branch_id_ex;
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
		.Data(registerFileDataB_ex_mem),
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
		.captured_data(Data),
		.active(onBios)
	);
//-------------------------------------------------------
// Mux
//-------------------------------------------------------
	// Instruction Fetch
	mux muxIF (
		.din_0(memAddressOutAdder),
		.din_1(muxJumpRegisterOut),
		.sel(branchResult),
		.mux_out(muxOut)
	);
	// Mux data B register file
	mux4bits muxDataBRegisterFile (
		.din_0(instruction[15:12]),
		.din_1(instruction[23:20]),
		.sel(control_signals[12]),
		.mux_out(muxDataBRegisterFileOut)
	);
	// Mux ULA data B
	mux muxULAB (
		.din_0(registerFileDataB_id_ex),
		.din_1(extendedSignal_id_ex),
		.sel(ALUSrc_id_ex),
		.mux_out(muxULABOut)
	);
	// Mux ULA data A - Forwarding A
	triStateMux32Bit triStateMux32BitULADataA(
		.din_0(registerFileDataA_id_ex),
		.din_1(muxWBOut),
		.din_2(ALUResult_ex_mem),
		.sel(forwardA),
		.mux_out(muxForwardAOut)
	);
	// Mux ULA data B - Forwarding B
	triStateMux32Bit triStateMux32BitULADataB(
		.din_0(muxULABOut),
		.din_1(muxWBOut),
		.din_2(ALUResult_ex_mem),
		.sel(forwardB),
		.mux_out(muxForwardBOut)
	);
	// Write Back
	triStateMux32Bit triStateMux32BitWb(
		.din_0(ALUResult_mem_wb),
		.din_1(DataOutDataMemory_mem_wb),
		.din_2(pcpp_mem_wb),
		.sel(memToReg_mem_wb),
		.mux_out(muxWBOut)
	);
	// Mux do jump register
	mux jumpRegisterMux (
		.din_0(extendedSignal_id_ex),
		.din_1(ALUResult),
		.sel(jumpRegister_id_ex),
		.mux_out(muxJumpRegisterOut)
	);
	// Mux de sinais de controle
	mux15bits controlSignalsMux(
		.din_0(control_signals),
		.din_1(15'b000000000000110),
		.sel(controlSignalsMuxSelector),
		.mux_out(control_signals_mux_out)
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
		.enablePC(enablePCResult),
		.memAddress(muxOut),
		.memAddressOut(memAddressOutPC)
	);

//-------------------------------------------------------
// Register file
//-------------------------------------------------------
	registerFile registerFile(
		.enable(regWrite_mem_wb),
		.OUT_A(instruction[19:16]),
		.OUT_B(muxDataBRegisterFileOut),
		.IN_C(registerFileWrite_mem_wb),
		.reset(resetRegisterFile),
		.updateB(control_signals[14]),
		.A(registerFileDataA),
		.B(registerFileDataB),
		.E(muxWBOut)
	);
//-------------------------------------------------------
// Sign Extend
//-------------------------------------------------------
	sign_extend sign_extend(
		.opcode(opcodeSignExtend),
		.extend(instruction[15:0]),
		.extended(extended)
	);
//-------------------------------------------------------
// ULA
//-------------------------------------------------------
	ULA ULA (
		.A(muxForwardAOut),
		.B(muxForwardBOut),
		.opcode(ALUOp_id_ex),
		.clock(clock),
		.zero(zero),
		.Out(ALUResult),
		.overflow(overflow),
		.carry(carry),
		.neg(neg)
	);
//-------------------------------------------------------
// Control Unit
//-------------------------------------------------------
	control control(
		.clock(clock),
		.instruction(instruction),
		.zero(zero),
		.overflow(overflow),
		.carry(carry),
		.neg(neg),
		.branch(control_signals[0]),
		.memRead(control_signals[1]),
		.memWrite(control_signals[2]),
		.memToReg(control_signals[4:3]),
		.ALUOp(control_signals[9:5]),
		.ALUSrc(control_signals[10]),
		.regWrite(control_signals[11]),
		.registerB(control_signals[12]),
		.jumpRegister(control_signals[13]),
		.updateB(control_signals[14]),
		.opcodeSignExtend(opcodeSignExtend)
	);
//-------------------------------------------------------
// Forwarding Unit
//-------------------------------------------------------
	FU FU(
		.ex_mem_regWrite(regWrite_ex_mem),
		.ex_mem_registerRD(registerFileWrite_ex_mem),
		.mem_wb_regWrite(regWrite_mem_wb),
		.mem_wb_registerRD(registerFileWrite_mem_wb),
		.id_ex_registerA(registerA_id_ex),
		.id_ex_registerB(registerB_id_ex),
		.ALUSrc(ALUSrc_id_ex),
		.dataBRegisterFileSelector(dataBRegisterFileSelector_id_ex),
		.forwardA(forwardA),
		.forwardB(forwardB)
	);
//-------------------------------------------------------
// Hazard Detection Unit
//-------------------------------------------------------
	HDU HDU(
		.id_ex_memRead(memRead_id_ex),
		.id_ex_registerRD(registerFileWrite_id_ex),
		.if_id_registerA(instruction[19:16]),
		.if_id_registerB(muxDataBRegisterFileOut),
		.branch(branchResult),
		.enablePC(enablePC2),
		.muxSelector(controlSignalsMuxSelector)
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
		.registerA_in(instruction[19:16]),
		.registerB_in(muxDataBRegisterFileOut),
		.pcpp_in(pcpp),
		.extendedSignal_in(extended),
		.ALUOp_in(control_signals_mux_out[9:5]),
		.ALUSrc_in(control_signals_mux_out[10]),
		.memRead_in(control_signals_mux_out[1]),
		.memWrite_in(control_signals_mux_out[2]),
		.memToReg_in(control_signals_mux_out[4:3]),
		.regWrite_in(control_signals_mux_out[11]),
		.branch_in(control_signals_mux_out[0]),
		.jumpRegister_in(control_signals_mux_out[13]),
		.dataBRegisterFileSelector_in(control_signals_mux_out[12]),
		.registerFileDataA(registerFileDataA_id_ex),
		.registerFileDataB(registerFileDataB_id_ex),
		.registerFileWrite(registerFileWrite_id_ex),
		.registerA(registerA_id_ex),
		.registerB(registerB_id_ex),
		.pcpp(pcpp_id_ex),
		.extendedSignal(extendedSignal_id_ex),
		.ALUOp(ALUOp_id_ex),
		.ALUSrc(ALUSrc_id_ex),
		.memRead(memRead_id_ex),
		.memWrite(memWrite_id_ex),
		.memToReg(memToReg_id_ex),
		.regWrite(regWrite_id_ex),
		.branch(branch_id_ex),
		.jumpRegister(jumpRegister_id_ex),
		.dataBRegisterFileSelector(dataBRegisterFileSelector_id_ex)
	);

	ex_mem ex_mem(
		.clock(clock),
		.ALUResult_in(ALUResult),
		.memRead_in(memRead_id_ex),
		.memWrite_in(memWrite_id_ex),
		.memToReg_in(memToReg_id_ex),
		.registerFileDataB_in(registerFileDataB_id_ex),
		.registerFileWrite_in(registerFileWrite_id_ex),
		.regWrite_in(regWrite_id_ex),
		.pcpp_in(pcpp_id_ex),
		.ALUResult(ALUResult_ex_mem),
		.memRead(memRead_ex_mem),
		.memWrite(memWrite_ex_mem),
		.memToReg(memToReg_ex_mem),
		.registerFileDataB(registerFileDataB_ex_mem),
		.registerFileWrite(registerFileWrite_ex_mem),
		.regWrite(regWrite_ex_mem),
		.pcpp(pcpp_ex_mem)
	);

	mem_wb mem_wb(
		.clock(clock),
		.DataOutDataMemory_in(DataOutDataMemory),
		.memToReg_in(memToReg_ex_mem),
		.ALUResult_in(ALUResult_ex_mem),
		.registerFileWrite_in(registerFileWrite_ex_mem),
		.regWrite_in(regWrite_ex_mem),
		.pcpp_in(pcpp_ex_mem),
		.DataOutDataMemory(DataOutDataMemory_mem_wb),
		.memToReg(memToReg_mem_wb),
		.ALUResult(ALUResult_mem_wb),
		.registerFileWrite(registerFileWrite_mem_wb),
		.regWrite(regWrite_mem_wb),
		.pcpp(pcpp_mem_wb)
	);
//-------------------------------------------------------
	initial begin
		clock = 1;
		CS = 0;
		OE = 1;
		WE = 0;
		Address = 32'b0;
		memAddress = 32'b0;
		resetRegisterFile = 1'b1;
	end

	always @(negedge onBios) begin
		WE = 1;
		OE = 0;
		resetRegisterFile = 1'b0;
		//Address = 32'b0;
	end

	always @(posedge clock) begin
		if(onBios == 0) begin
			enablePC = 1'b1;
			//Address = memAddressOutPC;
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

	assign enablePCResult = enablePC & enablePC2;
endmodule