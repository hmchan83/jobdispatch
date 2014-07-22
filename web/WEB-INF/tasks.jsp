<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tasks</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <link href="css/assigned-tasks.css" rel="stylesheet" type="text/css"/>
        <link href="css/modalstyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/pnotify.custom.min.js"></script>
        <style>
            .task-list-container button{
                margin: 0px 0px 10px 0px;
                width: 175px;
            }
            .task-detail-container iframe{
                border: 0px solid;
                width: 100%;
                min-height: 100%;

            }
        </style>
        <script>
            $.extend({
                getUrlVars: function() {
                    var vars = [], hash;
                    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                    for (var i = 0; i < hashes.length; i++)
                    {
                        hash = hashes[i].split('=');
                        vars.push(hash[0]);
                        vars[hash[0]] = hash[1];
                    }
                    return vars;
                },
                getUrlVar: function(name) {
                    return $.getUrlVars()[name];
                }
            });

            function changeTaskDetail(taskid) {
                $(".task-detail-container iframe").attr("src", "taskdetail?taskid=" + taskid);
            }

            function displayMessage() {
                var isAddTask = "${requestScope.valid_add_task}";
                var invalidAssignee = "${requestScope.invalid_assignee}";
                if (isAddTask == "true")
                    new PNotify({
                        title: 'Task Created Successfully',
                        text: '',
                        type: 'success'
                    });
                else {
                    if (invalidAssignee == "true") {
                        new PNotify({
                            title: "Task can't be created",
                            text: 'You put the wrong assignee username',
                            type: 'error'
                        });
                    } else if(invalidAssignee == "false"){
                        new PNotify({
                            title: "Task can't be created",
                            text: 'Something went wrong',
                            type: 'error',
                            icon: 'glyphicon glyphicon-user'
                        });
                    }
                }
            }

            $(document).ready(function() {
                $(".task-list-detail a").each(function() {
                    $(this).on("click", function() {
                        changeTaskDetail($(this).data("taskid"));
                    });
                });
                if ($.getUrlVar('taskid') !== undefined)
                    changeTaskDetail($.getUrlVar('taskid'));
                else
                    changeTaskDetail($(".task-list-detail a:first").data("taskid"));

                displayMessage();
            });
        </script>
    </head>
    <body>
        <div class="modal fade" id="new_task_popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">New task</h4>
                    </div>
                    <form class="form-horizontal" role="form" action="tasks" method="POST">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="tasktitle" class="col-sm-3 col-md-3 control-label">Task Title</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="tasktitle" />
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="tasktype" class="col-sm-3 col-md-3 control-label">Task Type</label>
                                <div class="col-sm-9 col-md-9">
                                    <select name="tasktype" class="form-control">
                                        <c:forEach items="${requestScope.tasktypelist}" var="tasktype">
                                        <option value="${tasktype.typeID}">${tasktype.typeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="taskpriority" class="col-sm-3 col-md-3 control-label">Task Priority</label>
                                <div class="col-sm-9 col-md-9">
                                    <select name="taskpriority" class="form-control">
                                        <c:forEach items="${requestScope.taskprioritylist}" var="taskpriority">
                                        <option value="${taskpriority.priorityID}">${taskpriority.priorityName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="taskdescription" class="col-sm-3 col-md-3 control-label">Task Description</label>
                                <div class="col-sm-9 col-md-9">
                                    <textarea class="form-control" name="taskdescription" rows="5"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="assignee" class="col-sm-3 col-md-3 control-label">Assign To</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="assignee" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-primary" value="Submit"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="template_jsp/header.jsp" flush="true" />
        <div class="container">
            <div class="row fill">
                <div class="col-sm-4 col-md-4 task-list-container">
                    <button class="btn btn-default btn-danger btn-lg btn-block" data-toggle="modal" data-target="#new_task_popup"><span class="glyphicon glyphicon-plus"></span> Create Task</button>
                    <jsp:include page="template_jsp/assigned_tasks.jsp" flush="true" />
                    <jsp:include page="template_jsp/unreported_tasks.jsp" flush="true" />
                </div>
                <div class="col-sm-8 col-md-8 task-detail-container">
                    <iframe src="taskdetail"></iframe>
                </div> 
            </div>
        </div>
        <%@include file="template_jsp/footer-light.jsp" %>
    </body>
</html>
