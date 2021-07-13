/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.ClienteDAO;

/**
 *
 * @author viniz
 */
public class Gerenciar_Cliente extends HttpServlet {

   

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
        String mensagem = "";
        String idCliente= request.getParameter("idCliente");
        String acao = request.getParameter("acao");
        
        try{
            Cliente c= new Cliente();
            ClienteDAO cDAO = new ClienteDAO();
            if(acao.equals("alterar")){
                if(Gerenciar_Login.verificarPermisao(request, response)){
                    c = cDAO.getCarregaPorID(Integer.parseInt(idCliente));
                    if(c.getIdCliente()>0){
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_cliente.jsp");
                        request.setAttribute("cliente", c);
                        disp.forward(request, response);
                    }else{
                        mensagem = "Cliente não encontrado";
                    }
                
                }else{
                    mensagem = "Acesso Negado";
                }
            
            }
            if(acao.equals("deletar")){
                if(Gerenciar_Login.verificarPermisao(request, response)){
                c.setIdCliente(Integer.parseInt(idCliente));
                if(cDAO.deletar(c)){
                    mensagem = "Cliente deletado com sucesso";
                }else{
                    mensagem = "Erro ao deletar o cliente do banco de dados";
                }
                
                }else{
                    mensagem = "Acesso Negado";
                }
            }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_cliente.jsp';");
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
        String mensagem = "";
        String idCliente = request.getParameter("idCliente");
        String nomeRazao = request.getParameter("nomeRazao");
        String cpfCnpj = request.getParameter("cpfCnpj");
        String rgIe = request.getParameter("rgIe");
        String dataNascAbertura = request.getParameter("dataNascAbertura");
        String tipo = request.getParameter("tipo");
         String status = request.getParameter("status");
        
        try{
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Cliente c = new Cliente();
            ClienteDAO cDAO = new ClienteDAO();
            if(!idCliente.isEmpty()){
                c.setIdCliente(Integer.parseInt(idCliente));
            }
            if(nomeRazao.equals("")||cpfCnpj.equals("")||rgIe.equals("")||dataNascAbertura.equals("")||tipo.equals("") || status.equals("")){
                mensagem = "Campos obrigatórios deverão ser preenchidos!";
            }else{
                c.setNomeRazao(nomeRazao);
                c.setCpfCnpj(cpfCnpj);
                c.setRgIe(rgIe);
                if(!dataNascAbertura.isEmpty()){
                    c.setDataNascAbertura(df.parse(dataNascAbertura));
                }
                c.setTipo(Integer.parseInt(tipo));
                c.setStatus(Integer.parseInt(status));
                if(cDAO.gravar(c)){
                    mensagem = "Gravado com sucesso!";
                }else{
                    mensagem = "Erro ao gravar o cliente no banco de dados";
                }
                    
            
            }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_cliente.jsp';");
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
