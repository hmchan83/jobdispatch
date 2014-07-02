<%-- 
    Document   : index
    Created on : 2014年7月1日, 上午09:24:49
    Author     : Joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="style_jsp/default_style.jsp" %>
        <style>
            /*Custom style of this webpage*/
            .form-signin{
                max-width: 350px;
                margin: 70px auto 0px auto;
            }
            
            input[type="text"]{
                border-radius: 5px 5px 0px 0px;
            }
            
            input[type="password"]{
                border-radius: 0px 0px 5px 5px;
                margin-top: 0px;
            }
            
            button{
                margin-top: 10px;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h3 class="text-muted">Unnamed System</h3>
            </div>
            <form class="form-signin" role="form" method="POST">
                <h4 class="form-signin-heading">Please sign in</h4>
                <input type="text" class="form-control" placeholder="Username" required="" autofocus="">
                <input type="password" class="form-control" placeholder="Password" required="">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
    </body>
</html>
