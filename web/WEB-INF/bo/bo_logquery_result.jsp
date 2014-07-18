<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Log"%>
<%ArrayList<Log> logs = (ArrayList<Log>)request.getAttribute("result");%>
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
                        <%for(Log log : logs){%>
                        <tr>
                            <td><%=log.getLogID()%></td>
                            <td><%=log.getLogType()%></td>
                            <td onclick="window.open('taskdetail?taskid=<%=log.getTask().getTaskID()%>')" style="cursor: pointer"><%=log.getTask().getTaskID()%></td>
                            <td><%=log.getAssignee()%>  (<%=log.getAssignee().getStaffID()%>)</td>
                            <td><%=log.getReporter()%>  (<%=log.getReporter().getStaffID()%>)</td>
                            <td><%=log.getTime()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
    </body>
</html>
