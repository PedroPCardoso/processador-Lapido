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

import br.uefs.ecomp.model.Montador;

public class MontadorTest {
	
	
	  
    @Test
    public void testMontar(){
    	Montador m = new Montador();
    	ArrayList<String> c2 = new  ArrayList<String>();
    	
    	c2.add("LOOP:   inca r1,r1	;");
    	c2.add("load r3,r1	;");
    	c2.add("sub r6,r2,r3	;r6 nao e utilizado apenas interessa o resultado presente à saida da ALU para as flags");
    	c2.add("jt.negzero TROCA	;r2<=r3 faz troca de posicao no array");
    	c2.add("nop");
    	c2.add(".word   10");
    	c2.add(".word   -1");
    	c2.add(".word   6");
    	c2.add(".word   3");
    	
    	m.montar(c2);
    	
    	assertEquals("L1", m.getGravar(0));
    	
    	
    }
	
	  
    @Test
    public void testProcurarLabel() throws FileNotFoundException{
    	
    	Montador m = new Montador();
    	ArrayList<String> c2 = new  ArrayList<String>();
    	
    	c2.add("L1:  loadlit r2,2");
    	c2.add("LOOP:   inca r1,r1	;");
    	c2.add("DIV: sub r1,r1,r2");
    	c2.add("FIM: j FIM");
    	
    	m.procurarLabel(c2);
    	
    	assertEquals("L1", m.getLabel().get(0).getNome());
    	assertEquals("0000", m.getLabel().get(0).getLinha());

    	assertEquals("LOOP", m.getLabel().get(1).getNome());
    	assertEquals("0001", m.getLabel().get(1).getLinha());
      
    	assertEquals("DIV", m.getLabel().get(2).getNome());
    	assertEquals("0010", m.getLabel().get(2).getLinha());
      
    	assertEquals("FIM", m.getLabel().get(3).getNome());
    	assertEquals("0011", m.getLabel().get(3).getLinha());
      
   
    }

}
