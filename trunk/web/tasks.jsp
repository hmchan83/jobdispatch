<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <link href="css/assigned-tasks.css" rel="stylesheet" type="text/css"/>
        <style>
            .task-list-container button{
                margin-bottom: 10px;
                width: 175px;
            }
            
            .task-detail-container iframe{
                border: 0px solid;
                width: 100%;
                min-height: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="template_jsp/header.jsp" flush="true">
            <jsp:param name="username" value="Joseph" />
        </jsp:include>
        <div class="container">
            <div class="row fill">
                <div class="col-sm-4 col-md-4 task-list-container">
                    <button class="btn btn-default btn-danger btn-lg btn-block"><span class="glyphicon glyphicon-plus"></span> Create Task</button>
                    <jsp:include page="template_jsp/assigned_tasks.jsp" flush="true" />
                </div>
                <div class="col-sm-8 col-md-8 task-detail-container">
                    <iframe src="task-detail.jsp"></iframe>
                </div> 
            </div>
        </div>
    </body>
</html>
