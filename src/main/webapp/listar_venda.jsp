
<%@page import="model.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.VendaDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
      <link rel="stylesheet" href="estilo/EstiloPadrao.css"/>
      
       
        <script type="text/javascript"> 
            function confirmarExclusao(id,nomeRazao){
                if(confirm('Deseja realmente Deletar a venda' +nomeRazao+ '?')){
                    location.href='gerenciar_deletar.do?acao=deletar&idVenda='+id;
                }
            }
        
        
        
        </script>
       
        <title>Vendas</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1>Vendas</h1>
            
            <a href="listar_cliente.jsp" class="btn btn-primary" id="novo">Nova Venda</a> 
            <a href="listar_vendaDeletada.jsp" class="btn btn-warning" style="margin-left: 10px" id="vendasDeletadas">Vendas Deletadas</a>
            <table class="table table-hover table-striped table-bordered display" id="listarVenda">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Data </th>
                    <th>Cliente</th>
                    <th>Usuario</th>
                   
                <th>Opções</th>
                </tr>
                </thead>
                <tfoot>
                 <tr>
                    <th>ID</th>
                    <th>Data </th>
                    <th>Cliente</th>
                    <th>Usuario</th>
                   
                <th>Opções</th>
                </tr>
                </tfoot>
             
                
                <jsp:useBean class="model.VendaDAO" id="vDAO"/> <!-- Criando um perfil com jstl-->
                <tbody>
                <c:forEach var="v" items="${vDAO.lista}">
                
                <tr>
                    <c:if test="${v.exibir==0}">
                    <td>${v.idVenda}</td> <!-- Imprimir a lista pesquisada -->
                    <td><fmt:formatDate pattern="dd/MM/YYYY" value="${v.dataVenda}"/></td>
                                      
                     <td>${v.cliente.nomeRazao}</td>
                     <td>${v.vendedor.nome}</td>
                    <td>
                     
                            <button class="btn btn-danger" onclick="confirmarExclusao(${v.idVenda})">
                        <i class="glyphicon glyphicon-trash"> </i>
                        </button>
                    </td>
                </tr>
                 </c:if>
                </c:forEach> <!-- FIM DO JSTL-->
                </tbody>
            </table>
            
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
        </div>
    </body>
</html>
