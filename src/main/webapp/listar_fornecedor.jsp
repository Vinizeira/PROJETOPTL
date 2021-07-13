<%@page import="model.Fornecedor"%>
<%@page import="model.FornecedorDAO"%>
<%@page import="java.util.ArrayList"%>
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
                if(confirm('Deseja realmente excluir o Fornecedor' + nome+ '?')){
                    location.href='gerenciar_fornecedor.do?acao=deletar&idFornecedor='+id;
                }
            }
        
        
        
        </script>
       
        <title>Lista de Fornecedores</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1>Lista de Fornecedor  </h1>
            
            <a href="form_fornecedor.jsp" class="btn btn-primary" id="novo">Novo Fornecedor</a>
            <table class="table table-hover table-striped table-bordered display" id="listarFornecedor">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                   
                <th>Opções</th>
                </tr>
                </thead>
                <tfoot>
                 <tr>
                    <th>ID</th>
                    <th>Nome</th>
                  
                <th>Opções</th>
                </tr>
                </tfoot>
             
                
                <jsp:useBean class="model.FornecedorDAO" id="fDAO"/> <!-- Criando um perfil com jstl-->
                <tbody>
                <c:forEach var="f" items="${fDAO.lista}">
                
                <tr>
                    <td>${f.idFornecedor}</td> <!-- Imprimir a lista pesquisada -->
                    <td>${f.nome}</td>
                    
                    
                    <td>
                        <a class="btn btn-primary" href="gerenciar_fornecedor.do?acao=alterar&idFornecedor=${f.idFornecedor}">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-pencil" ></i>
                        </a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${f.idFornecedor},'${f.nome}')">
                        <i class="glyphicon glyphicon-trash"> </i>
                        </button>
                    </td>
                </tr>
                </c:forEach> <!-- FIM DO JSTL-->
                </tbody>
            </table>
            
                <script type="text/javascript" src="datatables/jquery.js"> </script> <!-- TRADUÇÃO DAS DATATABLES-->
                <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listarFornecedor").dataTable({
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
