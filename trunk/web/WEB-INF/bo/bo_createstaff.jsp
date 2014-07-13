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
        </style>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 staff-detail-container">
                    <h3 class="txt-center MB20">Create Staff</h3>
                    <form class="form-horizontal" role="form" action="editprofile" method="POST" onsubmit="hashPW()">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 col-md-3 control-label">User Name</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="username" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="realname" class="col-sm-3 col-md-3 control-label">Real Name</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="realname" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="role" class="col-sm-3 col-md-3 control-label">Role</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="role" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="department" class="col-sm-3 col-md-3 control-label">Department</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="department" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 col-md-3 control-label">Email</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="email" class="form-control" name="email" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telno" class="col-sm-3 col-md-3 control-label">Tel No.</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="telno" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 col-md-3 control-label"></label>
                            <div class="col-sm-9 col-md-9">
                                <input type="submit" class="btn btn-primary" value="Submit"/>
                                <input type="reset" class="btn btn-danger" value="Reset"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </body>
</html>

