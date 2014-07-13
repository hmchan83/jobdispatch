<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_header_style.jsp" %>
        <style>
            td{
                vertical-align: middle !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h3>Edit Task Type</h3>
                    <table class="table table-hover">
                        <thead>
                            <th>Task Type ID</th>
                            <th>Task Type</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>HTML_Coding</td>
                                <!--if the type is being used by certain task, delete button is not allowed to show-->
                                <td><input type="submit" class="btn btn-default btn-danger" value="delete"></td>
                            </tr>
                            <tr>
                                <td><input type="number" name="tasktypeid" /></td>
                                <td><input type="text" name="tasktypetitle" /></td>
                                <td><input type="submit" class="btn btn-default btn-warning" value="Create"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h3>Edit Task Status</h3>
                    <table class="table table-hover">
                        <thead>
                            <th>Task Status ID</th>
                            <th>Task Status</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>New</td>
                                <!--if the status is being used by certain task, delete button is not allowed to show-->
                                <td><input type="submit" class="btn btn-default btn-danger" value="delete"></td>
                            </tr>
                            <tr>
                                <td><input type="number" name="taskstatusid" /></td>
                                <td><input type="text" name="taskstatustitle" /></td>
                                <td><input type="submit" class="btn btn-default btn-warning" value="Create"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


