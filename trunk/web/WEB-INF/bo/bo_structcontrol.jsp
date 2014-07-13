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
                    <h3>Edit Department</h3>
                    <table class="table table-hover">
                        <thead>
                            <th>Department ID</th>
                            <th>Department Title</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Retest</td>
                                <!--if there are employees in certain department, can't delete department, delete button is not allowed to show-->
                                <td><input type="submit" class="btn btn-default btn-danger" value="delete"></td>
                            </tr>
                            <tr>
                                <td><input type="number" name="departmentid" /></td>
                                <td><input type="text" name="departmenttitle" /></td>
                                <td><input type="submit" class="btn btn-default btn-warning" value="create"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h3>Edit Role</h3>
                    <table class="table table-hover">
                        <thead>
                            <th>Role ID</th>
                            <th>Role Title</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Role</td>
                                <!--if there are employees in certain role, can't delete role, delete button is not allowed to show-->
                                <td><input type="submit" class="btn btn-default btn-danger" value="delete"></td>
                            </tr>
                            <tr>
                                <td><input type="number" name="roleid" /></td>
                                <td><input type="text" name="roletitle" /></td>
                                <td><input type="submit" class="btn btn-default btn-warning" value="create"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


