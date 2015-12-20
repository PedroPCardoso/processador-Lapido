#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int programCounter = 0;             // PC
int instructionMemory[50][32];      // Memória de instruções

// Flags
int overflow = 0;

struct DataMemory {
    int data[50][32];               // Dados
    char readData[32];              // Dados lidos da memória de dados
    char writeData[32];             // Dados escritos da memória de dados
} dataMemory;

struct Registers {
    char readRegisterA[4];           // RA
    char readRegisterB[4];           // RB
    char writeRegister[4];           // WC
    char writeData[32];              // Dado a ser escrito em algum GPR
    char r[16][32];                  // GPRs
    char readDataA[32];              // Dados lidos do RA
    char readDataB[32];              // Dados lidos do RB
    int regWrite;                    // Sinal de controle
} registers;

struct ALU {
    char ALUResult[32];             // Resultado da ULA
    int zero;                       // Zero
} alu;

struct Control {
    int regDst;
    int branch;
    int memRead;
    int menWrite;
    int memToReg;
    int ALUSrc;                     // Define se a ALU deve usar o ReadDataB (1) ou dado proveniente do extensor de sinal(0)
    int regWrite;
    char ALUOp[4];                  // Controle da ALU / Tamanho = 4 bits
} control;

// Carrega instruções do arquivo para memória de instruções
void loadInstructionsOnMemory() {
    FILE *fp;
    char buff[255];
    int counter = 0;

    fp = fopen("input.txt", "r");
    
    while(fscanf(fp, "%s", buff) != EOF) {
        strncpy(instructionMemory[counter], buff, 32);
        printf("%s\n", instructionMemory[counter]);
        counter++;
    }
    
    fclose(fp);
}

// Executa IF
char * doInstructionFetch() {
    char *instruction = instructionMemory[programCounter];
    
    // Atualiza valor do PC
    if(control.branch == 1 && alu.zero == 1) {
        // programCounter = saída da ULA
    } else {
        programCounter = programCounter + 1;
    }
    return instruction;
}

// Executa ID
void doInstructionDecoding(char *instruction) {
    int t;
    int u;
    for(t=0; t<16; t++) {
        for(u=0; u<32; u++) {
            registers.r[t][u] = '0';
        }
    }
    registers.r[9][30] = '1';
    registers.r[9][31] = '1';
    registers.r[11][27] = '1';
    registers.r[11][28] = '0';
    registers.r[11][29] = '0';
    registers.r[11][30] = '0';
    registers.r[11][31] = '1';
    
    registers.writeRegister[3] = instruction[23];
    registers.writeRegister[2] = instruction[22];
    registers.writeRegister[1] = instruction[21];
    registers.writeRegister[0] = instruction[20];
    
    registers.readRegisterA[3] = instruction[19];
    registers.readRegisterA[2] = instruction[18];
    registers.readRegisterA[1] = instruction[17];
    registers.readRegisterA[0] = instruction[16];
    
    registers.readRegisterB[3] = instruction[15];
    registers.readRegisterB[2] = instruction[14];
    registers.readRegisterB[1] = instruction[13];
    registers.readRegisterB[0] = instruction[12];
    
    char bin;
    int dec = 0;
    int RA, RB, WC;
    int i;

    for(i=0; i<4; i++) {
        bin = registers.readRegisterA[i];
        if (bin == '1') {
            dec = dec * 2 + 1;
        } else if(bin == '0') {
            dec *= 2;
        }
    }
    RA = dec;
    printf("O RA eh o r %d\n", RA);

    dec = 0;
    for(i=0; i<4; i++) {
        bin = registers.readRegisterB[i];
        if (bin == '1') {
            dec = dec * 2 + 1;
        } else if(bin == '0') {
            dec *= 2;
        }
    }
    RB = dec;
    printf("O RB eh o r %d\n", RB);

    dec = 0;
    for(i=0; i<4; i++) {
        bin = registers.writeRegister[i];
        if (bin == '1') {
            dec = dec * 2 + 1;
        } else if(bin == '0') {
            dec *= 2;
        }
    }
    WC = dec;
    printf("O WC eh o r %d\n", WC);
    
    strncpy(registers.readDataA, registers.r[RA], 32);
    printf("ReadDataA: %s\n", registers.readDataA);
    
    strncpy(registers.readDataB, registers.r[RB], 32);
    printf("ReadDataB: %s\n", registers.readDataB);
}

void doControl(char *instruction) {
    /*  
        Ação da ULA         ALU Control Input
        ADD                 0010
        SUBTRACT            0110
        AND                 0000
        OR                  0001
        SET ON LESS THAN    0111
    */
    // Se for a instrução do tipo lógica ou aritmética
    if(instruction[31] == '0' && instruction[30] == '0' && instruction[29] == '1') {
        // Se for add
        if(instruction[28] == '0' && instruction[27] == '0' && instruction[26] == '0' && instruction[25] == '0' && instruction[24] == '0') {
            control.ALUOp[0] = '0';
            control.ALUOp[1] = '0';
            control.ALUOp[2] = '1';
            control.ALUOp[3] = '0';
            control.ALUOp[4] = '\0';
            control.ALUSrc = 1;
        }
        // Se for addinc
        if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 0 && instruction[24] == 1) {
            
        }
        // Se for inca
        if(instruction[28] == 0 && instruction[27] == 0 && instruction[26] == 0 && instruction[25] == 1 && instruction[24] == 1) {
            
        }
    }
}

void getBin(int num, char *str) {
  *(str+5) = '\0';
  int mask = 0x10 << 1;
  while(mask >>= 1)
    *str++ = !!(mask & num) + '0';
}

void sum(char bin1[], char bin2[], char result[]) {
    int i;
    int dec1 = 0, dec2 = 0;
    for(i = 0, dec1 = 0; i < 32; i++) {
        if (bin1[i] == '1') {
            dec1 = dec1 * 2 + 1;
        }
        else if (bin1[i] == '0') {
            dec1 *= 2;
        }
    }
    printf("Valor 1: %d\n", dec1);
    for(i = 0, dec2 = 0; i < 32; i++) {
        if (bin2[i] == '1') {
            dec2 = dec2 * 2 + 1;
        }
        else if (bin2[i] == '0') {
            dec2 *= 2;
        }
    }
    printf("Valor 2: %d\n", dec2);
    printf("SOMA: %d\n", dec1 + dec2);
    int soma = dec1 + dec2;
    
    if(soma > 4294967295) {
        overflow = 1;
    }
    
    char str[32];
    getBin(soma, str);
    
    printf("BINARIO: %s\n",str);
    printf("TAMANHO: %d\n",strlen(str));
    
    int counter = 0;
    for(i = 0; i < 32; i++) {
        if(i < 32 - strlen(str)) {
            result[i] = '0';
        } else {
            result[i] = str[counter];
            counter++;
        }
    }
    result[32] = '\0';
}

// Cálculos da ALU
void compute() {
    // Se for add
    if(control.ALUOp[0] == '0' && control.ALUOp[1] == '0' && control.ALUOp[2] == '1' && control.ALUOp[3] == '0') {
        // Se for para usar ReadDataB
        int i;
        int counter = 0, sizeA, sizeB;
        for(i = 0; i < 32, registers.readDataA[i] == '0'; i++) {
            counter++;
        }
        i = 0;
        sizeA = 32 - counter;
        char operatorA[sizeA];
        while(sizeA != 0) {
            operatorA[i] = registers.readDataA[32 - sizeA];
            sizeA--;
            i++;
        }
        operatorA[i] = '\0';
        
        counter = 0;
        for(i = 0; i < 32, registers.readDataB[i] == '0'; i++) {
            counter++;
        }
        i = 0;
        sizeB = 32 - counter;
        char operatorB[sizeB];
        while(sizeB != 0) {
            operatorB[i] = registers.readDataB[32 - sizeB];
            sizeB--;
            i++;
        }
        operatorB[i] = '\0';
        
        if(control.ALUSrc == 1) {
            printf("OperatorA: %s\n",operatorA);
            printf("OperatorB: %s\n",operatorB);
            sum(operatorA,operatorB,alu.ALUResult);
            printf("RESULT: %s\n",alu.ALUResult);
        } else {
            // Usar saída do extensor de sinal
        }
    }
}

int main(int argc, char *argv[]) {
    
    loadInstructionsOnMemory();
    system("PAUSE");
    char *instruction = doInstructionFetch();
    printf("Instruction: %s\n", instruction);
    system("PAUSE");
    doInstructionDecoding(instruction);
    system("PAUSE");
    doControl(instruction);
    compute();
    system("PAUSE");
    return 0;
}
