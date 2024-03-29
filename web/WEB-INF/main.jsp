<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unnamed system</title>
        <link href="css/assigned-tasks.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/user.css" />
        <%@include file="style_jsp/default_header_style.jsp" %>
        <script>
            $(document).ready(function() {
                $(".task-list-detail a").each(function() {
                    $(this).attr("href", "tasks?taskid=" + $(this).data("taskid"));
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="template_jsp/header.jsp" flush="true" />
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 hidden-xs hidden-sm staff-container">
                    <jsp:include page="template_jsp/user.jsp" flush="true" />
                </div>
                <div class="col-md-7 task-container">
                    <div class="welcome-msg block MB20">
                        <h1>Welcome! ${CurrentUser.realName}</h1>
                    </div>
                    <jsp:include page="template_jsp/assigned_tasks.jsp" flush="true" />
                    <jsp:include page="template_jsp/unreported_tasks.jsp" flush="true" />
                </div>
            </div>
        </div>
        <%@include file="template_jsp/footer-light.jsp" %>
    </body>
</html>
