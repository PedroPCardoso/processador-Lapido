package br.uefs.ecomp.model;

public class Label {

	
	private String linha;
	private String nome;
	public Label(String f, String cont) {
		
		nome = f;
		linha = cont;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getLinha() {
		return linha;
	}
	public void setLinha(String linha) {
		this.linha = linha;
	}
}
