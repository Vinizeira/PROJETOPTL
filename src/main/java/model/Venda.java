/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author pfela
 */
public class Venda {
    
    private int idVenda;
    private Date dataVenda;
    private Usuario vendedor;
    private Cliente cliente;
    private int exibir;
    private ArrayList<VendaProduto> carrinho;

    public Venda() {
    }

    public Venda(int idVenda, Date dataVenda, Usuario vendedor, Cliente cliente,int exibir, ArrayList<VendaProduto> carrinho) {
        this.idVenda = idVenda;
        this.dataVenda = dataVenda;
        this.vendedor = vendedor;
        this.cliente = cliente;
        this.exibir = exibir;
       
        this.carrinho = carrinho;
    }

    public int getIdVenda() {
        return idVenda;
    }

    public void setIdVenda(int idVenda) {
        this.idVenda = idVenda;
    }

    public Date getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
        this.dataVenda = dataVenda;
    }

    public Usuario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Usuario vendedor) {
        this.vendedor = vendedor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public int getExibir() {
        return exibir;
    }

    public void setExibir(int exibir) {
        this.exibir = exibir;
    }
    
    

    public ArrayList<VendaProduto> getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(ArrayList<VendaProduto> carrinho) {
        this.carrinho = carrinho;
    }

    @Override
    public String toString() {
        return "Venda{" + "idVenda=" + idVenda + ", dataVenda=" + dataVenda + ", vendedor=" + vendedor + ", cliente=" + cliente + ", carrinho=" + carrinho + '}';
    }
    
    
}
