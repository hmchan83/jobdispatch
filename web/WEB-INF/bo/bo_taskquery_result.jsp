<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_style.jsp" %>
        <style>
            td{
                vertical-align: middle !important;
            }
        </style>
        <script>      
            function retireStaff(staffid){
                $("#pplmanage input[name='retire']").attr("value", staffid);
                $("#pplmanage").submit();
            }
            
            function hireStaff(staffid){
                $("#pplmanage input[name='hire']").attr("value", staffid);
                $("#pplmanage").submit();
            }
        </script>
    </head>
    <body>
          <div class="result_block">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Type</th>
                            <th>Priority</th>
                            <th>Status</th>
                            <th>Assignee</th>
                            <th>Reporter</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.result}" var="task">
                        <tr onclick="window.open('taskdetail?taskid=${task.taskID}')" style="cursor: pointer">
                            <td>${task.taskID}</td>
                            <td>${task.taskName}</td>
                            <td>${task.taskType}</td>
                            <td>${task.priority}</td>
                            <td>${task.status}</td>
                            <td>${task.assignee}</td>
                            <td>${task.reporter}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
    </body>
</html>
