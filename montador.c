#include <stdio.h>
#include <stdlib.h>
#include <string.h>
  
 
 	
char * identifica_instrucao(char *operacao)   // Codigo OP das instruções
 { 
	// aritmeticas
	char *zeros="00110000";
	char *AND= "00110001";
	char *ANDNOTA = "00110010";
	char *PASSA ="00110101";
	char *XOR= "00110110";
	char *OR= "00110111";
	char *NOR="00111110";
	char *XNOR="00111001";
	char *PASSNOTA= "00111010";
	char *ORNOTB= "00111101";
	char *NAND ="00111000";
	char *ONES="00111111";
	char *ADD="00100000";
	char *ADDINC="00100001";
	char *INCA="00100011";
	char *SUBDEC ="00100100";
	char *SUB = "00100101";
	char *DECA="00100110";
	char *ASR="00101001";
	char *LSL="00101000";
	
	
	char *PASSB = "00110011" ;
	char *ANDNOTB="00110100"; 
	char *ORNOTA ="00111011 ";
	char *PASSNOTB= "00111100 ";
	
	char *LSR="001";
	char *ASL="001";
	char *LOADLIT;
	char *LC;
	char *LCL;
	char *LCH;
	char* JFNEG;
	char *JFZERO;
	char* JFCARRY;
	char* JFNEGZERO;
	char* JFTRUE;
	char* JFOVERFLOW;
	char *JTNEG;
	char *JTZERO;
	char * JTCARRY;
	char *JTNEGZERO;
	char *JTTRUE;
	char *JTOVERFLOW;
	char *J;
	char *JAL;
	char *JR;
	char *LOAD;
	char *LD;
	char *STORE;
	char *ST;
	char *NOP;
	char *HALT;
	
	char *nada;
	
	if(!strcmp(operacao,"passb"))
		 return PASSB;
	 
	if(!strcmp(operacao,"andnotb"))
		 return ANDNOTB;
	 
	if(!strcmp(operacao,"ornota"))
		 return ORNOTA;
	 
	if(!strcmp(operacao,"passnotb"))
		 return PASSNOTB;
	 
	if(!strcmp(operacao,"zeros"))
		 return zeros;
	 
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
	else {return nada;}
} 

void escrevendo(char *dado ){  // Escreve num arquivo 
	char url[]="codigo.txt";
	FILE *arq;
	arq = fopen(url, "a+");
	if(arq == NULL)
			printf("Erro, nao foi possivel abrir o arquivo\n");
			
	else{
		fprintf(arq, dado);
	}
	
	}
  
int main(){
char url[]="test.asm";   // nome do arquivo a ser decoficado 
	char ch;
	const char s[2] = ",";
	char *token;
	 
	FILE *arq;
	char instrucao[7];
	for(int i=0;i<7;i++)
	instrucao[i]='\0';
	
	arq = fopen(url, "r");
	if(arq == NULL)
	    printf("Erro, nao foi possivel abrir o arquivo\n");
	else{
		
		int cont=0;
	    while( (ch=fgetc(arq))!= EOF ){
		printf("Instrução é essa %s \n ",instrucao);
		printf("Numero do Ch : %d \n",ch);	
				if (ch==32){    // esse if é pra quando eu achar a instrução completa.
					//putchar(ch);
					printf("%s",instrucao);
					char *op;
					op= identifica_instrucao(instrucao);
					printf("A instrução %s",op);
					escrevendo(op);	
					cont=0;	
					
					for(int i=0;i<7;i++)
						instrucao[i]='\0';
					
						}

			
					
					else{
						
					printf ("\n");
					printf ("%i",ch);
					instrucao[cont]=ch;
					
					cont++;
						
					
						}
				
					}
					
					
	  
					   /* get the first token */
					   token = strtok(instrucao, s);
					   
					   /* walk through other tokens */
					   while( token != NULL ) 
					   {
						  printf( "vai um  %s\n", token );
						
						




						if(strcmp(token,"r1")==0){
										escrevendo("foium");
										
										//escrevendo("0001");
										
										}
								if(strncmp(token,"r2",3)==0){
										escrevendo("foidois");
										
									//	escrevendo("0021");
										
										} 
								if(strncmp(token,"r3",3)==0){
												escrevendo("foitres");
										
									//	escrevendo("0031");
										
										} 
									
						
						
						  token = strtok(NULL, s);
					   }				
		fclose(arq);
	}
	
	return 0;
}

