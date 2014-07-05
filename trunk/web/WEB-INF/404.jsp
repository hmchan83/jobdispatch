<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="fill" onclick="window.location = 'index'">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404</title>
        <jsp:include page="/WEB-INF/style_jsp/default_header_style.jsp" flush="true" />
        <script>
            $(document).ready(function() {
                var target = Math.floor(Math.random() * 7 + 1);
                $("#404gif").attr("src", "img/404gif/" + target + ".gif");
            });
        </script>
        <style>
            html{
                cursor: default;
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
        <div class="container txt-center">
            <h1 class="div-center text-danger">404</h1>
            <p class="MT25"><img id="404gif" /></p>
            <p class="MT25">Most likely you will see this page because school server sucks</p>
            <p class="MT10">Click anywhere to go back to the homepage</p>
        </div>
    </body>
</html>
