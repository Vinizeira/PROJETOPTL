
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
       <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        
       
        
      
          <script language="javascript" type="text/javascript">function vai(){  
          var confirma = window.confirm("Confirma a opção?");  if(confirma)  {	
              alert("confirmado");
          }  }  else  {	alert("cancelado");  }}
          
        </script>

        
        <
       
       
        <title>Produtos PTL</title>
    </head>
    
    <div class="container-fluid">
             <%@include     file="fundoCima.jsp"  %>    
            <%@include     file="menu.jsp"  %>
           
            
            <div class="formulario">
                <h1 id="tituloFormProduto">Produtos</h1>
            <form action="gerenciar_produto.do" method="POST">
                <input type="hidden" name="idProduto" value="${produto.idProduto}"/>
                <div class="row">
                    <div class="form-group col-sm-9">
                        <label for="Produto" > Nome camisa </label>
                        <input type="text" class="form-control" id="inNome" name="nome" disabled style="width: 500px" maxlength="20" required="" value="${produto.nome}" />
                    </div>
          
                    
                     <div class="form-group col-sm-9">
                         <label for="imagem" >Imagem</label> 
                         <br>
                          <jsp:useBean class="model.ProdutoDAO" id="pDAO"/>
                          
                         
                          
                         <img src="${produto.imagem}" width="200px" height="200px"/>
                         
                           
                      
                     </div>
                     
                            
                            
                    <div class="form-group col-sm-9">
                        <label for="fornecedor" >Fornecedor</label> <!-- CARREGAR OS PERFIL DIRETAMENTE PELO HTML-->
                        <select class="form-control" name="idFornecedor" disabled id="labelFornecedor" required style="width: 210px" maxlength="20">
                            <option value="">Selecione o Fornecedor </option>
                        <jsp:useBean class="model.FornecedorDAO" id="fornecedor">
                            <c:forEach var="f" items="${fornecedor.lista}">
                                <option value="${f.idFornecedor}"
                                        <c:if test="${f.idFornecedor==produto.fornecedor.idFornecedor}" > selected=""</c:if>
                                    >${f.nome}</option>
                                
                            </c:forEach>
                            
                        </jsp:useBean>
                        </select>
                        
                    </div>
                   
                            <div class="form-group col-sm-9">
                                
                                <a href="index.jsp" class="btn btn-warning">Voltar</a>
                            </div>
                    </div>
                    </form>
             </div>               
        </div>
                    
            
        
    
</html>
