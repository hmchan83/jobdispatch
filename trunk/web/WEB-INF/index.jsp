<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="style_jsp/default_header_style.jsp" %>
        <style>
            /*Custom style of this webpage*/
            .form-signin{
                max-width: 350px;
            }
            
            input[type="text"]{
                border-radius: 5px 5px 0px 0px;
            }
            
            input[type="password"]{
                border-radius: 0px 0px 5px 5px;
                margin-top: 0px;
            }
            
            input[type="submit"]{
                margin-top: 10px;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index">Unnamed system</a>
                </div>
            </div><!--/.nav-collapse -->
        </div>
        <div class="container">
            <form class="form-signin div-center" id="login-form" role="form" action="index" method="POST">
                <h4 class="form-signin-heading">Please sign in</h4>
                <input type="text" class="form-control" name="username" placeholder="Username" required="" autofocus="">
                <input type="password" class="form-control" name="password" placeholder="Password" required="">
                <input class="btn btn-lg btn-primary btn-block" type="submit" value="Log In" />
            </form>
        </div>
    </body>
</html>