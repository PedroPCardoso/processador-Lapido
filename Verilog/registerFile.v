module registerFile (
  enable, 	// Habilita a escrita no registrador
  OUT_A,    	// Endereco da saida de dados A, sua funcao depende do estado de "Hab_Escrita"
  OUT_B,      	// Endereco da saida de dados B
  IN_C,		// Endereco da entrada de dados C
  reset,       	// Limpa todos os registros
  updateB,	// Sinal que indica ao bloco de registradores que os dados da entrada estao prontos
  A,           	// Saida A do Banco de Registros
  B,           	// Saida B do Banco de Registros
  E);          	// Entrada E do Banco de Registros - novo registro a ser armazenado

  parameter bits_palavra = 32;
  parameter end_registros = 4; // Quantidade de bits necessarios para enderecar os registros
  parameter num_registros = 16; // Quantidade de registros do Banco de Registros (num_registros = (end_registros^2)-1;)
  input wire enable;
  output reg [bits_palavra-1:0] A, B;
  input wire [bits_palavra-1:0] E;
  input wire [3:0] OUT_A, OUT_B, IN_C;
  input wire  reset;
  input updateB;
  wire  Hab_Escrita;
  reg [bits_palavra-1:0] registro [num_registros-1:0];	// Um vetor de "num_registros" palavras de "bits_palavra" bits

	always @(posedge reset, updateB) begin

			if(reset) begin  // zera os registradores
				registro[0] = 32'b00000000000000000000000000000000;
				registro[1] = 32'b00000000000000000000000000000000;
				registro[2] = 32'b00000000000000000000000000000000;
				registro[3] = 32'b00000000000000000000000000000000;
				registro[4] = 32'b00000000000000000000000000000000;
				registro[5] = 32'b00000000000000000000000000000000;
				registro[6] = 32'b00000000000000000000000000000000;
				registro[7] = 32'b00000000000000000000000000000000;

        			registro[8] = 32'b00000000000000000000000000000000;
        			registro[9] = 32'b00000000000000000000000000000000;
        			registro[10] = 32'b00000000000000000000000000000000;
        			registro[11] = 32'b00000000000000000000000000000000;
        			registro[12] = 32'b00000000000000000000000000000000;
        			registro[13] = 32'b00000000000000000000000000000000;
        			registro[14] = 32'b00000000000000000000000000000000;
        			registro[15] = 32'b00000000000000000000000000000000;

			end
			else if(enable) begin
				registro[IN_C] = E;
				//A = registro[IN_C];
		    	end 
			begin
				A = registro[OUT_A];
				B = registro[OUT_B];
			end

	end

endmodule
