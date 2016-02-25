module Banco_ULA();

  clockFSM clockFSM(   /// Clock
      .clk(clock)
    );

Banco_Registro banco(
  .Habilita(0),
  .IN_OUT_A(0011),    // Endereco da entrada de dados e da saida de dados A, sua função depende do estado de "Hab_Escrita"
  .OUT_B(1000),      // Endereco da saida de dados B
  .reset(0),       // Limpa todos os registros
  .clock,       // Pulso de clock
  .A(16'b0),           // Saida A do Banco de Registros
  .B(16'b0),           // Saida B do Banco de Registros
  .E(16'b0)
  );


endmodule
