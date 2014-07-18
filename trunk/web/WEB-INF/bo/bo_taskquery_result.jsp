<%@page import="bean.Task"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("result");%>
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
                        <% for (Task t : tasks) { %>
                        <tr onclick="window.open('taskdetail?taskid=<%=t.getTaskID()%>')" style="cursor: pointer">
                            <td><%=t.getTaskID()%></td>
                            <td><%=t.getTaskName()%></td>
                            <td><%=t.getTaskType()%></td>
                            <td><%=t.getPriority()%></td>
                            <td><%=t.getStatus()%></td>
                            <td><%=t.getAssignee()%></td>
                            <td><%=t.getReporter()%></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
    </body>
</html>
