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
		
		
		l = procurarLabel(a);
		
		op.setLabel(label);
			
		
		while(!l.isEmpty()){
			
			 aux =  l.remove(0); 
			 
			 aux = aux.trim();
			 
			 aux2 = aux.substring(0,1);
			
			  
			 if (aux2.charAt(0)!= ';'){
				 
				 if (aux2.charAt(0)!= '.'){
		
					 aux3 = op.intrucao(aux);
					 gravar.add(aux3);
										 
				 }
				 
				 else{
					 
					 if(!aux.equals(".end")){
					
						
						 if (aux.charAt(1) == 'w'){
							 
							 int i = 5;
							 String aux5 = ""; 
							 while(i < aux.length()){
								
								 if (aux.charAt(i) != ';'){
									 
									 if (aux.charAt(i) != ' ' && aux.charAt(i) != '	'){
											 
									 aux5 =  aux5 + aux.charAt(i);
									 }
								 
								 }else break;
								 
								 i++;
							 }
							 
							 memoria.add(op.binario(Integer.parseInt(aux5), 16));
							 
						 }
					 }
				 }
				 
				
			 }
			 
		}
		
		
		
		
			
		
	}
	
	//procura label
	public ArrayList<String> procurarLabel(ArrayList<String> a) {
		
		 ArrayList<String> c2 = new  ArrayList<String>();
		  String aux, aux2; 
		int cont = 0; 
		int h =0;
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
									
									 if (aux.equals(f)){ h =1; }
									 else h=0;
								
							}
								
							}
							i++;
							}
						cont++;	
				 }
			 }
			 if (h==0){ c2.add(aux);}
			 
		
		
	}
		return c2;
	}

	public void gravar(String arquivoWave) throws IOException {
		
		Paser p = Paser.getEstance();
		
		
				
		p.gravar(gravar, arquivoWave + "_instruction.txt");
		p.gravar(memoria, arquivoWave + "_data.txt");
		
	}

	public String getGravar(int i) {
		
		return gravar.get(i);
	}

}
