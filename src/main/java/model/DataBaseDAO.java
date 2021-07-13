package model;


import java.sql.Connection;
import java.sql.DriverManager;


public class DataBaseDAO {
    
    public final String URL="jdbc:mysql://localhost:3306/bd_ptlbc";
    public final String USER="root";
    public final String SENHA="";
    public Connection conn;
    
    public DataBaseDAO() throws Exception{
     Class.forName("com.mysql.jdbc.Driver");    
    }
    
    public void conectar() throws Exception{
        conn= DriverManager.getConnection(URL,USER,SENHA);//Metodo para saber se vai a ver conexao com user do banco
    }
    
    public void desconectar() throws Exception{
        conn.close();
    }
    
    
}
