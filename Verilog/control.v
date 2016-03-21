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
		// Se for logica ou aritimetica
		if(instruction[29] == 0 && instruction[30] == 0 && instruction[31] == 1) begin
			$display("Tipo: ULA");
		end
		// Se for instrucao de memoria
		else if(instruction[29] == 1 && instruction[30] == 0 && instruction[31] == 0) begin
			$display("Tipo: Memoria");
			if(instruction[24] == 0) begin
				$display("Instrucao: Load");
				ALUSrc = 1'b1;
				ALUOp = 5'b00000;
				regWrite = 1'b1;
				memRead = 1'b0;
				memWrite = 1'b1;
			end else begin
				$display("Instrucao: Store");
			end
		end
		// Se for tipo desconhecido
		else begin
			$display("Instrucao tipo: Desconhecido");
		end
	end

endmodule