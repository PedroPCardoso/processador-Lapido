#include <stdio.h>
#include <stdlib.h>
#include <string.h>
  
int main(){
char url[]="test.asm";

	char ch;
	FILE *arq;
	char instrucao[7];
	arq = fopen(url, "r");
	if(arq == NULL)
	    printf("Erro, nao foi possivel abrir o arquivo\n");
	else{
		int cont=0;
	    while( (ch=fgetc(arq))!= EOF ){
		
				if (ch==32){    // esse if é pra quando eu achar a instrução completa.
					putchar(ch);
				printf("%s",instrucao);
					
					break;
					}
				else{
					instrucao[cont]=ch;
					cont++;
					
					
					}
				
			}		
	}
	fclose(arq);
	
	return 0;


int identifica_instrucao(char *operacao)
{
	if(!strcmp(operacao,"zeros"))
		return ZEROS;
	if(!strcmp(operacao,"and"))
		return AND;
	if(!strcmp(operacao,"andnota"))
		return ANDNOTA;
	if(!strcmp(operacao,"passa"))
		return PASSA;
	if(!strcmp(operacao,"xor"))
		return XOR;
	if(!strcmp(operacao,"or"))
		return OR;
	if(!strcmp(operacao,"nor"))
		return NOR;
	if(!strcmp(operacao,"xnor"))
		return XNOR;
	if(!strcmp(operacao,"passnota"))
		return PASSNOTA;
	if(!strcmp(operacao,"ornotb"))
		return ORNOTB;
	if(!strcmp(operacao,"nand"))
		return NAND;
	if(!strcmp(operacao,"ones"))
		return ONES;
	if(!strcmp(operacao,"add"))
		return ADD;
	if(!strcmp(operacao,"addinc"))
		return ADDINC;
	if(!strcmp(operacao,"inca"))
		return INCA;
	if(!strcmp(operacao,"subdec"))
		return SUBDEC;
	if(!strcmp(operacao,"sub"))
		return SUB;
	if(!strcmp(operacao,"deca"))
		return DECA;
	if(!strcmp(operacao,"lsl"))
		return LSL;
	if(!strcmp(operacao,"lsr"))
		return LSR;
	if(!strcmp(operacao,"asr"))
		return ASR;
	if(!strcmp(operacao,"asl"))
		return ASL;
	if(!strcmp(operacao,"loadlit"))
		return LOADLIT;
	if(!strcmp(operacao,"lc"))
		return LC;
	if(!strcmp(operacao,"lcl"))
		return LCL;
	if(!strcmp(operacao,"lch"))
		return LCH;
	if(!strcmp(operacao,"jf.neg"))
		return JFNEG;
	if(!strcmp(operacao,"jf.zero"))
		return JFZERO;
	if(!strcmp(operacao,"jf.carry"))
		return JFCARRY;
	if(!strcmp(operacao,"jf.negzero"))
		return JFNEGZERO;
	if(!strcmp(operacao,"jf.true"))
		return JFTRUE;
	if(!strcmp(operacao,"jf.overflow"))
		return JFOVERFLOW;
	if(!strcmp(operacao,"jt.neg"))
		return JTNEG;
	if(!strcmp(operacao,"jt.zero"))
		return JTZERO;
	if(!strcmp(operacao,"jt.carry"))
		return JTCARRY;
	if(!strcmp(operacao,"jt.negzero"))
		return JTNEGZERO;
	if(!strcmp(operacao,"jt.true"))
		return JTTRUE;
	if(!strcmp(operacao,"jt.overflow"))
		return JTOVERFLOW;
	if(!strcmp(operacao,"j"))
		return J;
	if(!strcmp(operacao,"jal"))
		return JAL;
	if(!strcmp(operacao,"jr"))
		return JR;
	if(!strcmp(operacao,"load"))
		return LOAD;
	if(!strcmp(operacao,"ld"))
		return LD;
	if(!strcmp(operacao,"store"))
		return STORE;
	if(!strcmp(operacao,"st"))
		return ST;
	if(!strcmp(operacao,"nop"))
		return NOP;
	if(!strcmp(operacao,".end"))
		return HALT;
	
	
}
