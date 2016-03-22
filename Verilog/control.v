module control(clock,
	instruction,
	branch,
	memRead,
	memWrite,
	memToReg,
	ALUOp,
	ALUSrc,
	regWrite/*,
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
/*output enablePC;*/

	initial begin
		branch = 1'b0;
		memRead = 1'b1;
		memWrite = 1'b1;
		memToReg = 1'b0;
		ALUSrc = 1'b0;
		regWrite = 1'b0;
	end

	always @(posedge clock) begin
		// Se for logica ou aritmetica
		if(instruction[31] == 0 && instruction[30] == 0 && instruction[29] == 1) begin
			$display("Tipo: ULA");
			ALUSrc = 1'b0;
			memRead = 1'b1;
			memWrite = 1'b1;
			memToReg = 1'b0;
			regWrite = 1'b1;

			if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 0) begin
				$display("Instrucao: Add");
				ALUOp = 5'b00000;
			end
		end
		// Se for instrucao de memoria
		else if(instruction[31] == 1 && instruction[30] == 0 && instruction[29] == 0) begin
			$display("Tipo: Memoria");
			if(instruction[24] == 0) begin
				$display("Instrucao: Load");
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b0;
				memWrite = 1'b1;
				memToReg = 1'b1;
				regWrite = 1'b1;
			end else begin
				$display("Instrucao: Store");
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b0;
				memToReg = 1'b0;
				regWrite = 1'b0;
			end
		end
		// Se for instrucao com constante
		else if(instruction[31] == 0 && instruction[30] == 1 && instruction[29] == 0) begin
			$display("Tipo: Constante");
			if(instruction[25] == 1 && instruction[24] == 0) begin
				$display("Instrucao: Loadlit");
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				memRead = 1'b1;
				memWrite = 1'b1;
				memToReg = 1'b0;
				regWrite = 1'b1;
			end
		end
		// Se for tipo desconhecido
		else begin
			$display("Instrucao tipo: Desconhecido");
		end
	end

endmodule