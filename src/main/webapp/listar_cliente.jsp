
<%@page import="model.ClienteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cliente"%>
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
            function confirmarExclusao(id,nome){
                if(confirm('ATENÇÃO SE VOCÊ DESATIVAR O CLIENTE DE : ' + nome+ ' ELE NÃO FICARAR MAS DISPONÍVEL PARA NOVAS VENDAS DESEJA REALMENTE FAZER ISSO?')){
                    location.href='gerenciar_cliente.do?acao=deletar&idCliente='+id;
                }   
        }
        
        
        
        </script>
       
        <title>Clientes</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1>Clientes  </h1>
            
            <a href="form_cliente.jsp" class="btn btn-primary" id="novo">Novo Cliente</a>
            <table class="table table-hover table-striped table-bordered display" id="listarCliente">
                <thead>
                <tr>
                     <th>ID</th>
                    <th>Nome/ Razão Social</th>
                    <th>CPF / CNPJ</th>
                    <th>RG / IE</th>
                    <th>Data Nasc / Abertura</th>
                    <th>Tipo</th>
                    <th>Status</th>
                    <th>Opções</th>
                </tr>
                </thead>
                <tfoot>
                     <tr>
                    <th>ID</th>
                    <th>Nome/ Razão Social</th>
                    <th>CPF / CNPJ</th>
                    <th>RG / IE</th>
                    <th>Data Nasc / Abertura</th>
                    <th>Tipo</th>
                    <th>Status</th>
                    <th>Opções</th>
                </tr>
                  
                </tfoot>
             
                
                <jsp:useBean class="model.ClienteDAO" id="cDAO"/> <!-- Criando um perfil com jstl-->
                <tbody>
                <c:forEach var="c" items="${cDAO.lista}">
                    <c:if test="${c.status==1}">
                <tr>
                    <td>${c.idCliente}</td> <!-- Imprimir a lista pesquisada -->
                    <td>${c.nomeRazao}</td>
                    <td>${c.cpfCnpj}</td>
                    <td>${c.rgIe}</td>
                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.dataNascAbertura}"/></td>
                    <td>
                        <c:if test="${c.tipo==1}">Física</c:if>
                        <c:if test="${c.tipo==2}">Jurídica</c:if>
                        
                    </td>
                     <td>
                        <c:if test="${c.status==1}">Disponivel</c:if>
                       
                        
                    </td>
                    
                   
                    
                    
                    <td>
                        <a class="btn btn-primary" href="gerenciar_cliente.do?acao=alterar&idCliente=${c.idCliente}">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-edit" ></i>
                        </a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${c.idCliente},'${c.nomeRazao}')">
                        <i class="glyphicon glyphicon-trash"> </i>
                        </button>
                        
                        <a href="form_venda.jsp?acao=novo&idCliente=${c.idCliente}" class="btn btn-primary" style="background-color: green;border-color: green;">
                            <i class="glyphicon glyphicon">Realizar Venda</i>
                        </a>
                        
                    </td>
                     </c:if> <!-- FIM CONDICAO PARA DISPONIVEL-->
                </tr>
                </c:forEach> <!-- FIM DO JSTL-->
                </tbody>
            </table>
            
                <script type="text/javascript" src="datatables/jquery.js"> </script> <!-- TRADUÇÃO DAS DATATABLES-->
                <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listarCliente").dataTable({
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
