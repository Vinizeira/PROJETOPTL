/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class FornecedorDAO extends DataBaseDAO {
    public FornecedorDAO() throws Exception{}
    
    public java.util.ArrayList<Fornecedor> getLista() throws Exception {
        java.util.ArrayList<Fornecedor> lista = new java.util.ArrayList<Fornecedor>();
        String SQL="SELECT * FROM fornecedor";
        this.conectar();
        Statement stm = conn.createStatement(); //Para consultas
        ResultSet rs = stm.executeQuery(SQL);  //Craindo a lista
        while(rs.next()){
            Fornecedor f = new Fornecedor();
            f.setIdFornecedor(rs.getInt("idFornecedor")); //Paramento do BANCO
            f.setNome((rs.getString("nome")));
         
            lista.add(f);//Adicionando na lista
        }
        this.desconectar();
        return lista;
               
    }
    
     public boolean gravar(Fornecedor f){
        try{
            String sql;
            this.conectar();//abre a conexao
            if(f.getIdFornecedor()==0){
                sql = "INSERT INTO fornecedor(nome) VALUES (?)";
            }else{
                sql = "UPDATE fornecedor SET nome=? WHERE idFornecedor=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1,f.getNome());
           
       
            if(f.getIdFornecedor()>0)
                pstm.setInt(2,f.getIdFornecedor());
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }  
    
    }
     
       public Fornecedor getCarregaPorID(int idFornecedor) throws Exception{
         Fornecedor f = new Fornecedor();
         String sql = "SELECT * FROM  fornecedor WHERE idFornecedor=?";
         this.conectar();
         PreparedStatement pstm = conn.prepareStatement(sql);
         pstm.setInt(1,idFornecedor);
         ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                f.setIdFornecedor(idFornecedor);
                f.setNome(rs.getString("nome"));
                         
            }
            this.desconectar();
            return f;
       
     }
     
       public boolean deletar(Fornecedor f){
         try {
             String sql = "DELETE FROM fornecedor WHERE idFornecedor=?";
                this.conectar();
                PreparedStatement pstm = conn.prepareStatement(sql);
                pstm.setInt(1,f.getIdFornecedor());
                pstm.execute();
                this.desconectar();
                return true;
         } catch (Exception e) {
             System.out.println(e);
         return false;
         }
     }
     
     
    
}
