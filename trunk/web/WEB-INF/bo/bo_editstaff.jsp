<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="CurrentStaff" class="bean.LoginStaff" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_style.jsp" %>
        <script src="js/md5.js"></script>
        <link rel="stylesheet" href="css/user.css" />
        <style>
            label{
                color: #666666;
                font-weight: normal;
                font-style: italic;
            }

            .container{
                margin-top: 30px;
            }
        </style>
        <script>
            function hashPW() {
                if ($('input[name="pwd"]').val().length !== 0) {
                    var hash = CryptoJS.MD5($('input[name="pwd"]').val());
                    $('input[name="pwd"]').val(hash);
                } else {
                    $('input[name="pwd"]').val("");
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <form class="form-horizontal" role="form" action="bo_editStaff" method="POST" onsubmit="hashPW()">
                <div class="form-group">
                    <label for="staffid" class="col-sm-3 col-md-3 control-label">Staff ID</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="text" class="form-control" name="staffid" readonly required value="${CurrentStaff.staffID}"/>
                    </div>
                </div> 
                <div class="form-group">
                    <label for="username" class="col-sm-3 col-md-3 control-label">User Name</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="text" class="form-control" name="username" readonly required value="${CurrentStaff.userName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="realname" class="col-sm-3 col-md-3 control-label">Real Name</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="text" class="form-control" name="realname" required value="${CurrentStaff.realName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="pwd" class="col-sm-3 col-md-3 control-label">Password</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="password" class="form-control" name="pwd" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="roleid" class="col-sm-3 col-md-3 control-label">Role</label>
                    <div class="col-sm-9 col-md-9">
                        <select name="roleid" class="form-control">
                            <option value="">All</option>
                            <c:forEach items="${requestScope.userrole}" var="role">   
                                <option value="${role.roleID}" <c:if test="${CurrentStaff.role.roleID == role.roleID}"><c:out value="selected" /></c:if>>
                                    ${role}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="deptid" class="col-sm-3 col-md-3 control-label">Department</label>
                    <div class="col-sm-9 col-md-9">
                        <select name="deptid" class="form-control">
                            <option value="">All</option>
                            <c:forEach items="${requestScope.departments}" var="dept">
                                <option value="${dept.deptID}" <c:if test="${CurrentStaff.dept.deptID == dept.deptID}"><c:out value="selected" /></c:if>>
                                    ${dept}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 col-md-3 control-label">Email</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="email" class="form-control" name="email" value="${CurrentStaff.eMail}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactnumber" class="col-sm-3 col-md-3 control-label">Tel No.</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="number" class="form-control" name="contactnumber" value="${CurrentStaff.tel}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 col-md-3 control-label"></label>
                    <div class="col-sm-9 col-md-9">
                        <input type="submit" class="btn btn-primary" value="Submit"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
