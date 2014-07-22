<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            .result_block{
                border: none;
                width: 100%;
                min-height: 100%;
            }
        </style>
        <script>
            function changeURL() {
                var url = $(".result_block").data("url") + "?";
                $(".form-horizontal .col-md-6 input").each(function() {
                    url += $(this).attr("name") + "=" + $(this).val() + "&";
                });
                $(".form-horizontal .col-md-6 select").each(function() {
                    url += $(this).attr("name") + "=" + $(this).val() + "&";
                });
                $(".result_block").attr("src", url);
                return false;
            }
        </script>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="filter_block MB20 PT20 row">
                <form class="form-horizontal" role="form" onsubmit="return changeURL()">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="staffid" class="col-sm-3 col-md-3 control-label">Staff ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="staffid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username" class="col-sm-3 col-md-3 control-label">User Name</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="username"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="realname" class="col-sm-3 col-md-3 control-label">Real Name</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="realname"/>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email" class="col-sm-3 col-md-3 control-label">Email</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="email" class="form-control" name="email"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="roleid" class="col-sm-3 col-md-3 control-label">Role</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="roleid" class="form-control">
                                    <option value="">All</option>
                                    <c:forEach items="${requestScope.userrole}" var="role">   
                                        <option value="${role.roleID}">${role}</option>
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
                                        <option value="${dept.deptID}">${dept}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="contactnumber" class="col-sm-3 col-md-3 control-label">Tel No.</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="contactnumber"/>
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
            <iframe class="result_block" src="" data-url="bo_staffQueryResult">
            </iframe>
        </div>
        <%@include file="../template_jsp/footer-dark.jsp" %>
    </body>
</html>


