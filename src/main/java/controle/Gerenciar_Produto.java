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
import model.Produto;
import model.ProdutoDAO;

/**
 *
 * @author viniz
 */
public class Gerenciar_Produto extends HttpServlet {

   

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
         String acao=request.getParameter("acao");
         String idProduto = request.getParameter("idProduto");
       
         String mensagem="";
            Produto p = new Produto();
         
         try {
             ProdutoDAO pDAO = new ProdutoDAO();
             if(acao.equals("alterar")){
                if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
                p = pDAO.getCarregaPorID(Integer.parseInt(idProduto));
                if (p.getIdProduto()>0) {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_produto.jsp");
                    request.setAttribute("produto", p);
                    disp.forward(request, response);
                     } else {
                     mensagem="Produto nao encontrado";
                }
               } else {
                       mensagem="Acesso Não permiido";
            }
        }
          //Vender
          
          if(acao.equals("vender")){
                if(Gerenciar_Login.verificarPermisao(request, response)){ 
              p.setIdProduto(Integer.parseInt(idProduto));
              if(pDAO.vender(p)){
                  mensagem="Produto Alterado: Status VENDIDO";
              }else{
                  mensagem="Erro";
              }
                } else {
                    mensagem="Acesso Negado";
                }
          } 
          
          //Visualizar
          
          if(acao.equals("visualizar")){
              p = pDAO.getVisualizar(Integer.parseInt(idProduto));
                 if (p.getIdProduto()>0) {
                    RequestDispatcher disp = getServletContext().getRequestDispatcher("/visualizar_Imagem.jsp");
                    request.setAttribute("produto", p);
                    disp.forward(request, response);
                     } else {
                        mensagem="Produto Não encontrado";
                 }
          }
          
          
             
        //DELETAR  
          if (acao.equals("deletar")) {
               if(Gerenciar_Login.verificarPermisao(request, response)){ //INICIO DA VERIFICAÇÃO DE PERMISSÃO
            p.setIdProduto(Integer.parseInt(idProduto));
                if(pDAO.deletar(p)){
                    mensagem="Produto Deletado";
                } else {
                    mensagem="erro ao deletar";
                }
               } else {
                   mensagem="Acesso não permitido";
               }
          }
          
          
       
         } catch (Exception e) {
            out.print(e);
            mensagem="Erro try catch doGET";
        }
      
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_produto.jsp';");
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
         String idProduto = request.getParameter("idProduto");
         String nome = request.getParameter("nome");
         String marca= request.getParameter("marca");
         String tamanho= request.getParameter("tamanho");
         String preco= request.getParameter("preco");
         String imagem= request.getParameter("imagem");
         String status= request.getParameter("status");
         String qntd = request.getParameter("qntd");
         String idFornecedor = request.getParameter("idFornecedor");
         
         String mensagem="";
         
         Produto p = new Produto();
          if(!idProduto.isEmpty()){
            p.setIdProduto(Integer.parseInt(idProduto));
                 } 
          if(nome.equals("") || marca.equals("") || tamanho.equals("") || preco.equals("") || imagem.equals("") || status.equals("") || qntd.equals("") || idFornecedor.equals("")){
              mensagem="Preencha os campos";
          }else {
              p.setNome(nome);
              p.setMarca(marca);
              p.setTamanho(tamanho);
              double novopreco=0;
              if (!preco.isEmpty()) {
                  novopreco = Double.parseDouble(preco.replace(".","").replace(",", "."));
              }
              p.setPreco(novopreco);
              p.setImagem(imagem);
              p.setStatus(Integer.parseInt(status));
              p.setQntd(Integer.parseInt(qntd));
              Fornecedor f = new Fornecedor();
              f.setIdFornecedor(Integer.parseInt(idFornecedor));
              p.setFornecedor(f);
              try {
                  ProdutoDAO pDAO = new ProdutoDAO();
                  if(pDAO.gravar(p)){
                      mensagem="Gravado com sucesso! =)";
                  }else {
                      mensagem="Erro ao gravar linha 85";
                  }
                  
              } catch (Exception e) {
                  out.print(e);
                  mensagem="Erro linha 90";
              }
          }
         
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"');");
        out.println("location.href='listar_produto.jsp';");
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
