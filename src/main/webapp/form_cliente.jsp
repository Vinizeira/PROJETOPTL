
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/>
        <link rel="stylesheet" href="estilo/EstiloPadrao.css"/>
        <link rel="stylesheet" href="estilo/EstiloForm.css"/>
        
        <title>Cliente</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@include     file="fundoCima.jsp"  %>
            
            <%@include     file="menu.jsp"  %>
        
          <div class="formulario">
                <h1 id="form_titulo_Cliente">Cadastrar Cliente</h1>
            <form action="gerenciar_cliente.do" method="POST">
                <input type="hidden" name="idCliente" value="${cliente.idCliente}"/>
                <div class="row">
                    <div class="form-group col-sm-9">
                        <label for="nomeRazao" class="control-label">Nome /Razão Social</label>
                        <input type="text" class="form-control" id="nomeRazao" name="nomeRazao" required="" value="${cliente.nomeRazao}" maxlength="45"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="cpfCnpj" class="control-label">CPF / CNPJ</label>
                        <input type="text" class="form-control" id="cpfCnpj" name="cpfCnpj" required="" value="${cliente.cpfCnpj}" maxlength="45"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="rgIe" class="control-label">RG / IE</label>
                        <input type="text" class="form-control" id="rgIe" name="rgIe" value="${cliente.rgIe}" maxlength="45"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="dataNascAbertura" class="control-label">data de Nascimento/ Abertura</label>
                        <input type="date" class="form-control" id="dataNascAbertura" name="dataNascAbertura" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.dataNascAbertura}"/>" maxlength="45"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="tipo" class="control-label">Tipo</label>
                        <select class="form-control" name="tipo">
                            <option value="1" 
                                    <c:if test="${cliente.tipo==1}"> 
                                        selected=""
                                    </c:if>
                            >Física</option>
                            <option value="2" 
                                    <c:if test="${cliente.tipo==2}"> 
                                        selected=""
                                    </c:if>
                            >Jurídica</option>
                        </select>
                    </div>
                    
                    <div class="form-group col-sm-9">
                        <label for="status" class="control-label">Status</label>
                        <select class="form-control" name="status">
                            <option value="1" 
                                    <c:if test="${cliente.status==1}"> 
                                        selected=""
                                    </c:if>
                            >Dispónivel</option>
                            <option value="2" 
                                    <c:if test="${cliente.status==2}"> 
                                        selected=""
                                    </c:if>
                            >Indisponivel</option>
                        </select>
                    </div>
                    
                    
                    
                </div>
                <div class="row">
                    <button class="btn btn-success" style="margin-left: -160px;">Gravar</button>
                    <a href="listar_cliente.jsp" class="btn btn-warning">Voltar</a>
                </div>
            </form>
            
        </div>
                    <br>
           
        </div>
    </body>
</html>

