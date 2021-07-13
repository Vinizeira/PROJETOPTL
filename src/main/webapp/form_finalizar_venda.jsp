
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
        <script type="text/javascript">
            function excluir(index, item){
                
                if(confirm("Tem certeza que deseja excluir o item"+item+"?")){
                    
                    window.open("gerenciar_carrinho.do?acao=del&index="+index,"_self");
                    
                }
                
            }
        </script>
       
        
        <title>Finalizar Venda</title>
    </head>
    <body>
        <div class="container-fluid">
             <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1 style=" text-shadow: 2px 2px 5px green;
     color: black;">Finalizar Venda</h1>
            
            <% 
                Venda v = new Venda();
                Cliente c = new Cliente();
                
                try {
                      
                   v =(Venda)session.getAttribute("venda");
                            
                     
                       
                       
                    } catch (Exception e) {
                        out.print("erro:"+e);
                    }
            %>
             
            <br /><br />
            Vendedor:  <b style="color: green"><%=v.getVendedor().getNome()%></b>
            
            <br />
            Cliente: <b style="color: green"> <%=v.getCliente().getNomeRazao()%></b>  <br /> 
            
            <br>
                <table class="table table-striped table-bordered table-hover display" id="listarVenda">
                
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Produto</th>
                        <th>QTD</th>
                        <th>Valor</th>
                        <th>Total</th>
                        <th>Remover</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%
                        double total = 0;
                        int cont = 0;
                        for(VendaProduto vp:v.getCarrinho()){
                    
                    %>
                    <tr>
                        <td align="center"><%=cont+1%></td>
                        <td><%=vp.getProduto().getNome()%></td>
                        <td><%=vp.getQtd()%></td>
                        <td>R$ <%=vp.getValorVendido()%></td>
                        <td>R$ <%=vp.getQtd()*vp.getValorVendido()%></td>
                        <td align="center">
                            <a href="#" onclick="excluir(<%=cont%>,<%=cont+1%>)" class="btn btn-danger">
                                <i class="glyphicon glyphicon-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        total = total + (vp.getQtd()*vp.getValorVendido());
                        
                        cont++;
                    }
                    
                    %>
                </tbody>
                
                
            </table>
            
           
             <a href="listar_cliente.jsp" class="btn btn-warning">Cancelar</a>
            <a href="form_venda.jsp?acao=c" class="btn btn-info">Continuar Vendendo</a>
             <a href="gerenciar_venda.do" class="btn btn-success">Confirmar Venda</a>
                </div>
        <script type="text/javascript" src="datatables/jquery.js"> </script> <!-- TRADUÇÃO DAS DATATABLES-->
                <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listarVenda").dataTable({
                            "bJQueryUI":true,
                            "oLanguage":{
                                "sProcessing":"Processando...",
                                "sLengthMenu":"Mostrar _MENU_ registros",
                                "sZeroRecords":"Não foram encontrados resultados",
                                "sInfo":"Mostrar de _START_ até _END_ de _TOTAL_ registros",
                                "sInfoEmpty":"Mostrando de 0 até 0 de 0 registros",
                                "sInfoFiltered":"",
                                "sInfoPostFix":"",
                                "sSearch":"Pesquisar",
                                "sUrl":"",
                                "oPaginate":{
                                    "sFirst":"Primeiro",
                                    "sPrevious":"Anterior ",
                                    "sNext":" Próximo",
                                    "sLast":"Último"
                                }
                            }
                        
                        }
                      )
                    }
                    )
                   </script>
    </body>
</html>
