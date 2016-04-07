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

import br.uefs.ecomp.model.Montador;
import br.uefs.ecomp.model.Operacao;

/**
 * Testa o funcionamento do Paser, se estar consegundo l� do arquovo e jogar 
 * memoria
 * @author Henderson
 *
 */
public class OperacaoTest {
	
	
	  
    @Test
    public void testBinario() throws FileNotFoundException{
    	
    	Operacao o = new Operacao();
    	
    	assertEquals("00", o.binario(0,0));
    	assertEquals("0000", o.binario(0,4));
    	assertEquals("1001", o.binario(-1,4));
    	assertEquals("011", o.binario(3,0));
    	assertEquals("010", o.binario(2,0));
    	assertEquals("1101", o.binario(-5,4));
    	assertEquals("0000001000", o.binario(8,10));
    	assertEquals("1000001000", o.binario(-8,10));
    	assertEquals("1011", o.binario(-3,4));
    	assertEquals("10000010", o.binario(-2,8));
    }

}
