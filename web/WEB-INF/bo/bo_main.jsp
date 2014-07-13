<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_header_style.jsp" %>
        <style>
            .control-list{
                background-color: #F5F5F5; 
            }
        </style>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="row">
                <div class="col-md-5 jumbotron control-list tasks-control">
                    <h2>Tasks Control</h2>
                    <br/>
                    <a href="bo_taskDetail" class="btn btn-default btn-info btn-lg btn-block"><span class="glyphicon glyphicon-list-alt"></span> Task Detail</a>
                    <a href="bo_taskQuery" class="btn btn-default btn-info btn-lg btn-block"><span class="glyphicon glyphicon-tasks"></span> Task Query</a>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5 jumbotron control-list users-control">
                    <h2>Staff Control</h2>
                    <br/>
                    <a href="bo_createStaff" class="btn btn-default btn-info btn-lg btn-block"><span class="glyphicon glyphicon-user"></span> Create Staff</a>
                    <a href="bo_staffQuery" class="btn btn-default btn-info btn-lg btn-block"><span class="glyphicon glyphicon-search"></span> Staff Query</a>
                </div>
            </div>
        </div>
    </body>
</html>

