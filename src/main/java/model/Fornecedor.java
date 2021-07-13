/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class Fornecedor {
    private int idFornecedor;
   private String nome;
   

    public Fornecedor() {
    }

    public Fornecedor(int idFornecedor, String nome) {
        this.idFornecedor = idFornecedor;
        this.nome = nome;
        
    }

    public int getIdFornecedor() {
        return idFornecedor;
    }

    public void setIdFornecedor(int idFornecedor) {
        this.idFornecedor = idFornecedor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }


    @Override
    public String toString() {
        return "Fornecedor{" + "nome=" + nome + '}';
    }
    
    
    
}
