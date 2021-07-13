
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Menu;
import model.MenuDAO;

/**
 *
 * @author viniz
 */
public class Gerenciar_Menu extends HttpServlet {

  

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
      String idMenu = request.getParameter("idMenu");
      
      Menu m = new Menu();
      
        try {
             MenuDAO mDAO = new MenuDAO();
             if(acao.equals("alterar")){
                 if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                 m = mDAO.getCarregaPorID(Integer.parseInt(idMenu));
                 if(m.getIdMenu()>0){
                     RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu.jsp");
                     request.setAttribute("menu", m);
                     disp.forward(request, response);
                 }else{
                     mensagem="Menu não encontrado no banco";
                 }
                 }  else {
                        mensagem="Acesso não permitido";
                 } // FIM DA VERIFICAÇÃO DE PERMISSÃO
             }
             
              if (acao.equals("deletar")) {
               if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                  m.setIdMenu(Integer.parseInt(idMenu));
                 if(mDAO.deletar(m)){
                     mensagem="Menu Deletado";
                 } else {
                     mensagem="erro ao deletar menu";
                 }
                   } else {
                      mensagem="Acesso não permitido!";
                  }
        }
            
        } catch (Exception e) {
              out.print(e);
               mensagem="Erro ao executar o doGET";   
        }
        
         out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_menu.jsp';");
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
            String idMenu = request.getParameter("idMenu");
            
            String nome = request.getParameter("nome");
            String icone  = request.getParameter("icone");
            String link = request.getParameter("link");
            String exibir = request.getParameter("exibir");
                        
            String mensagem= "";
            
            Menu m = new Menu();
            
            try{
                MenuDAO mDAO = new MenuDAO();
                if (!idMenu.isEmpty()) {
                    m.setIdMenu(Integer.parseInt(idMenu));
                    }
                if (nome.equals("") ||link.equals("")||exibir.equals("")) {
                    mensagem="Campos Obrigatórios deveram ser preeenchido";
                    } else {
                        m.setNome(nome);
                        m.setLink(link);
                        m.setIcone(icone);
                        m.setExibir(Integer.parseInt(exibir));
                        if(mDAO.gravar(m)){
                            mensagem="Gravado Com Sucesso";
                        }else{
                            mensagem="erro ao gravar Cliente";
                        }
                }
                                            
            } catch(Exception e) {
               out.print(e);
               mensagem="Erro ao executar no doPOST";   
            }
            
         out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_menu.jsp';");
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
