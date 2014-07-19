<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../style_jsp/default_style.jsp" %>
        <style>
            td{
                vertical-align: middle !important;
            }
        </style>
        <script>      
            function retireStaff(staffid){
                $("#pplmanage input[name='retire']").attr("value", staffid);
                $("#pplmanage").submit();
            }
            
            function hireStaff(staffid){
                $("#pplmanage input[name='hire']").attr("value", staffid);
                $("#pplmanage").submit();
            }
        </script>
    </head>
    <body>
        <div class="result_block">
            <form action="bo_staffQueryResult" method="POST" id="pplmanage">
                <input type="hidden" name="retire" value="" />
                <input type="hidden" name="hire" value="" />
            </form>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Staff ID</th>
                        <th>User Name</th>
                        <th>Real Name</th>
                        <th>Role</th>
                        <th>Department</th>
                        <th>Email</th>
                        <th>Tel No</th>
                        <th></th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.result}" var="s">
                        <tr class="<c:if test="${s.retired}">danger</c:if>" style="cursor: pointer;">
                        <td>${s.staffID}</td>
                        <td onclick="window.open('bo_editStaff?staffid=${s.staffID}')">${s.userName}</td>
                        <td onclick="window.open('bo_editStaff?staffid=${s.staffID}')">${s.realName}</td>
                        <td>${s.role}</td>
                        <td>${s.dept}</td>
                        <td>${s.eMail}</td>
                        <td>${s.tel}</td>
                        <c:choose>
                            <c:when test="${s.retired}">
                                <td><button class="btn btn-default btn-success hire_btn" onclick="hireStaff(${s.staffID});">HIRE</button></td>
                            </c:when>
                            <c:otherwise>
                                <td><button class="btn btn-default btn-danger retire_btn" onclick="retireStaff(${s.staffID});">RETIRE</button></td>
                            </c:otherwise>
                        </c:choose>   
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
