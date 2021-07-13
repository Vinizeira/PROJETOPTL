
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta content="width-device-width, inicial-scale=1,  maximum-scale=1, user-scalable=no" name=viewport/>
       <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/> <!-- Carregamento de Pag mais rapido-->
        <link rel="stylesheet" href="estilo/EstiloPadrao.css"/><!-- Carregamento de Pag mais rapido-->
         <link rel="stylesheet" href="estilo/EstiloForm.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/> <!-- Escolha de tema no BOOTSTRA-->
       
        
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid" id="backPerfil">
            <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            <div class="formularioPerfil">
                <h1 id="tituloFormPerfil">Perfil</h1>
            <form action="gerenciar_perfil.do" method="POST">
                <input type="hidden" name="idPerfil" value="${perfil.idPerfil}"/>
                <div class="row">
                    <div class="form-group col-sm-9">
                        <label for="perfil" class="control-label"> Nome Perfil</label>
                        <input type="text" class="form-control"  id="labelFormPerfil" placeholder="Ex: Gerente" name="nome" style="width: 200px"  value="${perfil.nome}" />
                    </div>
                    </div>
                    <div class="form-group col-sm-9">
                    <div class="row" id="gravarPerfil"> 
                        <button class="btn btn-success">Gravar</button>
                        <a href="listar_perfil.jsp" class="btn btn-warning">Voltar</a>
                </div>
                    </div>
            </form>
            
        </div>
                    </div>
    </body>
</html>
