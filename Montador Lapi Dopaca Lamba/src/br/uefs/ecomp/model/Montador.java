package br.uefs.ecomp.model;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import br.uefs.ecomp.util.Paser;

public class Montador {
	
	private ArrayList<String> gravar = new ArrayList<String>();
	private ArrayList<Label> label = new ArrayList<Label>();
	private ArrayList<String> memoria = new ArrayList<String>();
	private Operacao op = new Operacao();
	
	
	public ArrayList<Label> getLabel(){
		
		return label;
	}
	
	public void montar(ArrayList<String> a) {
		
		
		
		ArrayList<String> l  = a;
		
		String aux, aux2, aux3 ;
		
		
		procurarLabel(a);
		
		op.setLabel(label);
			
		
		while(!l.isEmpty()){
			
			 aux =  l.remove(0); 
			 
			 aux = aux.trim();
			 
			 aux2 = aux.substring(0,1);
			
			  
			 if (!aux2.equals(";")){
				 
				 if (!aux2.equals(".")){
		
					aux3 = op.intrucao(aux);
					
					gravar.add(aux3);
			 
				 }
				 
				 else {
					 
					 aux2 = aux.substring(0,5);
					 
					 if (aux2.equals(".word")){
						 
						 aux = aux.substring(aux2.length(), aux.length());
						 
						 aux.trim();
						 
						 memoria.add(op.binario(Integer.parseInt(aux), 16));
						 
					 }
				 }
			 }
		}
		
		
		
			
		
	}
	
	//procura label
	public void procurarLabel(ArrayList<String> a) {
		
		 ArrayList<String> c2 = new  ArrayList<String>();
		  String aux, aux2; 
		int cont = 0; 
		 
		while(!a.isEmpty()){
			
			 aux =  a.remove(0); 
			 
			 aux = aux.trim();
			 
			 aux2 = aux.substring(0,1);
			
			  
			 if (!aux2.equals(";")){
				 
				 if (!aux2.equals(".")){
		
					 int i = 0;
						String f = "";
						
						while(i < aux.length()){
							
							if (aux.charAt(i) != ' ' && aux.charAt(i) != '	'){
								
								
								
									f = f + aux.charAt(i); 
									
									
								}
							
							else{
								
								if (f.charAt(f.length()-1) == ':'){
									aux = aux.substring(f.length(), aux.length());
									f = f.substring(0, f.length()-1);
									
									
									label.add(new Label(f,op.binario(cont, 4)));
									
								
							}
								
							}
							i++;
							}
						cont++;	
				 }
			 }
		 c2.add(aux);
		
	}
	}

	public void gravar(String arquivoWave) throws IOException {
		
		Paser p = Paser.getEstance();
		
		p.gravar(gravar, arquivoWave + "_instruction");
		p.gravar(memoria, arquivoWave + "_data");
		
	}

}
