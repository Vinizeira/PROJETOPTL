

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta content="width-device-width, inicial-scale=1,  maximum-scale=1, user-scalable=no" name=viewport/>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
      <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
      <link rel="stylesheet" href="estilo/EstiloPadrao.css"/>
        <link rel="stylesheet" href="estilo/EstiloForm.css"/>
       
         <script type="text/javascript"> 
            function confirmarExclusao(idMenu,nome,idPerfil){
                if(confirm('Deseja realmente desvincular o Menu' + nome+ '?')){
                    location.href='gerenciar_menu_perfil.do?acao=desvincular&idMenu='+idMenu+'&idPerfil='+idPerfil;
                }
            }
        
        
        
        </script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
           
            
            <h1>Gerenciar Perfil</h1>
            <form action="gerenciar_menu_perfil.do" method="POST">
                <input type="hidden" name="idPerfil" value="${perfilv.idPerfil}"/>  
               <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="perfil" class="control-label"> ${perfilv.nome}</label>
                       
                    </div>
                </div>
        <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="menu" class="control-label">Menus</label>
                        <select name="idMenu" required="" id="idMenu" class="form-control">
                            <option value="">Selecione o Menu</option>
                            <c:forEach var="m" items="${perfilv.naoMenus}"> 
                                <option value="${m.idMenu}">${m.nome}</option>
                            
                            </c:forEach>
                        </select>
                    </div>
                </div>
                
                    
                   <div class="row" "> 
                       <button class="btn btn-success" id="btnsForm_menu_perfil">Vincular</button>
                        <a href="listar_perfil.jsp" class="btn btn-warning">Voltar</a>
                </div>
                    
            </form>
                        <br>
                     
       <table class="table table-hover table-striped table-bordered display" id="listarMenu">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Icone</th>
                    <th>Link</th>
                    <th>Exibir</th>
                    <th>Desvincular</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Icone</th>
                    <th>Link</th>
                    <th>Exibir</th>
                </tr>
                </tfoot>
             
                
                 <!-- Criando um perfil com jstl-->
                 <jsp:useBean class="model.MenuDAO" id="mDAO"/>
                 <tbody>
                <c:forEach var="m" items="${perfilv.menus}">
                
                <tr>
                    <td>${m.idMenu}</td> <!-- Imprimir a lista pesquisada -->
                    <td>${m.nome}</td>
                    <td>${m.icone}</td>
                    <td>${m.link}</td>
                        <td>
                        <c:if test="${m.exibir==1}">SIM</c:if>
                        <c:if test="${m.exibir==2}">NÃO</c:if>
               
                    </td>
                    
                       <td>
                 
                            <button class="btn btn-danger" onclick="confirmarExclusao(${m.idMenu},'${m.nome}',${perfilv.idPerfil})">
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
                        $("#listarMenu").dataTable({
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
