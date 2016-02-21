  /**
 * Universidade Federal Rural de Pernambuco
 * Departamento de Estat�stica e Inform�tica
 * Disciplina: Arquitetura e Organiza��o de Computadores
 *
 * Mem�ria de instru��es.
 *
 * @author Andr� Aziz (andreaziz@deinfo.ufrpe.br)
 */

module IMEM (
  address,
  instruction
);

input address;
output instruction;

wire [31:0] address;
reg [31:0] instruction;

reg [7:0] ROM [0:1023];

initial begin

  $readmemb("memory.bin", ROM);
  instruction = 0;

end

always begin

  if (address > 1020) begin
    $display("Instruction memory out of bounds!! Memory size is 1024 bytes.");
    $finish;
  end

  #10 instruction = {ROM[address+3], ROM[address+2], ROM[address+1], ROM[address]};

end

endmodule
