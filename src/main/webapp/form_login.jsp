<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="es">

<head>
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <title>PRL - CREW</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="estilo/estiloFormLogin.css"/>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
    
     
   <div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title" id="loginTitulo">Login</h1>
            <div class="account-wall">
                <img class="profile-img" src="imagens/logo-pequeno.jpg"
                    alt="">
                
                 <% 
            String mensagem = (String)request.getSession().getAttribute("mensagem");
             if(mensagem !=null){
                 request.getSession().removeAttribute("mensagem");
             
            
        %>
       
        <div class="alert alert-info"><%=mensagem%></div>
         
        <% 
            }
             %>
                
                <form class="form-signin" action="gerenciar_login.do" method="POST">
                    <input type="text" class="form-control" name="login" placeholder="Login" required autofocus>
                    <input type="password" class="form-control"  name="senha" placeholder="Senha" required>
                    <button class="btn btn-lg btn-primary btn-block" style="background-color: black" type="submit">
                    Logar</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                   Lembrar Senha
                </label>
                
                </form>
           
    </div>
</div>
</div>
   </div>
</body>
 </html>   