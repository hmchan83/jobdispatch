<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <script src="js/md5.js"></script>
        <link rel="stylesheet" href="css/user.css" />
        <style>
            label{
                color: #666666;
                font-weight: normal;
                font-style: italic;
            }
        </style>
        <script>
            function submitForm(){
                $("input[name='staffid']").val(${CurrentUser.staffID});
                hashPW();
            }
            
            function hashPW() {
                if ($('input[name="pwd"]').val().length !== 0) {
                    var hash = CryptoJS.MD5($('input[name="pwd"]').val());
                    $('input[name="pwd"]').val(hash);
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="template_jsp/header.jsp" flush="true">
            <jsp:param name="username" value="Joseph" />
        </jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 hidden-xs hidden-sm staff-container">
                    <jsp:include page="template_jsp/user.jsp" flush="true" />
                </div>
                <div class="col-md-7 staff-detail-container">
                    <form class="form-horizontal" role="form" action="editprofile" method="POST" onsubmit="submitForm()">
                        <div class="form-group">
                            <label for="staffid" class="col-sm-3 col-md-3 control-label">Staff ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="staffid" readonly required value="${CurrentUser.staffID}"/>
                            </div>
                        </div> 
                        <div class="form-group">
                            <label for="username" class="col-sm-3 col-md-3 control-label">UserName</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="username" readonly required value="${CurrentUser.userName}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-3 col-md-3 control-label">Password</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="password" class="form-control" name="pwd" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 col-md-3 control-label">Email</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="email" class="form-control" name="email" required value="${CurrentUser.eMail}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telno" class="col-sm-3 col-md-3 control-label">Tel No.</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="contactnumber" required value="${CurrentUser.tel}"/>
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
            </div>
        </div>
    </body>
</html>
