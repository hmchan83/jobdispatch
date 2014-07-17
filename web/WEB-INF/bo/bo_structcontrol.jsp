<%@page import="bean.Department"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bean.UserRole"%>
<%HashMap<UserRole, Boolean> rolemap = (HashMap<UserRole, Boolean>) request.getAttribute("rolemap");%>
<%HashMap<Department, Boolean> deptmap = (HashMap<Department, Boolean>) request.getAttribute("deptmap");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_header_style.jsp" %>
        <script src="js/moment.min.js"></script>
        <script src="js/bootstrap-sortable.js"></script>
        <link href="css/bootstrap-sortable.css" rel="stylesheet" type="text/css" />
        <style>
            td{
                height: 51px;
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
                    <table class="table table-hover sortable">
                        <thead>
                        <th data-defaultsort='asc'>Department ID</th>
                        <th>Department Title</th>
                        <th></th>
                        </thead>
                        <tfoot>
                            <tr>
                                <td><input type="number" name="departmentid" /></td>
                                <td><input type="text" name="departmenttitle" /></td>
                                <td><input type="submit" class="btn btn-default btn-warning" value="create"></td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <%for (Map.Entry<Department, Boolean> d : deptmap.entrySet()) {%>
                            <tr>
                                <td><%=d.getKey().getDeptID()%></td>
                                <td><%=d.getKey()%></td>
                                <!--if there are employees in certain department, can't delete department, delete button is not allowed to show-->
                                <td>
                                    <%if (d.getValue() == Boolean.TRUE) {%>
                                    <input type="submit" class="btn btn-default btn-danger" value="delete">
                                    <%}%>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h3>Edit Role</h3>
                    <form action="bo_structControl" method="POST">
                        <table class="table table-hover sortable">
                            <thead>
                            <th data-defaultsort='asc'>Role ID</th>
                            <th>Role Title</th>
                            <th></th>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td><input type="number" name="roleid" /></td>
                                    <td><input type="text" name="roletitle" /></td>
                                    <td><input type="submit" class="btn btn-default btn-warning" value="create"></td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <%for (Map.Entry<UserRole, Boolean> r : rolemap.entrySet()) {%>
                                <tr>
                                    <td><%=r.getKey().getRoleID()%></td>
                                    <td><%=r.getKey()%></td>
                                    <!--if there are employees in certain role, can't delete role, delete button is not allowed to show-->
                                    <td>
                                        <%if (r.getValue() == Boolean.TRUE) {%>
                                        <input type="submit" class="btn btn-default btn-danger" value="delete">
                                        <% } %>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


