<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <script src="js/md5.js"></script>
        <script src="js/pnotify.custom.min.js"></script>
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
        <script>
            ki = 0;
            ks = [38, 40, 38, 40, 37, 39, 65, 66];
            window.onload = function() {
                if (${empty requestScope.invalid_login?"false":requestScope.invalid_login}) {
                    var l = 20;
                    for (var i = 0; i < 10; i++)
                        $("#login-form").animate({'margin-left': "+=" + (l = -l) + 'px'}, 50);
                }

                $(document).bind("keydown", function(e) {
                    key = e.keyCode;
                    if (ks[ki] == key)
                        ki++;
                    else
                        ki = 0;
                    if (ki == ks.length) {
                        $(".navbar").removeClass("navbar-default");
                        $(".navbar").addClass("navbar-inverse");
                        $("#login-form").attr("action", "bo_index");
                        new PNotify({
                            title: 'BO mode activated',
                            text: '',
                            type: 'success'
                        });
                        ki = 0;
                    }
                });
            }
            function hashPW() {
                var hash = CryptoJS.MD5($('input[name="password"]').val());
                $('input[name="password"]').val(hash);
            }
        </script>
        <title>Unnamed System</title>
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
            <form class="form-signin div-center" id="login-form" role="form" action="index" method="POST" onsubmit="hashPW()">
                <h4 class="form-signin-heading">Please sign in</h4>
                <input type="text" class="form-control" name="username" placeholder="Username" required="" autofocus="">
                <input type="password" class="form-control" name="password" placeholder="Password" required="">
                <input class="btn btn-lg btn-primary btn-block" type="submit" value="Log In" />
            </form>
        </div>
        <%@include file="template_jsp/footer-light.jsp" %>
    </body>
</html>
