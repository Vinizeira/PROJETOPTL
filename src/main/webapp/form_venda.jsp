
<%@page import="java.util.ArrayList"%>
<%@page import="model.VendaProduto"%>
<%@page import="model.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="model.Venda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta content="width-device-width, inicial-scale=1,  maximum-scale=1, user-scalable=no" name=viewport/>
       <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/> <!-- Carregamento de Pag mais rapido-->
        <link rel="stylesheet" href="estilo/EstiloPadrao.css"/>
       <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/> <!-- Escolha de tema no BOOTSTRA-->
       
        
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
             <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1 style=" text-shadow: 2px 2px 5px green;
     color: black;">Nova Venda</h1>
            
            <% 
                Venda v = new Venda();
                Cliente c = new Cliente();
                
                try {
                       String acao = request.getParameter("acao");
                       ClienteDAO cDAO = new ClienteDAO();
                      if (acao.equals("novo")) {
                              int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                              c = cDAO.getCarregaPorID(idCliente);
                              v.setCliente(c);
                              v.setVendedor(ulogado);
                              v.setCarrinho(new ArrayList<VendaProduto>());
                              session.setAttribute("venda", v);   
                          }else {
                            v =(Venda)session.getAttribute("venda");
                            
                      }
                       
                       
                    } catch (Exception e) {
                        out.print("erro:"+e);
                    }
            %>
             
            <br /><br />
            <h3> Vendendo Como:<b style="color: green"> <%=v.getVendedor().getNome()%> </b>  </h3>  
            <br />
            <h4>Cliente: <b style="color: green"> <%=v.getCliente().getNomeRazao()%></b> <br /> </h4>
            <h4>Catálogo: (<%=v.getCarrinho().size()%>)Itens do Carrinho </h4> 
            
            <jsp:useBean class="model.ProdutoDAO" id="produto"/>
            <c:forEach var="p" items="${produto.lista}">
                <div id="prod${p.idProduto}">
                    <form action="gerenciar_carrinho.do" method="GET">
                        <input type="hidden" name="acao" value="add">
                        <input type="hidden" name="idProduto" value="${p.idProduto}">
                        ${p.nome} <!-- pode se usar imagem-->
                        <img src="${p.imagem}" width="100px" height="100px"/>
                        <input type="number" name="qtd" value="1" style="width: 40px">
                        <button class="btn btn-default" style="background-color: green;color: white">
                            <i class="glyphicon glyphicon-shopping-cart"></i>
                        </button>  
                    </form>
                </div>
            </c:forEach>
            
             <a href="listar_cliente.jsp" class="btn btn-warning">Cancelar</a>
            <a href="form_finalizar_venda.jsp" class="btn btn-success">Finalizar Venda</a>
                </div>
    </body>
</html>
