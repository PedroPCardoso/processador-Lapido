/**
    * Componente Curricular: Módulo Integrado de Concorrencia e Conectividade
    * Autor: <Henderson Souza Chalegre>
    * Data:  <19 de setembro de 2013>
    *
    * Declaro que este código foi elaborado por mim de forma individual e
    * não contém nenhum trecho de código de outro colega ou de outro autor, 
    * tais como provindos de livros e apostilas, e páginas ou documentos 
    * eletrônicos da Internet. Qualquer trecho de código de outra autoria que
    * uma citação para o  não a minha está destacado com  autor e a fonte do
    * código, e estou ciente que estes trechos não serão considerados para fins
    * de avaliação. Alguns trechos do código podem coincidir com de outros
    * colegas pois estes foram discutidos em sessões tutorias.
    */
package br.uefs.ecomp.util;

import static org.junit.Assert.assertEquals;

import java.io.FileNotFoundException;
import java.util.ArrayList;

import org.junit.Test;

/**
 * Testa o funcionamento do Paser, se estar consegundo lê do arquovo e jogar 
 * memoria
 * @author Henderson
 *
 */
public class PaserTest {
	
	
	  
    @Test
    public void testPaser() throws FileNotFoundException{
    	
    	Paser ar = new Paser();
    	ArrayList<String>  paser = ar.paser("teste1.asm");
    	
    	
    	assertEquals(".module flags", paser.get(0));
        
    	assertEquals(".pseg", paser.get(1));
    	
    	//assertEquals("   .word  0               ; errou flag ZERO", paser.get(85));
      
     //String x = (String) (paser.get(1)[0]);
    
  ///   int t =  Integer.parseInt(x);
      //  assertEquals(18,t);
      
    // assertEquals("chalegre", paser.get(2)[0]);
        
     //   assertEquals("ecomp", paser.get(2)[1]);
      
    }

}
