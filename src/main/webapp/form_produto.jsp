
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
                        <input type="text" class="form-control" id="inNome" name="nome" style="width: 500px" maxlength="30" required="" value="${produto.nome}" />
                    </div>
                    
              
                    <div class="form-group col-sm-9">
                        <label for="marca" >Marca</label>
                        <input type="text" class="form-control" name="marca" id="labelForm" style="width: 100px" maxlength="20" required="" value="${produto.marca}" />
                    </div>
                    
                     <div class="form-group col-sm-9">
                        <label for="tamanho" >Tamanho</label>
                        <input type="text" class="form-control" name="tamanho" id="labelForm" style="width: 100px" maxlength="2" required="" value="${produto.tamanho}" />
                    </div>
                    
                    <div class="form-group col-sm-9">
                        <label for="preco" >Preco</label>
                        <input type="text" class="form-control" name="preco" id="labelForm" style="width: 100px" maxlength="6" required="" value="<fmt:formatNumber pattern="#,##0.00" value="${produto.preco}"/>" />
                    </div>
                    
                     <div class="form-group col-sm-9">
                        <label for="imagem" >Imagem</label>
                        <input type="file" class="form-control" name="imagem" id="imagem" style="width: 500px" value="${produto.imagem} "onchange="uploadFile();"/>
                       
                     </div>
                        <div class="form-group col-sm-9" id="imagemForm">
                        a
                      <!--      <img  class="img-rounded" alt="Imagem" src="" id="target"/> -->
                            
                        
                        <script>
                            function uploadFile(){
                            var target = document.querySelector("img");
                            var file = document.querySelector("input[type=file]").files[0];
                         
                            
                            var reader = new FileReader();
                            
                            reader.onloadend = function(){
                                target.src = reader.result;
                               
                               
                             };
                             
                             if(file) {
                                 reader.readAsDataURL(file);
                                 document.getElementById('imagemForm').innerHTML = file;
                                 
                                }else{
                                 target.src="";
                                  
                             }
                             
                            
                             
                            }                   
                        </script>
                        </div>
                                       
                        <div class="form-group col-sm-9">   
                        <label for="status" >Status</label>
                            <select class="form-control" name="status"  id="labelForm" style="width: 130px" maxlength="20" >
                                <option value="1"
                                <c:if test="${produto.status==1}"> selected=""</c:if>>Disponivel
                            </option>
                            
                                      
                              <option value="3"
                            <c:if test="${produto.status==3}"> selected="" </c:if>>Em falta
                            </option>
                        </select>
                         </div>
                    
                    <div class="form-group col-sm-9">
                        <label for="quantidade" >Quantidade</label>
                        <input type="text" class="form-control" name="qntd" id="labelForm" style="width: 100px" maxlength="2" required="" value="${produto.qntd}" />
                    </div>
                            
                         
                            
                    <div class="form-group col-sm-9">
                        <label for="fornecedor" >Fornecedor</label> <!-- CARREGAR OS PERFIL DIRETAMENTE PELO HTML-->
                        <select class="form-control" name="idFornecedor" id="labelFornecedor" required style="width: 210px" maxlength="20">
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
                                <button class="btn btn-success" id="form_produto_gravar">Gravar</button>
                        <a href="listar_produto.jsp" class="btn btn-warning">Voltar</a>
                            </div>
                    </div>
                    </form>
             </div>               
        </div>
                    
            
        
    
</html>
