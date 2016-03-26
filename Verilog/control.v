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
	updateB/*,
	enablePC*/);

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
/*output enablePC;*/

	initial begin
		branch = 1'b0;
		memRead = 1'b1;
		memWrite = 1'b1;
		memToReg = 2'b00;
		ALUSrc = 1'b0;
		regWrite = 1'b0;
		registerB = 1'b0;
		jumpRegister = 1'b0;
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
				ALUOp = 8'b00100001;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: inca");
				ALUOp = 8'b00100011;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: subdec");
				ALUOp = 8'b00100100;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: sub");
				ALUOp = 8'b00100101;
			end else if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: deca");
				ALUOp = 8'b00100110;
			end else if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: lsl");
				ALUOp = 8'b00101000;
			end else if(instruction[28] == 0 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: asr");
				ALUOp = 8'b00101001;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: zeros");
				ALUOp = 8'b00110000;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: and");
				ALUOp = 8'b00110001;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: andnota");
				ALUOp = 8'b00110010;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: passb");
				ALUOp = 8'b00110011;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: andnotb");
				ALUOp = 8'b00110100;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: passa");
				ALUOp = 8'b00110101;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: xor");
				ALUOp = 8'b00110110;
			end else if(instruction[28] == 1 && instruction[27] == 0 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: or");
				ALUOp = 8'b00110111;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: nand");
				ALUOp = 8'b00111000;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: xnor");
				ALUOp = 8'b00111001;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: passnota");
				ALUOp = 8'b00111010;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: ornota");
				ALUOp = 8'b00111011;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: passnotb");
				ALUOp = 8'b00111100;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 0 && instruction[24] == 1) begin
				$display("Instrucao: ornotb");
				ALUOp = 8'b00111101;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: nor");
				ALUOp = 8'b00111110;
			end else if(instruction[28] == 1 && instruction[27] == 1 && instruction[26] == 1 && instruction[25] == 1 && instruction[24] == 1) begin
				$display("Instrucao: ones");
				ALUOp = 8'b00111111;
			end

			branch = 1'b0;
			ALUSrc = 1'b0;
			memRead = 1'b1;
			memWrite = 1'b1;
			memToReg = 2'b00;
			regWrite = 1'b1;
			registerB = 1'b0;
			jumpRegister = 1'b0;
			updateB = ~updateB;
		end
		// Se for instrucao de memoria
		else if(instruction[31] == 1 && instruction[30] == 0 && instruction[29] == 0) begin
			$display("Tipo: Memoria");
			if(instruction[24] == 0) begin
				$display("Instrucao: load");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 8'b10000000;
				memRead = 1'b0;
				memWrite = 1'b1;
				memToReg = 2'b01;
				regWrite = 1'b1;
				registerB = 1'b0;
				jumpRegister = 1'b0;
				updateB = ~updateB;
			end else begin
				$display("Instrucao: store");
				branch = 1'b0;
				ALUSrc = 1'b1;
				ALUOp = 8'b10000000;
				memRead = 1'b1;
				memWrite = 1'b0;
				memToReg = 2'b00;
				regWrite = 1'b0;
				registerB = 1'b1;
				jumpRegister = 1'b0;
				updateB = ~updateB;
			end
		end
		// Se for instrucao com constante
		else if(instruction[31] == 0 && instruction[30] == 1 && instruction[29] == 0) begin
			$display("Tipo: Constante");
			if(instruction[25] == 1 && instruction[24] == 0) begin
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
				updateB = ~updateB;
			end
		end
		// Se for tipo desconhecido
		else begin
			$display("Instrucao tipo: Desconhecido");
		end
	end

endmodule
