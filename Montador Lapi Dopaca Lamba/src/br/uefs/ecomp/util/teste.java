package br.uefs.ecomp.util;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class teste {

	public static void main(String[] args) throws IOException {
	


    
  
		   ArrayList<String> c = new  ArrayList<String>();
		   c.add("A1");
		   c.add("A2");
		   c.add("A3");
		   
		   qualquer(c);
		   
		   
		   while (!c.isEmpty()){
			   
			   System.out.println(c.remove(0));
			   
			   
		   }
	}

	private static void qualquer(ArrayList<String> c) {
		ArrayList<String> c1 = c;  
		 ArrayList<String> c2 = new  ArrayList<String>();
		  
		   while (!c1.isEmpty()){
			   
			   String cd = c1.remove(0);
			   System.out.println(cd);
			   c2.add(cd);
			   
			   
		   }
		   
		   c.addAll(c2);
		
	}

	
	

	}


