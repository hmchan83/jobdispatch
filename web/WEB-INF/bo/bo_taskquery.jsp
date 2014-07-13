<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_header_style.jsp" %>
        <style>
            label{
                color: #666666;
                font-weight: normal;
                font-style: italic;
            }
            .filter_block{
                background-color: #F5F5F5;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="filter_block MB20 PT20 row">
                <form class="form-horizontal" role="form" action="tasks" method="POST">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="taskid" class="col-sm-3 col-md-3 control-label">Task ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="taskid" />
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
                                <select name="tasktype" class="form-control">

                                </select>
                            </div>
                        </div> 
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="taskpriority" class="col-sm-3 col-md-3 control-label">Task Priority</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="taskpriority" class="form-control">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="taskstatus" class="col-sm-3 col-md-3 control-label">Task Status</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="taskstatus" class="form-control">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="assignee" class="col-sm-3 col-md-3 control-label">Assignee</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="assignee" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reporter" class="col-sm-3 col-md-3 control-label">Reporter</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="reporter" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 MT20 txt-center">
                        <div class="form-group row">
                            <input type="submit" class="btn btn-primary" value="Submit">
                            <input type="reset" class="btn btn-danger" value="Reset">
                        </div>
                    </div>
                </form>
            </div>
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
                        <tr>
                            <td>ID</td>
                            <td>Title</td>
                            <td>Type</td>
                            <td>Priority</td>
                            <td>Status</td>
                            <td>Assignee</td>
                            <td>Reporter</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>


