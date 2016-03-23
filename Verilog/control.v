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
	updateB/*,
	enablePC*/);

input clock;
input [31:0] instruction;
output reg branch;
output reg memRead;
output reg memWrite;
output reg memToReg;
output reg [0:4] ALUOp;
output reg ALUSrc;
output reg regWrite;
output reg registerB;
output reg updateB;
/*output enablePC;*/

	initial begin
		branch = 1'b0;
		memRead = 1'b1;
		memWrite = 1'b1;
		memToReg = 1'b0;
		ALUSrc = 1'b0;
		regWrite = 1'b0;
		registerB = 1'b0;
		updateB = 1'b0;
	end

	always @(posedge clock) begin
		// Se for logica ou aritmetica
		if(instruction[31] == 0 && instruction[30] == 0 && instruction[29] == 1) begin
			$display("Tipo: ULA");

			if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Add");
				ALUOp = 5'b00000;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: Addinc");
				ALUOp = 5'b00001;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: Inca");
				ALUOp = 5'b00011;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Subdec");
				ALUOp = 5'b00100;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: Sub");
				ALUOp = 5'b00101;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Deca");
				ALUOp = 5'b00110;
			end else if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Lsl");
				ALUOp = 5'b01000;
			end else if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: Asr");
				ALUOp = 5'b01001;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Zeros");
				ALUOp = 5'b10000;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: And");
				ALUOp = 5'b10001;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Andnota");
				ALUOp = 5'b10010;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: Passb");
				ALUOp = 5'b10011;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Andnotb");
				ALUOp = 5'b10100;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: Passa");
				ALUOp = 5'b10101;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Xor");
				ALUOp = 5'b10110;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: Or");
				ALUOp = 5'b10111;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Nand");
				ALUOp = 5'b11000;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: Xnor");
				ALUOp = 5'b11001;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Passnota");
				ALUOp = 5'b11010;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: Ornota");
				ALUOp = 5'b11011;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Passnotb");
				ALUOp = 5'b11100;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: Ornotb");
				ALUOp = 5'b11101;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Nor");
				ALUOp = 5'b11110;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: Ones");
				ALUOp = 5'b11111;
			end

			branch = 1'b0;
			ALUSrc = 1'b0;
			memRead = 1'b1;
			memWrite = 1'b1;
			memToReg = 1'b0;
			regWrite = 1'b1;
			registerB = 1'b0;
			updateB = ~updateB;
		end
		// Se for instrucao de memoria
		else if(instruction[31] == 1 && instruction[30] == 0 && instruction[29] == 0) begin
			$display("Tipo: Memoria");
			if(instruction[24] == 0) begin
				$display("Instrucao: Load");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b0;
				memWrite = 1'b1;
				memToReg = 1'b1;
				regWrite = 1'b1;
				registerB = 1'b0;
				updateB = ~updateB;
			end else begin
				$display("Instrucao: Store");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b0;
				memToReg = 1'b0;
				regWrite = 1'b0;
				registerB = 1'b1;
				updateB = ~updateB;
			end
		end
		// Se for instrucao com constante
		else if(instruction[31] == 0 && instruction[30] == 1 && instruction[29] == 0) begin
			$display("Tipo: Constante");
			if(instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Loadlit");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 1'b0;
				regWrite = 1'b1;
				registerB = 1'b0;
				updateB = ~updateB;
			end
		end
		// Se for instrucao NOP
		else if(instruction[31] == 0 && instruction[30] == 0 && instruction[29] == 0) begin
			$display("Tipo: NOP");
			$display("Instrucao: Nop");
			branch = 1'b0;
			ALUSrc = 1'b1;
			ALUOp = 5'b00000;
			memRead = 1'b1;
			memWrite = 1'b1;
			memToReg = 1'b0;
			regWrite = 1'b0;
			registerB = 1'b0;
			updateB = ~updateB;
		end
		// Se for instrucao de tranferencia de controle
		else if(instruction[31] == 1 && instruction[30] == 0 && instruction[29] == 1) begin
			$display("Tipo: Transferencia de controle");
			if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1) begin
				$display("Instrucao: Beq");
				branch = 1'b1;
				ALUSrc = 1'b0;
				ALUOp = 5'b00010;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 1'b0;
				regWrite = 1'b0;
				registerB = 1'b1;
				updateB = ~updateB;
			end
		end
		// Se for tipo desconhecido
		else begin
			$display("Instrucao tipo: Desconhecido");
		end
	end

endmodule