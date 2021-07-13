

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta content="width-device-width, inicial-scale=1,  maximum-scale=1, user-scalable=no" name=viewport/>
       <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/> <!-- Carregamento de Pag mais rapido-->
       <link rel="stylesheet" href="estilo/EstiloPadrao.css"/>
        <link rel="stylesheet" href="estilo/EstiloForm.css"/>
       <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/> <!-- Escolha de tema no BOOTSTRA-->
       
        
        <title>Usuarios</title>
    </head>
    
        <div class="container-fluid">
           <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
            <div class="formulario">
                <h1 id="form_tituloUsuario">Cadastrar Usuario</h1>
            <form action="gerenciar_usuarios.do" method="POST">
                <input type="hidden" name="idUsuario" value="${usuario.idUsuario}"/>
                <div class="row">
                    <div class="form-group col-sm-9">
                        <label for="usuario" class="control-label"> Nome Usuario</label>
                        <input type="text" class="form-control" id="nome" name="nome" required="" value="${usuario.nome}" />
                    </div>
                    
              
                    <div class="form-group col-sm-9">
                        <label for="login" class="control-label">Login</label>
                        <input type="text" class="form-control" name="login" id="login" required="" value="${usuario.login}" />
                    </div>
                    
                     <div class="form-group col-sm-9">
                        <label for="senha" class="control-label">Senha</label>
                        <input type="password" class="form-control" name="senha" id="senha" required="" value="${usuario.senha}" />
                    </div>
                                       
                        <div class="form-group col-sm-9">   
                        <label for="status" class="control-label">Status</label>
                            <select class="form-control" name="status">
                                <option value="1"
                                <c:if test="${usuario.status==1}"> selected=""</c:if>>Ativo
                            </option>
                            <option value="2"
                            <c:if test="${usuario.status==2}"> selected="" </c:if>>Inativo
                            </option>
                            </select>
                         </div>
                            
                            
                    <div class="form-group col-sm-9">
                        <label for="perfil" class="control-label">Perfil</label> <!-- CARREGAR OS PERFIL DIRETAMENTE PELO HTML-->
                        <select class="form-control" name="idPerfil" required>
                            <option value="">Selecione o Perifl </option>
                        <jsp:useBean class="model.PerfilDAO" id="perfil"/>
                            <c:forEach var="p" items="${perfil.lista}">
                                <option value="${p.idPerfil}"
                                        <c:if test="${p.idPerfil==usuario.perfil.idPerfil}">selected=""</c:if>
                                    > ${p.nome}</option>
                                
                            </c:forEach>
                            
                      
                        </select>
                        
                    </div>
                   
                         <div class="form-group col-sm-9">
                            <div class="row">
                        <button class="btn btn-success">Gravar</button>
                        <a href="listar_usuario.jsp" class="btn btn-warning">Voltar</a>
                            </div>
                    </div>
                </div>
                    
            </form>
            
        </div>
  </div>
    
</html>
