<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_style.jsp" %>
    </head>
    <body>
        <div class="result_block">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Log ID</th>
                        <th>Log Type</th>
                        <th>Task ID</th>
                        <th>Assignee</th>
                        <th>Reporter</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.result}" var="log">
                        <tr>
                            <td>${log.logID}</td>
                            <td>${log.logType}</td>
                            <td onclick="window.open('taskdetail?taskid=${log.task.taskID}')" style="cursor: pointer">${log.task.taskID}</td>
                            <td>${log.assignee}  (${log.assignee.staffID})</td>
                            <td>${log.reporter}  (${log.reporter.staffID})</td>
                            <td>${log.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
