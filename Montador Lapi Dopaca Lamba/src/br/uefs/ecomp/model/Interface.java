package br.uefs.ecomp.model;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;

import br.uefs.ecomp.util.Paser;

public class Interface {

	public static void main(String[] args) {
		
		final Montador m = new Montador();
		JFrame cb =	new	JFrame("Montador Lapi Dopaca Lamba");
		cb.setSize(800,600);
		cb.setLocationRelativeTo(null);
		cb.setResizable(false);
		cb.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		final  JTextArea palavras = new JTextArea(10,12);
		JButton importar = new JButton("Importar");
		//final ArrayList<String> l3 = new ArrayList<String>();
		importar.addActionListener(new ActionListener(){

				
				@Override
				public void actionPerformed(ActionEvent e) {
					
					JFileChooser x = new JFileChooser();
					x.setFileSelectionMode(JFileChooser.FILES_ONLY); 
					x.getFileSelectionMode();
					
					 String arquivoWave;   
					 
					  if(x.showOpenDialog(x) == JFileChooser.APPROVE_OPTION){   
			              arquivoWave = x.getSelectedFile().getPath();   
			          }          
			            
			          else{   
			              arquivoWave = "";   
			                
			          }   
					
																				
					Paser p = Paser.getEstance();
					ArrayList<String> l = new ArrayList<String>();
					ArrayList<String> l2  = new ArrayList<String>();
										
					try {
						  l = p.paser(arquivoWave);
					} catch (FileNotFoundException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}	
					
					
					while(!l.isEmpty()){					
					String w = l.remove(0);
					palavras.setText(palavras.getText()+ w + "\n" );
					l2.add(w);
					
					}
				
					m.montar(l2);
					
								
					
					
					
				}});
		
		
		
		JButton Salvar = new JButton("Salvar");
		
		 Salvar.addActionListener(new ActionListener(){

		
			 @Override
				public void actionPerformed(ActionEvent e) {
 
				 
				 JFileChooser x = new JFileChooser();
					x.setFileSelectionMode(JFileChooser.FILES_ONLY); 
					x.getFileSelectionMode();
					
					 String arquivoWave;   
					 
					  if(x.showOpenDialog(x) == JFileChooser.APPROVE_OPTION){   
			              arquivoWave = x.getSelectedFile().getPath();   
			          }          
			            
			          else{   
			              arquivoWave = "";   
			                
			          }   
					
					 
					  try {
						m.gravar(arquivoWave);
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					   
			 }
					
				});
		
		 
		 JPanel layout = new JPanel(new BorderLayout()) ;
			JPanel layout2 = new JPanel(new BorderLayout()) ;
		 
			layout2.add(importar, BorderLayout.NORTH );
			layout2.add(Salvar, BorderLayout.SOUTH );
		 
			layout.add(layout2, BorderLayout.EAST );
			
			
			layout.add(palavras, BorderLayout.CENTER );
			
		cb.setContentPane(layout);
		 
		 
		 
		cb.setVisible(true);
		
	}

}
