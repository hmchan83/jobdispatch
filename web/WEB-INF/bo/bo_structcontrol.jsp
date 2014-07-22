<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Structure Control</title>
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
            
            function createRole(rolename){
                $("#createRoleForm input[name='rolename']").val(rolename);
                $("#createRoleForm").submit();
            }
            
            function createDept(deptname){
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
                                <td></td>
                                <td><input type="text" id="temp_deptname" /></td>
                                <td><button class="btn btn-default btn-warning" onclick="createDept($('#temp_deptname').val())">create</button></td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <c:forEach items="${requestScope.deptmap}" var="dept">
                            <tr>
                                <td>${dept.key.deptID}</td>
                                <td>${dept.key}</td>
                                <!--if there are employees in certain department, can't delete department, delete button is not allowed to show-->
                                <td>
                                    <c:if test="${dept.value}">
                                    <button class="btn btn-default btn-danger" onclick="delDept(${dept.key.deptID})">delete</button>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
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
                                <td></td>
                                <td><input type="text" id="temp_rolename"/></td>
                                <td><button class="btn btn-default btn-warning" onclick="createRole($('#temp_rolename').val())">create</button></td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <c:forEach items="${requestScope.rolemap}" var="role">
                            <tr>
                                <td>${role.key.roleID}</td>
                                <td>${role.key}</td>
                                <!--if there are employees in certain role, can't delete role, delete button is not allowed to show-->
                                <td>
                                    <c:if test="${role.value}">
                                    <button class="btn btn-default btn-danger" onclick="delRole(${role.key.roleID})">delete</button>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="../template_jsp/footer-dark.jsp" %>
    </body>
</html>


