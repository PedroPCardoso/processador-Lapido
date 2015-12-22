============================================================================================================
                                     LAPI DOpaCA LAMBA - The Processor
============================================================================================================

Este documento visa especificar como utilizar o simulador do processador LAPI DOpaCA LAMBA.

- Características do processador:
. Arquitetura de 32 bits;
. 16 GPR de 32 bits de largura;
. ISA composta por 42 instruções;
. Organização de dados na memória do tipo big endian;
. Memória endereçada ao nível da palavra, ou seja, cada endereço de memória corresponde a uma palavra de
  4 bytes;
. Suporte a Overflow.

- Código assembly
. As instruções devem inseridas no arquivo input.txt;
. As instruções serão automaticamente carregadas na memória de instruções a partir deste arquivo quando o
  simulador for executado.

- Instruções
. O processador executa as instruções: lch, add, nega, or, and, shift.

- Parâmetros
. Dois parâmetros são requisitados para o funcionamento do simulador:
  1. arquivo input.txt contendo as instruções
  2. número de instruções presentes no arquivo (requisitado ao iniciar a simulação)