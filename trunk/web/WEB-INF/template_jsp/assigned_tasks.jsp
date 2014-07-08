<%@page import="bean.Task"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList<Task> tasks = (ArrayList<Task>)session.getAttribute("tasklist"); %>
<div class="assigned-tasks block">
    <div class="title-bar block">
        You have these tasks unfinished
    </div>
    <div class="tasks">
        <% for(Task t : tasks){ %>
        <div class="task-list-detail block row">
            <a href="#">
                <div class="col-md-2 task-id"><%=t.getTaskID()%></div>
                <div class="col-md-10 task-title"><%=t.getTaskName()%></div>
            </a>
        </div>  
        <%}%>
    </div>
</div>
