/**
    * Componente Curricular: M�dulo Integrado de Concorrencia e Conectividade
    * Autor: <Henderson Souza Chalegre>
    * Data:  <19 de setembro de 2013>
    *
    * Declaro que este c�digo foi elaborado por mim de forma individual e
    * n�o cont�m nenhum trecho de c�digo de outro colega ou de outro autor, 
    * tais como provindos de livros e apostilas, e p�ginas ou documentos 
    * eletr�nicos da Internet. Qualquer trecho de c�digo de outra autoria que
    * uma cita��o para o  n�o a minha est� destacado com  autor e a fonte do
    * c�digo, e estou ciente que estes trechos n�o ser�o considerados para fins
    * de avalia��o. Alguns trechos do c�digo podem coincidir com de outros
    * colegas pois estes foram discutidos em sess�es tutorias.
    */
package br.uefs.ecomp.util;

import static org.junit.Assert.assertEquals;

import java.io.FileNotFoundException;
import java.util.ArrayList;

import org.junit.Test;

/**
 * Testa o funcionamento do Paser, se estar consegundo l� do arquovo e jogar 
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
