<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="style_jsp/default_header_style.jsp" %>
        <title>JSP Page</title>
        <style>
            .logout_msg h1 span{
                margin-right: 15px;
            }
        </style>
    </head>
    <body>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index">Unnamed system</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="jumbotron logout_msg txt-center">
                <% if(request.getAttribute("invalid_logout")==null) {%>
                    <h1 class="MB25"><span class="glyphicon glyphicon-ok"></span>You are now log out!</h1>
                <% }else{ %>
                    <h1 class="MB25"><span class="glyphicon glyphicon-remove"></span>You haven't logged in yet!</h1>
                <% } %>
                <a href="index" class="btn btn-default btn-warning btn-lg"><span class="glyphicon glyphicon-share-alt"></span> Click here to go back to the homepage</a>
            </div>
        </div>
    </body>
</html>
