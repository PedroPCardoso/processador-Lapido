module control(clock,
	instruction,
	branch,
	memRead,
	memWrite,
	memToReg,
	ALUOp,
	ALUSrc,
	regWrite,
	registerB,
	jumpRegister,
	updateB,
	opcodeSignExtend);

input clock;
input [31:0] instruction;
output reg branch;
output reg memRead;
output reg memWrite;
output reg [1:0] memToReg;
output reg [0:4] ALUOp;
output reg ALUSrc;
output reg regWrite;
output reg registerB;
output reg jumpRegister;
output reg updateB;
output reg [1:0] opcodeSignExtend;

	initial begin
		branch = 1'b0;
		memRead = 1'b1;
		memWrite = 1'b1;
		memToReg = 2'b00;
		ALUSrc = 1'b0;
		regWrite = 1'b0;
		registerB = 1'b0;
		jumpRegister = 1'b0;
		opcodeSignExtend = 2'b00;
		updateB = 1'b0;
	end

	always @(posedge clock) begin
		// Se for logica ou aritmetica
		if(instruction[31] == 0 && instruction[30] == 0 && instruction[29] == 1) begin
			$display("Tipo: ULA");

			if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: add");
				ALUOp = 5'b00000;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: addinc");
				ALUOp = 5'b00001;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: inca");
				ALUOp = 5'b00011;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: subdec");
				ALUOp = 5'b00100;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: sub");
				ALUOp = 5'b00101;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: deca");
				ALUOp = 5'b00110;
			end else if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: lsl");
				ALUOp = 5'b01000;
			end else if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: asr");
				ALUOp = 5'b01001;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: zeros");
				ALUOp = 5'b10000;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: and");
				ALUOp = 5'b10001;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: andnota");
				ALUOp = 5'b10010;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: passb");
				ALUOp = 5'b10011;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: andnotb");
				ALUOp = 5'b10100;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: passa");
				ALUOp = 5'b10101;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: xor");
				ALUOp = 5'b10110;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: or");
				ALUOp = 5'b10111;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: nand");
				ALUOp = 5'b11000;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: xnor");
				ALUOp = 5'b11001;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: passnota");
				ALUOp = 5'b11010;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: ornota");
				ALUOp = 5'b11011;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: passnotb");
				ALUOp = 5'b11100;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: ornotb");
				ALUOp = 5'b11101;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: nor");
				ALUOp = 5'b11110;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: ones");
				ALUOp = 5'b11111;
			end

			branch = 1'b0;
			ALUSrc = 1'b0;
			memRead = 1'b1;
			memWrite = 1'b1;
			memToReg = 2'b00;
			regWrite = 1'b1;
			registerB = 1'b0;
			jumpRegister = 1'b0;
			opcodeSignExtend = 2'b00;
			updateB = ~updateB;
		end
		// Se for instrucao de memoria
		else if(instruction[31] == 1 && instruction[30] == 0 && instruction[29] == 0) begin
			$display("Tipo: Memoria");
			if(instruction[24] == 0) begin
				$display("Instrucao: load");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b0;
				memWrite = 1'b1;
				memToReg = 2'b01;
				regWrite = 1'b1;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end else begin
				$display("Instrucao: store");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b0;
				memToReg = 2'b00;
				regWrite = 1'b0;
				registerB = 1'b1;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end
		end
		// Se for instrucao com constante
		else if(instruction[31] == 0 && instruction[30] == 1 && instruction[29] == 0) begin
			$display("Tipo: Constante");
			if(instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: loadlit");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b10011;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b1;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end
			if(instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: lch");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b01011;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b1;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b01;
				updateB = ~updateB;
			end
			if(instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: lcl");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b01100;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b1;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b10;
				updateB = ~updateB;
			end
		end
		// Se for instrucao NOP
		else if(instruction[31] == 0 && instruction[30] == 0 && instruction[29] == 0) begin
			$display("Tipo: NOP");
			$display("Instrucao: nop");
			branch = 1'b0;
			ALUSrc = 1'b1;
			ALUOp = 5'b00000;
			memRead = 1'b1;
			memWrite = 1'b1;
			memToReg = 2'b00;
			regWrite = 1'b0;
			registerB = 1'b0;
			jumpRegister = 1'b0;
			opcodeSignExtend = 2'b00;
			updateB = ~updateB;
		end
		// Se for instrucao de tranferencia de controle
		else if(instruction[31] == 1 && instruction[30] == 0 && instruction[29] == 1) begin
			$display("Tipo: Transferencia de controle");
			if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0) begin
				$display("Instrucao: jump");
				branch = 1'b1;
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b0;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end else 
			if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1) begin
				$display("Instrucao: beq");
				branch = 1'b1;
				ALUSrc = 1'b0;
				ALUOp = 5'b00010;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b0;
				registerB = 1'b1;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end else 
			if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0) begin
				$display("Instrucao: bne");
				branch = 1'b1;
				ALUSrc = 1'b0;
				ALUOp = 5'b00111;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b0;
				registerB = 1'b1;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end else 
			if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 1) begin
				$display("Instrucao: jal");
				branch = 1'b1;
				ALUSrc = 1'b0;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b10;
				regWrite = 1'b1;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end else 
			if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0) begin
				$display("Instrucao: jr");
				branch = 1'b1;
				ALUSrc = 1'b0;
				ALUOp = 5'b10101;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 2'b00;
				regWrite = 1'b0;
				registerB = 1'b0;
				jumpRegister = 1'b1;
				opcodeSignExtend = 2'b00;
				updateB = ~updateB;
			end
		end
		// Se for tipo desconhecido
		else begin
			$display("Instrucao tipo: Desconhecido");
		end
	end

endmodule