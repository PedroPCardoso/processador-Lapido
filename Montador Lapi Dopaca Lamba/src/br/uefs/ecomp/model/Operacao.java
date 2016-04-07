package br.uefs.ecomp.model;

import java.util.ArrayList;

public class Operacao {

	
	
	private int reg;
	private ArrayList<Label> label;
	private Dicionario d = new Dicionario();
	
	public void setLabel(ArrayList<Label> label){
	
		this.label = label;
	}


	public String intrucao(String aux) {
		
		ArrayList<String> c = cortar(aux);
		String aux2 = "";
		String aux3, aux4;
		
		if (!c.isEmpty()){
			
		aux3 = c.get(0);
		
		if (aux3.equals("jal")){
			
			if (c.size() == 2){
				
				aux3 = aux3 + "1";
			}
		}
		
		if (aux3.equals("jr")){
			
			if (c.size() == 2){
				
				aux3 = aux3 + "1";
			}
		}
		
		aux4 = d.operar(aux3);
		
		    if (aux4.equals("110XXXX0XXXXXXXX")|| aux4.equals("110XXXX1XXXXXXXX")){
		    	
		    	aux2 = aux4 + buscarLabel(c.get(1)) + "XXXXXXXXXXXX";
		    	
		    }
			
			
			if(aux4.equals("00100011") || aux4.equals("00100110")){
				
				
				aux2 = aux4 + d.operar(c.get(1)) + d.operar(c.get(1))+ "1111"+ "xxxxxxxxxxx";
				
			}
			else if (aux4.equals("00110000")){
				
				aux2 = aux4 + d.operar(c.get(1)) + "0000" + "0000" + "xxxxxxxxxxx";
				
			}
			
			else if(aux4.equals("00110011") || aux4.equals("00110101")){
				
				aux2 = aux4 + d.operar(c.get(1)) + d.operar(c.get(1)) + "0000" + "xxxxxxxxxxx";
				
				
			}	
			
			
			
			
			else{
			switch(aux4.substring(0,2)){
			
			case "000": 
				
				aux2 = aux4;
				
			case "001": 				
							
				aux2 = aux4 + d.operar(c.get(1)) + d.operar(c.get(2)) + d.operar(c.get(3))+ "xxxxxxxxxxx";
			
				
			case "010":  
				
				aux2 = aux4	+ d.operar(c.get(1))+ "xxxx" + "?????";
				
			case "":	
			}
			}
		}
		
		
		
		
		
		return aux2;
		
		
		
		}
	
	
public String buscarLabel(String string) {
	
	String a = "";
	for (int i = 0; i < label.size();i++){
		
		if(string.equals(label.get(i).getNome())){
			
			a= label.get(i).getLinha();
		}
		
	}
	
		return a;
	}


public static ArrayList<String> cortar(String a) {
		
		int i = 0;
		String f = "";
		ArrayList<String> c = new ArrayList<String>();
		while(i < a.length()){
			
			if (a.charAt(i) != ' ' && a.charAt(i) != '	'){
				
				if (a.charAt(i) != ','){
				f = f + a.charAt(i); 
				}
			}
			
			else {
				c.add(f);				
				f = "";
			}
		i++;
		}
		
		return c;
	} 

	
	
	
	public String binario(int x, int bits){
		
		
		StringBuffer binario = new StringBuffer(); // guarda os dados
		
		String sinal;
		if (x < 0){
			sinal = "1";
			x = x*(-1);
			
		}
		else{
			sinal = "0";
			
		}
		
		if (x==0){
			binario.append(0);
		}
		 
		
		while (x > 0) {
			int b = x % 2;
			binario.append(b);
			x = x >> 1; // é a divisão que você deseja
		}
	
			String a = binario.reverse().toString();
		
		int cont = bits - 1 - a.length();
		String b = "";
		
		for(int i = 0; i < cont; i++){
			
			b = b + "0";
			
		}
		
	
		return sinal + b + a;
		
		
	}
	
	



	public String salvarRegistradores(String aux) {

     //int i = aux.algumacoisa;
				
		//	String a = operar("r"+reg) + binario(i);	
		 //   reg++;
		return aux;
	}



	

}
