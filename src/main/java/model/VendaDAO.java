/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

//import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author viniz
 */
public class VendaDAO extends DataBaseDAO{
     public VendaDAO() throws Exception{}
     
     public boolean registrar (Venda v){   
     
          try{
            this.conectar();
            String sql = "INSERT INTO venda (dataVenda, idCliente, idUsuario) "
                    + "VALUES(now(),?,?)";
            
            PreparedStatement pstm = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1,v.getCliente().getIdCliente());
            pstm.setInt(2,v.getVendedor().getIdUsuario());
            pstm.execute();
            ResultSet rs = pstm.getGeneratedKeys();
            if(rs.next()){
                v.setIdVenda(rs.getInt(1));
            }
             for(VendaProduto vp: v.getCarrinho()){
                String sql_vp= "INSERT INTO venda_produto(idVenda, idProduto, qntdVendida, valor) "
                        + "VALUES(?,?,?,?)";
                PreparedStatement pstm_vp = conn.prepareCall(sql_vp);
                pstm_vp.setInt(1,v.getIdVenda());
                pstm_vp.setInt(2,vp.getProduto().getIdProduto());
                pstm_vp.setInt(3, vp.getQtd());
                pstm_vp.setDouble(4, vp.getValorVendido());
                pstm_vp.execute();
            }
            this.desconectar();
            return true;
        
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
         
         
     }
     
      
    public ArrayList<Venda> getLista()throws Exception{
        this.conectar();
        String sql = "SELECT * FROM venda";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Venda> lista = new ArrayList<Venda>();
        while(rs.next()){
            Venda v = new Venda();
            v.setIdVenda(rs.getInt("idVenda"));
            v.setDataVenda(rs.getDate("dataVenda"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.getCarregaPorID(rs.getInt("idCliente")));
            UsuarioDAO uDAO = new UsuarioDAO();
            v.setVendedor(uDAO.getCarregaPorID(rs.getInt("idUsuario")));
            v.setExibir(rs.getInt("exibir"));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    
    }
    
    
    
    
      public boolean deletar(int idVenda){
        
        try{
            String sql = "UPDATE venda SET exibir=2 WHERE idVenda=?";
            this.conectar();
            PreparedStatement pstm =conn.prepareStatement(sql);
            pstm.setInt(1, idVenda);
            pstm.execute();
            this.desconectar();
            return true;
            
        }catch(Exception e){
            System.out.println(e);
            return false;
        }  
    }
    
    
    
    
  
    
}
