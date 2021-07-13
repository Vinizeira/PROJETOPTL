
<%@page import="model.PerfilDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Perfil"%>
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
       <link rel="stylesheet" href="estilo/EstiloPadrao.css"/><!-- Carregamento de Pag mais rapido-->
       
     
       
        <script type="text/javascript"> 
            function confirmarExclusao(id,nome){
                if(confirm('Deseja realmente excluir o Perfil' + nome+ '?')){
                    location.href='gerenciar_perfil.do?acao=deletar&idPerfil='+id;
                }
            }
        
        
        
        </script>
       
        <title>Listar Perfil</title>
    </head>
    <body>
        <div class="container-fluid">
             <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            
            <h1>Lista de Perfis  </h1>
            
            <a href="form_perfil.jsp" class="btn btn-primary" id="novo">Novo Cadastro</a>
            
            <table class="table table-hover table-striped table-bordered display" id="listarPerfil">
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
             
                
                <jsp:useBean class="model.PerfilDAO" id="pDAO"/> <!-- Criando um perfil com jstl-->
                <tbody>
                <c:forEach var="p" items="${pDAO.lista}">
                
                <tr>
                    <td>${p.idPerfil}</td> <!-- Imprimir a lista pesquisada -->
                    <td>${p.nome}</td>
                    <td>
                        <a class="btn btn-primary" href="gerenciar_perfil.do?acao=alterar&idPerfil=${p.idPerfil}">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-edit" ></i>
                        </a>
                            <button class="btn btn-danger" onclick="confirmarExclusao(${p.idPerfil},'${p.nome}')">
                        <i class="glyphicon glyphicon-trash"> </i>
                        </button>
                        
                            <a class="btn btn-default" href="gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=${p.idPerfil}">
                                <i class="glyphicon">Acessos</i>
                            </a>
                        
                    </td>
                </tr>
                </c:forEach> <!-- FIM DO JSTL-->
                </tbody>
            </table>
            
                <script type="text/javascript" src="datatables/jquery.js"></script>
          <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
                 <script type="text/javascript">
              $(document).ready(function(){
                  $("#listarPerfil").dataTable({
                      "bJQueryUI": true,
                      "oLanguage":{
                          "sProcessing":"Processando...",
                          "sLengthMenu": "Mostrar _MENU_ registros",
                          "sZeroRecords": "Não foram encontrados resultados",
                          "sInfo": "Mostrar de _START_ até _END_ de _TOTAL_ registros",
                          "sInfoEmpty":"Mostrando de 0 até 0 de 0 registros",
                          "sInfoFiltered": "",
                          "sInfoPostFix":"",
                          "sSearch": "Pesquisar",
                          "sUrl":"",
                          "oPaginate":{
                              "sFirst":"Primeiro",
                              "sPrevious":"Anterior",
                              "sNext":"Próximo",
                              "sLast":"Último"
                          }
                      }
                  })
              })
          </script>
        </div>
    </body>
</html>
