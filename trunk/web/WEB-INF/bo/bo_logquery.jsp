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
            
            td{
                vertical-align: middle !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="filter_block MB20 PT20 row">
                <form class="form-horizontal" role="form" action="" method="POST">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="logid" class="col-sm-3 col-md-3 control-label">Log ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="logid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="logtype" class="col-sm-3 col-md-3 control-label">Log Type</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="logtype"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="taskid" class="col-sm-3 col-md-3 control-label">Task ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="taskid"/>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="assigneeid" class="col-sm-3 col-md-3 control-label">Assignee ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="assigneeid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reporterid" class="col-sm-3 col-md-3 control-label">Reporter ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="reporterid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date" class="col-sm-3 col-md-3 control-label">Date</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="date" class="form-control" name="date"/>
                            </div>
                        </div>
        
                    </div>
                    <div class="col-sm-12 col-md-12 MT20 txt-center">
                        <div class="form-group row">
                            <input type="submit" class="btn btn-primary" value="Submit"/>
                            <input type="reset" class="btn btn-danger" value="Reset"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="result_block">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Log ID</th>
                            <th>Log Type</th>
                            <th>Task ID</th>
                            <th>Assignee ID</th>
                            <th>Reporter ID</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>create</td>
                            <td>Real Name</td>
                            <td>1</td>
                            <td>2</td>
                            <td>2014-07-11 23:59:59.000</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>


