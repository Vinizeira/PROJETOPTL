/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author viniz
 */
public class Produto {
  private  int idProduto;
  private  String nome;
  private  String marca;
  private String tamanho;
  private  double preco;
  private String imagem;
  private  int status;
  private int qntd;
  private  Fornecedor fornecedor;

    public Produto() {
    }

    public Produto(int idProduto, String nome, String marca, String tamanho, double preco, String imagem, int status,int qntd,Fornecedor fornecedor) {
        this.idProduto = idProduto;
        this.nome = nome;
        this.marca = marca;
        this.tamanho = tamanho;
        this.preco = preco;
        this.imagem = imagem;
        this.status = status;
        this.qntd = qntd;
        this.fornecedor = fornecedor;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

   

  
    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getQntd() {
        return qntd;
    }

    public void setQntd(int qntd) {
        this.qntd = qntd;
    }
    
    

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    @Override
    public String toString() {
        return "Produto{" + "nome=" + nome + '}';
    }

    
  
   
    
}
