/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Venda;
import model.VendaDAO;

/**
 *
 * @author yasmin
 */
public class NewServlet extends HttpServlet {

    

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
        String mensagem ="";
        String idVenda = request.getParameter("idVenda");
        String acao = request.getParameter("acao");
        
        try{
            VendaDAO vDAO = new VendaDAO();
            Venda v = new Venda();
            if (acao.equals("deletar")) {
                if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                    v.setIdVenda(Integer.parseInt(idVenda));
                    
                    if(vDAO.deletar(Integer.parseInt(idVenda))){
                        mensagem="Venda Deletado";
                } else {
                         mensagem="erro ao deletar";
                    }
                } else {
                        mensagem="Acesso não permitido";
                }
              }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_venda.jsp';");
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
