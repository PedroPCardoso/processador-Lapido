#include <stdio.h>
#include <stdlib.h>

int PCSrc = 0;                      // Sinal de controle
int programCounter = 0;             // PC
int instructionMemory[10][32];      // Memória de instruções

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
    
    //printf("%s\n", instruction);
    if(PCSrc==0) {
        programCounter = programCounter + 1;
    } else {
        // programCounter = saída da ULA
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
    registers.r[9][0] = '1';
    registers.r[9][1] = '1';
    registers.r[9][30] = '1';
    registers.r[9][31] = '1';
    
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

int main(int argc, char *argv[]) {
    loadInstructionsOnMemory();
    system("PAUSE");
    char *instruction = doInstructionFetch();
    printf("Instruction: %s\n", instruction);
    system("PAUSE");
    doInstructionDecoding(instruction);
    system("PAUSE");
    return 0;
}
