<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .advices{
                margin-top: 20px;
            }

            .stat-containter div{
                margin-bottom: 20px;
            }
        </style>
        <link href="css/bootstrap-sortable.css" rel="stylesheet" type="text/css" />
        <%@include file="style_jsp/default_header_style.jsp" %>
        <script src="js/bootstrap-sortable.js"></script>
        <script>
            $(document).ready(function(){
                $(".percentcalc").each(function(){
                  $(this).text(parseInt($(this).prev().text()/$(this).data("total")*100)+"%");
                })
            })
        </script>
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
                    <table class="table table-hover sortable">
                        <thead>
                        <th>priority</th>
                        <th data-defaultsort='desc'>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.resolved_priority}" var="priority">
                                <tr>
                                    <td>${priority.key}</td>
                                    <td class="num_value">${priority.value}</td>
                                    <td class="percentcalc" data-total="${requestScope.total_resolved_tasks}">0%</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="unresolved-priority-num num-stat table-responsive col-md-6">
                    <h3>unresolved: by priority</h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th>priority</th>
                        <th data-defaultsort='desc'>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <tobdy>
                            <c:forEach items="${requestScope.unresolved_priority}" var="priority">
                            <tr>
                                <td>${priority.key}</td>
                                <td class="num_value">${priority.value}</td>
                                <td class="percentcalc" data-total="${requestScope.total_unresolved_tasks}">0%</td>
                            </tr>
                            </c:forEach>
                        </tobdy>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="resolved-type-num num-stat table-responsive col-md-6">
                    <h3>resolved: by type</h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th>type</th>
                        <th data-defaultsort='desc'>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.resolved_type}" var="type">
                            <tr>
                                <td>${type.key}</td>
                                <td class="num_value">${type.value}</td>
                                <td class="percentcalc" data-total="${requestScope.total_resolved_tasks}">0%</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="unresolved-type-num num-stat table-responsive col-md-6">
                    <h3>unresolved: by type</h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th>type</th>
                        <th data-defaultsort='desc'>tasks</th>
                        <th>percentage</th>   
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.unresolved_type}" var="type">
                            <tr>
                                <td>${type.key}</td>
                                <td class="num_value">${type.value}</td>
                                <td class="percentcalc" data-total="${requestScope.total_resolved_tasks}">0%</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>    
            </div>
            <div class="row">
                <div class="resolved-stat ppl-stat table-responsive col-md-6">
                    <h3>
                        these men deserve a cookie
                    </h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th>employees</th>
                        <th  data-defaultsort='desc'>resolved tasks</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.productive_ppl}" var="ppl">
                            <tr>
                                <td>${ppl.key}</td>
                                <td>${ppl.value}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="unresolved-stat ppl-stat table-responsive col-md-6">
                    <h3>
                        these men need a little push
                    </h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th>employees</th>
                        <th data-defaultsort='asc'>resolved tasks</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.non_productive_ppl}" var="ppl">
                            <tr>
                                <td>${ppl.key}</td>
                                <td>${ppl.value}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 advices-container">
                    <h3>advices</h3>
                    <div class="task-first-container advices table-responsive">
                        <div class="italic-heading FS18">work on these tasks first</div>
                        <table class="table table-hover sortable">
                            <thead>
                            <th>Task ID</th>
                            <th>Task title</th>
                            <th>Priority</th>
                            <th  data-defaultsort='desc'>Unresolved for</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.urgent_tasks}" var="task">
                                <tr>
                                    <td>${task.key.taskID}</td>
                                    <td>${task.key.taskName}</td>
                                    <td>${task.key.priority}</td>
                                    <td>${task.value} days</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm-6 col-md-6 PL0">
                        <div class="stop-tasks-container advices table-responsive">
                            <div class="italic-heading FS18">
                                stop giving tasks to these people
                            </div>
                            <table class="table table-hover sortable">
                                <thead>
                                <th>Name</th>
                                <th data-defaultsort='desc'>Unresolved jobs assigned to them</th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.high_workload_ppl}" var="ppl">
                                    <tr>
                                        <td>${ppl.key.realName}</td>
                                        <td>${ppl.value}</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 PR0">
                        <div class="give-tasks-container advices table-responsive">
                            <div class="italic-heading FS18">
                                instead, giving tasks to them
                            </div>
                            <table class="table table-hover sortable">
                                <thead>
                                <th>Name</th>
                                <th data-defaultsort='desc'>Unresolved jobs assigned to them</th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.low_workload_ppl}" var="ppl">
                                    <tr>
                                        <td>${ppl.key.realName}</td>
                                        <td>${ppl.value}</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
