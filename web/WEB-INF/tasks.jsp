<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tasks</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <link href="css/assigned-tasks.css" rel="stylesheet" type="text/css"/>
        <link href="css/modalstyle.css" rel="stylesheet" type="text/css"/>
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
    </head>
    <body>
        <div class="modal fade" id="new_task_popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">New task</h4>
                    </div>
                    <form class="form-horizontal" role="form">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="taskid" class="col-sm-3 col-md-3 control-label">Task ID</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="taskid" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="tasktitle" class="col-sm-3 col-md-3 control-label">Task Title</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="tasktitle" />
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="tasktype" class="col-sm-3 col-md-3 control-label">Task Type</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="tasktype" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="taskstatus" class="col-sm-3 col-md-3 control-label">Task Status</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="taskstatus" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="taskpriority" class="col-sm-3 col-md-3 control-label">Task Priority</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="taskpriority" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="taskdescription" class="col-sm-3 col-md-3 control-label">Task Description</label>
                                <div class="col-sm-9 col-md-9">
                                    <textarea class="form-control" name="taskdescription" rows="5"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="asignee" class="col-sm-3 col-md-3 control-label">Assign To</label>
                                <div class="col-sm-9 col-md-9">
                                    <input type="text" class="form-control" name="asignee" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <input type="submit" class="btn btn-primary" />
                        </div>
                    </form>
                </div>
            </div>
          </div>
        <jsp:include page="template_jsp/header.jsp" flush="true">
            <jsp:param name="username" value="Joseph" />
        </jsp:include>
        <div class="container">
            <div class="row fill">
                <div class="col-sm-4 col-md-4 task-list-container">
                    <button class="btn btn-default btn-danger btn-lg btn-block" data-toggle="modal" data-target="#new_task_popup"><span class="glyphicon glyphicon-plus"></span> Create Task</button>
                    <jsp:include page="template_jsp/assigned_tasks.jsp" flush="true" />
                </div>
                <div class="col-sm-8 col-md-8 task-detail-container">
                    <iframe src="taskdetail"></iframe>
                </div> 
            </div>
        </div>
    </body>
</html>
