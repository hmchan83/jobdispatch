<%@page import="bean.LoginStaff"%>
<%@page import="bean.UserRole"%>
<%@page import="bean.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="currentStaff" class="bean.LoginStaff" scope="request" />
<%ArrayList<UserRole> roles = (ArrayList<UserRole>) request.getAttribute("userrole");%>
<%ArrayList<Department> departments = (ArrayList<Department>) request.getAttribute("departments");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_style.jsp" %>
        <script src="http://crypto-js.googlecode.com/svn/tags/3.1.2/build/rollups/md5.js"></script>
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
                }else{
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
                        <input type="text" class="form-control" name="staffid" readonly required value="<jsp:getProperty name="currentStaff" property="staffID" />"/>
                    </div>
                </div> 
                <div class="form-group">
                    <label for="username" class="col-sm-3 col-md-3 control-label">User Name</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="text" class="form-control" name="username" readonly required value="<jsp:getProperty name="currentStaff" property="userName" />"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="realname" class="col-sm-3 col-md-3 control-label">Real Name</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="text" class="form-control" name="realname" required value="<jsp:getProperty name="currentStaff" property="realName" />"/>
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
                            <%for (UserRole ur : roles) {%>
                            <option value="<%=ur.getRoleID()%>" <%if(((LoginStaff)request.getAttribute("currentStaff")).getRole().getRoleID()==ur.getRoleID()){%>selected<%}%>><%=ur%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="deptid" class="col-sm-3 col-md-3 control-label">Department</label>
                    <div class="col-sm-9 col-md-9">
                        <select name="deptid" class="form-control">
                            <option value="">All</option>
                            <%for (Department d : departments) {%>
                            <option value="<%=d.getDeptID()%>" <%if(((LoginStaff)request.getAttribute("currentStaff")).getDept().getDeptID()==d.getDeptID()){%>selected<%}%>><%=d%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 col-md-3 control-label">Email</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="email" class="form-control" name="email" value="<jsp:getProperty name="currentStaff" property="eMail" />"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactnumber" class="col-sm-3 col-md-3 control-label">Tel No.</label>
                    <div class="col-sm-9 col-md-9">
                        <input type="number" class="form-control" name="contactnumber" value="<jsp:getProperty name='currentStaff' property='tel' />"/>
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
