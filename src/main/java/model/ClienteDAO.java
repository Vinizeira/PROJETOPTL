/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author pfela
 */
public class ClienteDAO extends DataBaseDAO{
    
    public ClienteDAO()throws Exception{}
    
    public ArrayList<Cliente> getLista() throws Exception{
    
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        String sql = "SELECT * FROM cliente";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next()){
            Cliente c = new Cliente();
            c.setIdCliente(rs.getInt("idCliente"));
            c.setNomeRazao(rs.getString("nomeRazao"));
            c.setCpfCnpj(rs.getString("cpfCnpj"));
            c.setRgIe(rs.getString("rgIe"));
            c.setDataNascAbertura(rs.getDate("dataNascAbertura"));
            c.setTipo(rs.getInt("tipo"));
            c.setStatus(rs.getInt("status"));
            lista.add(c);
        
        }
        this.desconectar();
        return lista;
    
    }
    
    
    public boolean gravar(Cliente c){
    
    try{
        this.conectar();
        String sql;
        if(c.getIdCliente()==0){
            sql = "INSERT INTO cliente(nomeRazao, cpfCnpj, rgIe, dataNascAbertura, tipo, status) "
                    + "VALUES(?,?,?,?,?,?)";
        }else{
            sql = "UPDATE cliente SET nomeRazao=?, cpfCnpj=?, rgIe=?, dataNascAbertura=?, tipo=?, status=? "
                    + "WHERE idCliente=?";
        }
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,c.getNomeRazao());
        pstm.setString(2, c.getCpfCnpj());
        pstm.setString(3,c.getRgIe());
        pstm.setDate(4, new Date(c.getDataNascAbertura().getTime()));
        pstm.setInt(5,c.getTipo());
        pstm.setInt(6, c.getStatus());
        if(c.getIdCliente()>0){
            pstm.setInt(7,c.getIdCliente());
        }
        pstm.execute();
        this.desconectar();
        return true;
        
    
    }catch(Exception e){
        System.out.println(e);
        return false;
    }
    
        
    }
    
   public boolean deletar(Cliente c){
         try {
             String sql = "UPDATE cliente SET status=2 WHERE idCliente=?";
             this.conectar();
             PreparedStatement pstm = conn.prepareStatement(sql);
             pstm.setInt(1,c.getIdCliente());
             pstm.execute();
             this.desconectar();
             return true;
             
         } catch (Exception e) {
             System.err.println(e);
             return false;
         }
     }
    
    public Cliente getCarregaPorID(int idCliente)throws Exception{
    
        Cliente c = new Cliente();
        String sql = "SELECT * FROM cliente WHERE idCliente=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idCliente);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            c.setIdCliente(rs.getInt("idCliente"));
            c.setNomeRazao(rs.getString("nomeRazao"));
            c.setCpfCnpj(rs.getString("cpfCnpj"));
            c.setRgIe(rs.getString("rgIe"));
            c.setDataNascAbertura(rs.getDate("dataNascAbertura"));
            c.setTipo(rs.getInt("tipo"));
        }
        this.desconectar();
        return c;
    
    }
    
}
