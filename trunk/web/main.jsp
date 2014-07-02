<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <link href="css/assigned-tasks.css" rel="stylesheet" type="text/css"/>
        <style>
            .task-container{
                margin-top: 20px;
            }
        </style>
        <link rel="stylesheet" href="css/user.css" />
    </head>
    <body>
        <jsp:include page="template_jsp/header.jsp" flush="true">
            <jsp:param name="username" value="Joseph" />
        </jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 hidden-xs hidden-sm staff-container">
                    <jsp:include page="template_jsp/user.jsp" flush="true">
                        <jsp:param name="name" value="Joseph" />
                    </jsp:include>
                </div>
                <div class="col-md-7 task-container">
                    <div class="welcome-msg block">
                        <h1>Welcome! username</h1>
                    </div>
                    <jsp:include page="template_jsp/assigned_tasks.jsp" flush="true" />
                </div>
            </div>
        </div>
    </body>
</html>
