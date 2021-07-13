<%@page import="model.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <meta content="width-device-width, inicial-scale=1,  maximum-scale=1, user-scalable=no" name="viewport"/>
       <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="estilo/EstiloPadrao.css"/><!-- Carregamento de Pag mais rapido-->
       <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css"/> <!-- Escolha de tema no BOOTSTRA-->
       <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="http://areaaperta.com/nicescroll/js/jquery.nicescroll.min.js"></script>
        <link rel="stylesheet" href="datatables/jquery.dataTables.mim.css"/>
         <link rel="stylesheet" href="estilo/IndexEstilo.css"/>
         <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
        
        <script>
            
            $(document).ready(function () {
    $("html").niceScroll();
});
        </script>
        
        <script type="text/javascript"> 
            function irParaCarrinho(){
                if(confirm('Para adicionar o item ao carrinho é necessário realizar uma venda para um cliente!')){
                    location.href='listar_cliente.jsp';
                }   
        }
        
        
        
        </script>
        
        <style>
    .mySlides {display:none;}
       </style>
        
        <title>PTL-CREW</title>
    </head>
    <body>
        
        <div class="container-fluid">
          
            <%@include     file="fundoCima.jsp"  %>
            <%@include     file="menu.jsp"  %>
           
           <%@include     file="marcasTopo.jsp"  %>
            
           <div class="w3-content w3-section" style="float: left;
    display: inline-block;
    background-color: black;
    width: 500px;
     margin-left: 30px;">             
                   <img src="imagens/modelosIndex1.jpg" class="mySlides" id="img1">
                    <img src="imagens/modelosIndex2.jpg" class="mySlides" id="img1">
                    <img src="imagens/modeloIndex7.jpg" class="mySlides" id="img1">
            </div>
              
            
           <div class="w3-content w3-section" style="display: inline-block;
    background-color: black;
    float: right;">
               <img src="imagens/modeloIndex5.jpg" class="mySlid"  id="img4" />
                              
           </div>  
           
    </div>
           
           <div id="linhaTitulo">
                
            </div>
           
            <div>
                <h2 id="TituloVideo">Confira Nosso Flow Pesado: Open Bomba &#9996;</h2>
                
            </div>
            
            <iframe id="videoYT" width="760" height="415" src="https://www.youtube.com/embed/WLmtW7xknow" 
            frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            
            
            <div id="linhaTitulo">
                
            </div>
            
            
            
            <div>
                <h1 id="TituloTable">Últimas Camisetas Adicionadas</h1>
            </div>
            
            <div id="linhaTitulo">
                
            </div>
            
         
            <br>
            <div><!-- TABELA COM OS PRODUTOS-->
     
            <table class="table" id="listarUltimosProduto">
                <thead>
                <tr>
                  <th>Imagem</th>
                    <th>Nome </th>
                    <th>Marca</th>
                    <th>Tamanho</th>
                    <th>Preco</th>
                   
                    <th>Status</th>
                </tr>
                </thead>
                <tfoot>
               <tr>
                    <th>Imagem</th>
                    <th>Nome </th>
                    <th>Marca</th>
                    <th>Tamanho</th>
                    <th>Preco</th>
                   
                    <th>Status</th>
              </tr>
                </tfoot>
             
                
                <jsp:useBean class="model.ProdutoDAO" id="pDAO"/> <!-- Criando um perfil com jstl-->
                <tbody>
                    <c:forEach var="p" items="${pDAO.ultimosAdicionado}">
                
                    <tr>
                    <!-- Imprimir a lista pesquisada -->
                    <td><img src="${p.imagem}" width="200px" height="200px"> </td>
                    <td style="line-height: 13; font-size: 15px; color: black">${p.nome}</td>
                    <td style="line-height: 13; font-size: 15px;">${p.marca}</td>
                    <td style="line-height: 13; font-size: 15px;">${p.tamanho}</td>
                    <td style="line-height: 13; font-size: 15px;">${p.preco}</td>
                   
                    <td style="line-height: 13; font-size: 15px;">
                        <c:if test="${p.status==1}">
                            <P style="color: blue;font-weight: bolder">Disponível</P
                        </c:if>
                           
                                 <c:if test="${p.status==3}">
                                     <P style="color: red;font-weight: bolder">Em Falta</P
                            </c:if> 
                                       
                        </td>                   
                    
                    <td style="line-height: 13; font-size: 15px;">
                        <a class="btn btn-primary" style="background-color: gold; border-color: gold;"  
                           href="gerenciar_produto.do?acao=visualizar&idProduto=${p.idProduto}">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-eye-open" ></i>
                        </a> 
                            <a class="btn btn-default" style="background-color: green; border-color: green; color: white;" onclick="irParaCarrinho()" href="listar_cliente.jsp">  <!-- ELEMNTOS DO BOOTSTRAP-->
                            <i class="glyphicon glyphicon-shopping-cart" ></i>
                        </a>  
                                   </tr>
                </c:forEach> <!-- FIM DO JSTL-->
                </tbody>
            </table>
             <script type="text/javascript" src="datatables/jquery.js"> </script> <!-- TRADUÇÃO DAS DATATABLES-->
             <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
              <script type="text/javascript">
                    $(document).ready(function(){
                        $("#listarUltimosProduto").dataTable({
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
    </div>
    
    
     <div id="linhaTitulo">
                
        </div>
    <br>
    
    
        <%@include     file="quemSomos.jsp"  %>
        <br>
        
         <div id="linhaTitulo">
                
        </div>
        
        <div>
            <h3 id="TituloSigam">Sigam-nos nas redes</h3>
            <p class="sigam">
               <a href="https://www.youtube.com/channel/UCEMMPcxSE62RxbfkMXMrQRg" class="fa fa-youtube"></a>
               <a href="https://www.instagram.com/ptl.crew/?hl=pt-br" class="fa fa-instagram"></a>
               <a href="https://twitter.com/neymarjr?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor" class="fa fa-twitter"></a>
               <a href="https://www.facebook.com/ptlcrew/" class="fa fa-facebook"></a>
            </p>
            
            
        </div>
        
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    <br>
            <footer>
              <%@include     file="fundoBaixo.jsp"  %>
               <%@include     file="rodape.jsp"  %>
             
            </footer>
               
               <script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 3000); // Change image every 2 seconds
}



</script>


    </body>
</html>
