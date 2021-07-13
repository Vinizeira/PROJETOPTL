<%@page import="model.Usuario"%>
<%@page import="controle.Gerenciar_Login"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<% 
    Usuario ulogado = Gerenciar_Login.verificarAcesso(request, response);
    request.setAttribute("ulogado", ulogado);
 



%>



<div class="menu">
    <ul> 
         <li> <a href="gerenciar_login.do">Sair</a> </li>
    <c:if test="${ulogado!=null && ulogado.perfil!=null}"> 
        <c:forEach var="menu" items="${ulogado.perfil.menus}">
            <c:if test="${menu.exibir==1}">
                <li>  <a href="${menu.link}">${menu.nome}</a>  </li>
            </c:if>
        </c:forEach>
    
    </c:if>
                 
                
                
  <div style="color: white; background-color: black;text-align: center;"><c:if test="${ulogado!=null}">${ulogado.nome}</c:if>  
    
</div>
    </ul>
</div>

<link rel="stylesheet" href="estilo/menu.css" type="text/css"/>
