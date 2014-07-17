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
        <script>
            function delRole(roleid){
                $("#delRoleForm input[name='roleid']").val(roleid);
                $("#delRoleForm").submit();
            }
            
            function createRole(roleid, rolename){
                $("#createRoleForm input[name='roleid']").val(roleid);
                $("#createRoleForm input[name='rolename']").val(rolename);
                $("#createRoleForm").submit();
            }
            
            function createDept(deptid, deptname){
                $("#createDeptForm input[name='deptid']").val(deptid);
                $("#createDeptForm input[name='deptname']").val(deptname);
                $("#createDeptForm").submit();
            }
            
            function delDept(deptid){
                $("#delDeptForm input[name='deptid']").val(deptid);
                $("#delDeptForm").submit();
            }
        </script>
    </head>
    <body>
        <form id="createRoleForm" action="bo_structControl" method="POST" style="display: none;">
            <input type="hidden" name="roleid" />
            <input type="hidden" name="rolename" />
            <input type="hidden" name="create_role" value="1" />
        </form>
        <form id="delRoleForm" action="bo_structControl" method="POST" style="display: none;">
            <input type="hidden" name="roleid" />
            <input type="hidden" name="del_role" value="1" />
        </form>
        <form id="delDeptForm" action="bo_structControl" method="POST" style="display: none;">
            <input type="hidden" name="deptid" />
            <input type="hidden" name="del_dept" value="1" />
        </form>
        <form id="createDeptForm" action="bo_structControl" method="POST" style="display: none;">
            <input type="hidden" name="deptid" />
            <input type="hidden" name="deptname" />
            <input type="hidden" name="create_dept" value="1" />
        </form>
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
                                <td><input type="number" id="temp_deptid" /></td>
                                <td><input type="text" id="temp_deptname" /></td>
                                <td><button class="btn btn-default btn-warning" onclick="createDept($('#temp_deptid').val(), $('#temp_deptname').val())">create</button></td>
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
                                    <button class="btn btn-default btn-danger" onclick="delDept(<%=d.getKey().getDeptID()%>)">delete</button>
                                    <%}%>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h3>Edit Role</h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th data-defaultsort='asc'>Role ID</th>
                        <th>Role Title</th>
                        <th></th>
                        </thead>
                        <tfoot>
                            <tr>
                                <td><input type="number" id="temp_roleid"/></td>
                                <td><input type="text" id="temp_rolename"/></td>
                                <td><button class="btn btn-default btn-warning" onclick="createRole($('#temp_roleid').val(), $('#temp_rolename').val())">create</button></td>
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
                                    <button class="btn btn-default btn-danger" onclick="delRole(<%=r.getKey().getRoleID()%>)">delete</button>
                                    <% } %>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


