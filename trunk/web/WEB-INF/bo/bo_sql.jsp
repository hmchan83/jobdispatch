<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script>
            function exeQuery() {
                $("#sql_form input[name='mode']").val("query");
                $("#sql_form").submit();
            }

            function exeUpdate() {
                $("#sql_form input[name='mode']").val("update");
                $("#sql_form").submit();
            }
        </script>
    </head>
    <body>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="jumbotron row">
                <form action="bo_sql" method="POST" id="sql_form">
                    <h2>SQL injection</h2>
                    <textarea name="sql" placeholder="Insert your SQL here" class="MT15 W100"></textarea>
                    <input type="hidden" name="mode" />
                    <div class="btngp MT15 txt-center">
                        <button class="btn btn-default btn-primary" onclick="exeQuery()"><span class="glyphicon glyphicon-search"></span> Execute Query</button>
                        <button class="btn btn-default btn-warning" onclick="exeUpdate()"><span class="glyphicon glyphicon-pencil"></span> Execute Update</button>
                        <input type="reset" class="btn btn-default btn-danger" value="Reset">
                    </div>
                </form>
            </div>
            <div class="row fill">
                <c:if test="${not empty requestScope.result}">
                    <table class="table table-hover sortable">
                        <thead>
                            <c:forEach items="${requestScope.result[0]}" var="heading">
                            <th>${heading}</th>
                            </c:forEach>
                        </thead>
                        <tbody>
                            <c:forEach begin="1" items="${requestScope.result}" var="row">
                                <tr>
                                    <c:forEach items="${row}" var="data">
                                        <td>${data}</td>
                                    </c:forEach>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${not empty requestScope.update_result}">
                    ${requestScope.update_result} row affected
                </c:if>
            </div>
        </div>
        <%@include file="../template_jsp/footer-dark.jsp" %>
    </body>
</html>
