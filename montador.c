#include <stdio.h>
#include <stdlib.h>
#include<string.h>
   struct cel {
      char   conteudo[200]; 
      struct cel *prox;
   };
   
   typedef struct cel celula;  // célula
   void inserir(celula *ini);
   char *compare (celula *ini, char funcao[200] );
  
  
int main(){
	celula c, *ini;
	c.prox = NULL;
	ini = &c;
	printf("ola");
	inserir(ini);
	compare (ini,funcao[200]);
	celula *p;  
	for (p = ini->prox; p != NULL; p = p->prox) {
		 char *ola = p->conteudo; 
		 printf ("%s",ola );
		}
		
	return 0;
	
}


		
	void inserir(celula *ini){
		char url[] = "ola.txt";
		char ch[200]; // dado a ser inserido na lista
		FILE *arc;
		printf( " entrou");
		arc = fopen(url, "r");
		
		
		
		while(fgets(ch,200 ,arc)){
		// metodo para inserir na lista, percorendo
		
		printf("%s",ch);	
		
		
		celula *p;
		p = ini->prox;
		
		
	    celula *nova;
	    nova = malloc (sizeof (celula));
	    
	    for(int i=0;i<200;i++){
		nova->conteudo[i]= ch[i];
	   
			}
	    
	    
	    while (p != NULL) 
				if (p->prox==NULL){
					
					p->prox = nova;
					
					
					} 
		   
		p= p->prox;
		
		}
	
		
	}
	
	
	

	// Retonar a função caso ela esteeja na lista.
	char *compare (celula *ini, char funcao[200] ) {
	   celula *p;
	   for (p = ini->prox; p != NULL; p = p->prox) {
		   if ( strcmp (p->conteudo,funcao)){
			   return funcao;
			   }
		  printf ("%s\n", p->conteudo);
	  }
	  return "nao encontrada";
	}	
	
	
