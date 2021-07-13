/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author viniz
 */
public class ProdutoDAO  extends DataBaseDAO{
    public ProdutoDAO() throws Exception{}
         public  ArrayList<Produto>getLista() throws Exception{
         
         ArrayList<Produto> lista = new ArrayList<Produto>();
         String sql = "SELECT p.*, f.nome FROM produto p "
                 +"INNER JOIN fornecedor f ON f.idFornecedor = p.idFornecedor ";
                 
           this.conectar();
        
         PreparedStatement pstm = conn.prepareStatement(sql);
         ResultSet rs = pstm.executeQuery();
         while (rs.next()){
             Produto p = new Produto();
             p.setIdProduto(rs.getInt("p.idProduto"));
             p.setNome(rs.getString("p.nome"));
             p.setMarca(rs.getString("p.marca"));
             p.setTamanho(rs.getString("p.tamanho"));
             p.setPreco(rs.getDouble("p.preco"));
             p.setImagem(rs.getString("p.imagem"));
             p.setStatus(rs.getInt("p.status"));
             p.setQntd(rs.getInt("p.qntd"));
             Fornecedor f = new Fornecedor();
             f.setIdFornecedor(rs.getInt("p.idFornecedor"));
             f.setNome(rs.getString("f.nome"));
             p.setFornecedor(f);
            
             lista.add(p);
            
                    
         }
         this.desconectar();
         return lista;
     }
         
         
            public  ArrayList<Produto>getUltimosAdicionado() throws Exception{
         
         ArrayList<Produto> UltimosAdicionado = new ArrayList<Produto>();
         String sql = "SELECT p.*, f.nome FROM produto p "
                 +"INNER JOIN fornecedor f ON f.idFornecedor = p.idFornecedor "
                 + "ORDER BY idProduto DESC LIMIT 15 ";
                 
           this.conectar();
        
         PreparedStatement pstm = conn.prepareStatement(sql);
         ResultSet rs = pstm.executeQuery();
         while (rs.next()){
             Produto p = new Produto();
             p.setIdProduto(rs.getInt("p.idProduto"));
             p.setNome(rs.getString("p.nome"));
             p.setMarca(rs.getString("p.marca"));
             p.setTamanho(rs.getString("p.tamanho"));
             p.setPreco(rs.getDouble("p.preco"));
             p.setImagem(rs.getString("p.imagem"));
             p.setStatus(rs.getInt("p.status"));
             p.setQntd(rs.getInt("p.qntd"));
             Fornecedor f = new Fornecedor();
             f.setIdFornecedor(rs.getInt("p.idFornecedor"));
             f.setNome(rs.getString("f.nome"));
             p.setFornecedor(f);
            
              UltimosAdicionado.add(p);
            
                    
         }
         this.desconectar();
         return  UltimosAdicionado;
     }
         
         
         
         
         
  public  Produto getVisualizar(int idProduto) throws Exception{
         Produto p = new Produto();
         String sql = "SELECT p.*, f.nome FROM produto p "
                 +"INNER JOIN fornecedor f ON f.idFornecedor = p.idFornecedor WHERE idProduto=?";
  
           this.conectar();
        
             this.conectar();
                 PreparedStatement pstm = conn.prepareStatement(sql);
                 pstm.setInt(1, idProduto);
                 ResultSet rs=pstm.executeQuery();    
         while (rs.next()){
        
             p.setIdProduto(rs.getInt("p.idProduto"));
             p.setNome(rs.getString("p.nome"));
             p.setImagem(rs.getString("p.imagem"));
             Fornecedor f = new Fornecedor();
             f.setIdFornecedor(rs.getInt("p.idFornecedor"));
             f.setNome(rs.getString("f.nome"));
             p.setFornecedor(f);         
         }
         this.desconectar();
         return p;
     }
  
     public  Produto getVerImagem(int idProduto) throws Exception{
         Produto p = new Produto();
         String sql = "SELECT imagem FROM produto WHERE idProduto=? ";
                 
  
           this.conectar();
        
             this.conectar();
                 PreparedStatement pstm = conn.prepareStatement(sql);
                 pstm.setInt(1, idProduto);
                 ResultSet rs=pstm.executeQuery();    
         while (rs.next()){
        
             p.setIdProduto(rs.getInt("p.idProduto"));
             p.setImagem(rs.getString("p.imagem"));
                  
         }
         this.desconectar();
         return p;
     }
         
         
         
         
         
      public boolean gravar(Produto p){
         try {
             String sql;
             this.conectar();
           
             if(p.getIdProduto()==0){
                 sql="INSERT INTO produto (nome,marca,tamanho,preco,imagem,status,qntd,idFornecedor)"
                         + "VALUES (?,?,?,?,?,?,?,?)";
             } else {
                 sql="UPDATE produto SET nome=?, marca=?, tamanho=?, preco=?, imagem=?, status=?, qntd=?, idFornecedor=? "
                         + "WHERE idProduto=? ";
             }
             
             PreparedStatement pstm = conn.prepareStatement(sql);
             pstm.setString(1, p.getNome());
             pstm.setString(2, p.getMarca());
             pstm.setString(3, p.getTamanho());
             pstm.setDouble(4, p.getPreco());
             pstm.setString(5, p.getImagem()); 
             pstm.setInt(6, p.getStatus());
             pstm.setInt(7, p.getQntd());
             pstm.setInt(8,p.getFornecedor().getIdFornecedor()); //parameto para chamar o perfil de outra classe
             if(p.getIdProduto()>0)
                 pstm.setInt(9,p.getIdProduto());
             pstm.execute();
             this.desconectar();
             return true;
             
         } catch (Exception e) {
             System.out.println(e);
             return false;
         }
     }
      
          public  Produto getCarregaPorID(int idProduto) throws Exception{
         Produto p = new Produto();
         String sql = "SELECT p.*, f.nome FROM produto p "
                 +"INNER JOIN fornecedor f ON f.idFornecedor = p.idFornecedor WHERE idProduto=?";
  
           this.conectar();
        
             this.conectar();
                 PreparedStatement pstm = conn.prepareStatement(sql);
                 pstm.setInt(1, idProduto);
                 ResultSet rs=pstm.executeQuery();    
         while (rs.next()){
        
             p.setIdProduto(rs.getInt("p.idProduto"));
             p.setNome(rs.getString("p.nome"));
             p.setMarca(rs.getString("p.marca"));
             p.setTamanho(rs.getString("p.tamanho"));
             p.setPreco(rs.getDouble("p.preco"));
             p.setImagem(rs.getString("p.imagem"));
             p.setStatus(rs.getInt("p.status"));
             p.setQntd(rs.getInt("p.qntd"));
             Fornecedor f = new Fornecedor();
             f.setIdFornecedor(rs.getInt("p.idFornecedor"));
             f.setNome(rs.getString("f.nome"));
             p.setFornecedor(f);         
         }
         this.desconectar();
         return p;
     }
        
       public boolean vender(Produto p){
         try {
             String sql = "UPDATE produto SET status=2 WHERE idProduto=?";
             this.conectar();
             PreparedStatement pstm = conn.prepareStatement(sql);
             pstm.setInt(1,p.getIdProduto());
             pstm.execute();
             this.desconectar();
             return true;
             
         } catch (Exception e) {
             System.out.println(e);
             return false;
         }
     }
        
        
           public boolean deletar(Produto p){
         try {
             String sql = "DELETE FROM produto WHERE idProduto=?";
          
                this.conectar();
                PreparedStatement pstm = conn.prepareStatement(sql);
                pstm.setInt(1,p.getIdProduto());
                pstm.execute();
                this.desconectar();
                return true;
         } catch (Exception e) {
             System.out.println(e);
         return false;
         }
     }
        
        
      
      
    
    
    
    
    
}
