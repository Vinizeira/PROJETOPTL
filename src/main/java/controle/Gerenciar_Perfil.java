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
import model.Perfil;
import model.PerfilDAO;

/**
 *
 * @author viniz
 */
public class Gerenciar_Perfil extends HttpServlet {

   

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
            
        String acao = request.getParameter("acao");
        String idPerfil = request.getParameter("idPerfil");
        String mensagem ="";
        
        Perfil p = new Perfil();
        
        try {
            PerfilDAO pDAO = new PerfilDAO();
            if(acao.equals("alterar")){
                  if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                p = pDAO.getCarregaPorID(Integer.parseInt(idPerfil));
                if (p.getIdPerfil()>0) {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_perfil.jsp");
                    request.setAttribute("perfil", p);
                    disp.forward(request, response);
                     } else {
                     mensagem="perfil nao encontrado";
                }
               }else{
                      mensagem="Acesso não permito!";
             }
          }
            
            if (acao.equals("deletar")) {
                  if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
            p.setIdPerfil(Integer.parseInt(idPerfil));
                if(pDAO.deletar(p)){
                    mensagem="Perfil Deletado";
                } else {
                    mensagem="erro ao deletar Perfil";
                }
              } else {
                    mensagem="Acesso não permitido";
                  }
        }
            
        } catch (Exception e) {
            out.print(e);
            mensagem="Erro ao executar o DO GET";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_perfil.jsp';");
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
        String idPerfil = request.getParameter("idPerfil");//PARAMETRO IDENTICO AO NAME DO IMPUT
        String nome = request.getParameter("nome");
        
        String mensagem="";
        
        Perfil p = new Perfil();
       
            if(!idPerfil.isEmpty()) //Possivel erro 1
                p.setIdPerfil(Integer.parseInt(idPerfil));
        
        try {
           PerfilDAO pDAO = new PerfilDAO();                
            if(nome.equals("")||nome.isEmpty()){ //Possivel erro 2
                mensagem="Campos Obrigátorios Deverão ser preenchidos";
            } else {
                p.setNome(nome);
                if(pDAO.gravar(p)){
                    mensagem="Gravado com sucesso";
                }else{
                    mensagem="erro ao gravar no banco!";
                }
            }
            
        } catch (Exception e) {
            out.print(e);
            mensagem="Erro ao executar o do POST";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_perfil.jsp';");
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
