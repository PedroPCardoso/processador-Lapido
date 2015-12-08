#include<stdio.h>
#include<stdlib.h>

#define TRUE 1
#define FALSE 0
#define MAX 100

int main(void){
   
    int quociente;
    int resto;
    int divisor;
    int dividendo;
    int i,j;
    int vet[MAX];
    int teste;
   
    dividendo = 9;
    divisor = 2;
   
    teste = TRUE;
   
    i = 0;
    while(teste){
        resto = dividendo % divisor;
        quociente = dividendo/divisor;
        vet[i] = resto;
       
        dividendo = quociente;
        i++;
       
        if(quociente == 0){
             teste = FALSE;
             vet[i] = 1;
        }
    }    
    for(j = i-1; j >= 0; j--){        /*impressão do último para o primeiro*/
          printf("  %d", vet[j]);
    }
   
    printf("\n\n");
    system("pause");
    return 0;
}
