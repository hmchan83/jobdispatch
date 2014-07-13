<%@page import="bean.Task"%>
<%@page import="java.util.ArrayList"%>
<% ArrayList<Task> tasks = (ArrayList<Task>)session.getAttribute("unreportedtasklist"); %>
<div class="taskmenu ib">
    <div class="title-bar block">
        These tasks are finished, but not yet reported
    </div>
    <div class="tasks">
        <% for(Task t : tasks){ %>
        <div class="task-list-detail block row">
            <a data-taskid="<%=t.getTaskID()%>">
                <div class="col-xs-2 col-sm-2 col-md-2 task-id"><%=t.getTaskID()%></div>
                <div class="col-xs-10 col-sm-10 col-md-10 task-title"><%=t.getTaskName()%></div>
            </a>
        </div>  
        <%}%>
    </div>
</div>
