<%@page import="bean.Status"%>
<%@page import="bean.TaskType"%>
<%@page import="bean.Priority"%>
<%@page import="bean.Staff"%>
<%@page import="java.util.Map"%>
<%@page import="bean.Task"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HashMap<Task, Integer> urgent_tasks = (HashMap<Task, Integer>) request.getAttribute("urgent_tasks"); %>
<% HashMap<Staff, Integer> high_workload_ppl = (HashMap<Staff, Integer>) request.getAttribute("high_workload_ppl"); %>
<% HashMap<Staff, Integer> low_workload_ppl = (HashMap<Staff, Integer>) request.getAttribute("low_workload_ppl"); %>
<% HashMap<Staff, Integer> productive_ppl = (HashMap<Staff, Integer>) request.getAttribute("productive_ppl"); %>
<% HashMap<Staff, Integer> non_productive_ppl = (HashMap<Staff, Integer>) request.getAttribute("non_productive_ppl"); %>
<% HashMap<Priority, Integer> resolved_priority = (HashMap<Priority, Integer>) request.getAttribute("resolved_priority"); %>
<% HashMap<Priority, Integer> unresolved_priority = (HashMap<Priority, Integer>) request.getAttribute("unresolved_priority"); %>
<% HashMap<TaskType, Integer> resolved_type = (HashMap<TaskType, Integer>) request.getAttribute("resolved_type"); %>
<% HashMap<TaskType, Integer> unresolved_type = (HashMap<TaskType, Integer>) request.getAttribute("unresolved_type"); %>
<% Integer total_unresolved_tasks = (Integer)request.getAttribute("total_unresolved_tasks"); %>
<% Integer total_resolved_tasks = (Integer)request.getAttribute("total_resolved_tasks"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <style>
            .advices{
                margin-top: 20px;
            }

            .stat-containter div{
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="template_jsp/header.jsp" flush="true" />
        <div class="container">
            <div class="row">
                <div class="resolved-graph stat-graph col-md-6"></div>
                <div class="unresolved-graph stat-graph col-md-6"></div>
            </div>
            <div class="row">
                <div class="resolved-priority-num num-stat table-responsive col-md-6">
                    <h3>resolved: by priority</h3>
                    <table class="table table-hover">
                        <thead>
                        <th>priority</th>
                        <th>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <%for (Map.Entry<Priority, Integer> entry : resolved_priority.entrySet()) {%>
                        <tr>
                            <td><%=entry.getKey()%></td>
                            <td><%=entry.getValue()%></td>
                            <td><%=(total_resolved_tasks==0)? 0 : entry.getValue() *100 / total_resolved_tasks %>%</td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class="unresolved-priority-num num-stat table-responsive col-md-6">
                    <h3>unresolved: by priority</h3>
                    <table class="table table-hover">
                        <thead>
                        <th>priority</th>
                        <th>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <%for (Map.Entry<Priority, Integer> entry : unresolved_priority.entrySet()) {%>
                        <tr>
                            <td><%=entry.getKey()%></td>
                            <td><%=entry.getValue()%></td>
                            <td><%=(total_unresolved_tasks==0)? 0 : entry.getValue()*100/total_unresolved_tasks %>%</td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="resolved-type-num num-stat table-responsive col-md-6">
                    <h3>resolved: by type</h3>
                    <table class="table table-hover">
                        <thead>
                        <th>type</th>
                        <th>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <%for (Map.Entry<TaskType, Integer> entry : resolved_type.entrySet()) {%>
                        <tr>
                            <td><%=entry.getKey()%></td>
                            <td><%=entry.getValue()%></td>
                            <td><%=(total_resolved_tasks==0)? 0 : entry.getValue()*100/total_resolved_tasks %>%</td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class="unresolved-type-num num-stat table-responsive col-md-6">
                    <h3>unresolved: by type</h3>
                    <table class="table table-hover">
                        <thead>
                        <th>type</th>
                        <th>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <%for (Map.Entry<TaskType, Integer> entry : unresolved_type.entrySet()) {%>
                        <tr>
                            <td><%=entry.getKey()%></td>
                            <td><%=entry.getValue()%></td>
                            <td><%=(total_unresolved_tasks==0)? 0 : entry.getValue()*100/total_unresolved_tasks %>%</td>
                        </tr>
                        <%}%>
                    </table>
                </div>    
            </div>
            <div class="row">
                <div class="resolved-stat ppl-stat table-responsive col-md-6">
                    <h3>
                        these men deserve a cookie
                    </h3>
                    <table class="table table-hover">
                        <thead>
                        <th>employees</th>
                        <th>resolved tasks</th>
                        </thead>
                        <%for (Map.Entry<Staff, Integer> entry : productive_ppl.entrySet()) {%>
                        <tr>
                            <td><%=entry.getKey()%></td>
                            <td><%=entry.getValue()%></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
                <div class="unresolved-stat ppl-stat table-responsive col-md-6">
                    <h3>
                        these men need a little push
                    </h3>
                    <table class="table table-hover">
                        <thead>
                        <th>employees</th>
                        <th>resolved tasks</th>
                        </thead>
                        <%for (Map.Entry<Staff, Integer> entry : non_productive_ppl.entrySet()) {%>
                        <tr>
                            <td><%=entry.getKey()%></td>
                            <td><%=entry.getValue()%></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 advices-container">
                    <h3>advices</h3>
                    <div class="task-first-container advices table-responsive">
                        <div class="italic-heading FS18">work on these tasks first</div>
                        <table class="table table-hover">
                            <thead>
                            <th>Task ID</th>
                            <th>Task title</th>
                            <th>Priority</th>
                            <th>Unresolved for</th>
                            </thead>

                            <%for (Map.Entry<Task, Integer> entry : urgent_tasks.entrySet()) {%>
                            <tr>
                                <td><%=entry.getKey().getTaskID()%></td>
                                <td><%=entry.getKey().getTaskName()%></td>
                                <td><%=entry.getKey().getPriority()%></td>
                                <td><%=entry.getValue()%> days</td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div class="col-sm-6 col-md-6 PL0">
                        <div class="stop-tasks-container advices table-responsive">
                            <div class="italic-heading FS18">
                                stop giving tasks to these people
                            </div>
                            <table class="table table-hover">
                                <thead>
                                <th>Name</th>
                                <th>Unresolved jobs assigned to them</th>
                                </thead>
                                <%for (Map.Entry<Staff, Integer> entry : high_workload_ppl.entrySet()) {%>
                                <tr>
                                    <td><%=entry.getKey().getRealName()%></td>
                                    <td><%=entry.getValue()%></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 PR0">
                        <div class="give-tasks-container advices table-responsive">
                            <div class="italic-heading FS18">
                                instead, giving tasks to them
                            </div>
                            <table class="table table-hover">
                                <thead>
                                <th>Name</th>
                                <th>Unresolved jobs assigned to them</th>
                                </thead>
                                <%for (Map.Entry<Staff, Integer> entry : low_workload_ppl.entrySet()) {%>
                                <tr>
                                    <td><%=entry.getKey().getRealName()%></td>
                                    <td><%=entry.getValue()%></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
