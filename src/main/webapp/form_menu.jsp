
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
           
            
            <h1>Cadastrar Menu</h1>
            <form action="gerenciar_menu.do" method="POST">
                <input type="hidden" name="idMenu" value=""/>
                <div class="row">
                    <div class="form-group col-sm-9">
                        <label for="menu" class="control-label"> Nome Menu</label>
                        <input type="text" class="form-control"  name="nome" id="nome" style="width: 200px" required="" value="${menu.nome}" />
                    </div>
                    
              
                    <div class="form-group col-sm-9">
                        <label for="link" class="control-label">Link</label>
                        <input type="text" class="form-control" name="link" style="width: 200px" required="" value="${menu.link}" />
                    </div>
                    
               
                    <div class="form-group col-sm-9">
                        <label for="icone" class="control-label">Icone</label>
                        <input type="file" class="form-control"  accept="image/png, image/jpeg" style="width: 300px" name="icone" value="${menu.icone}" />
                    </div>
                   
   

                   
                        <div class="form-group col-sm-9">   
                        <label for="exibir" class="control-label"> Exibir</label>
                            <select class="form-control" name="exibir" style="width: 100px">
                            <option value="1">SIM</option>
                            <option value="2">NÃO</option>
                            </select>
                         </div>
                   
               <div class="form-group col-sm-9">
                    <div class="row" id="gravarPerfil"> 
                        <button class="btn btn-success">Gravar</button>
                        <a href="listar_menu.jsp" class="btn btn-warning">Voltar</a>
                    </div>
               </div>
                </div>
                </div>
                    
            </form>
            
        </div>
    </body>
</html>
