/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Fornecedor;
import model.FornecedorDAO;

/**
 *
 * @author viniz
 */
public class Gerenciar_Fornecedor extends HttpServlet {

   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
         String mensagem= "";
         
         String acao = request.getParameter("acao");
      String idFornecedor = request.getParameter("idFornecedor");
        
      Fornecedor f = new Fornecedor();
        
        try {
            FornecedorDAO fDAO = new FornecedorDAO();
             if(acao.equals("alterar")){
                 if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                   f = fDAO.getCarregaPorID(Integer.parseInt(idFornecedor));
                   if (f.getIdFornecedor()>0) {
                       RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_fornecedor.jsp");
                    request.setAttribute("fornecedor", f);
                    disp.forward(request, response);
                    } else {
                       mensagem="Fornecedor nao encontrado";
                   }
                 } else {
                        mensagem="Acesso não permitido";
                 }
                   
             }
         
            if (acao.equals("deletar")) {
                if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                    f.setIdFornecedor(Integer.parseInt(idFornecedor));
                    if(fDAO.deletar(f)){
                        mensagem="Fornecedor Deletado";
                } else {
                         mensagem="erro ao deletar";
                    }
                } else {
                        mensagem="Acesso não permitido";
                }
              }
            
        } catch (Exception e) {
            out.print(e);
            mensagem="Erro linha 49";
        }
        
         out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_fornecedor.jsp';");
        out.println("</script>");
      
     
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      PrintWriter out = response.getWriter();
      String idFornecedor = request.getParameter("idFornecedor");
      String nome = request.getParameter("nome");
  
      
       String mensagem ="";
       
       Fornecedor f = new Fornecedor();
       if(!idFornecedor.isEmpty())
            f.setIdFornecedor(Integer.parseInt(idFornecedor));
            
        try {
            FornecedorDAO fDAO = new FornecedorDAO();
            if(nome.equals("")){
            mensagem="Campos devem ser preenchidos";
              }else{
                f.setNome(nome);
             
               if(fDAO.gravar(f)){
                   mensagem="GRAVADO com sucesso";
               } else {
                   mensagem="ERRO LINHA 72";
               }
                
            }
            
            
        } catch (Exception e) {
            out.print(e);
            mensagem="ERRO LINHA 65";
        }
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_fornecedor.jsp';");
        out.println("</script>");
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
