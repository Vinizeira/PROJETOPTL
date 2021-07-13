
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
           
            
            <h1>Cadastrar Fornecedor</h1>
            <form action="gerenciar_fornecedor.do" method="POST">
                <input type="hidden" name="idFornecedor" value="${fornecedor.idFornecedor}"/>
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="menu" class="control-label"> Nome</label>
                        <input type="text" class="form-control" id="nome" required="" name="nome" value="${fornecedor.nome}" />
                    </div>
                    
              
                   <div class="form-group col-sm-9">
                    <div class="row" id="gravarPerfil"> 
                        <button class="btn btn-success">Gravar</button>
                        <a href="listar_fornecedor.jsp" class="btn btn-warning">Voltar</a>
                </div>
                    </div>
                    
                      
                </div>
                    
            </form>
            
        </div>
    </body>
</html>

