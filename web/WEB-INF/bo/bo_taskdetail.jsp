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
        <style>
            td{
                vertical-align: middle !important;
            }
        </style>
        <script type="text/javascript">
            function createType(tasktypetitle) {
                $("#createTypeForm input[name='typename']").val(tasktypetitle);
                $("#createTypeForm").submit();
            }

            function delType(tasktypeid) {
                $("#delTypeForm input[name='typeid']").val(tasktypeid);
                $("#delTypeForm").submit();
            }

        </script>
    </head>
    <body>
        <form id="createTypeForm" action="bo_taskDetail" method="POST" style="display: none;">
            <input type="hidden" name="typename" />
            <input type="hidden" name="create_type" value="1" />
        </form>
        <form id="delTypeForm" action="bo_taskDetail" method="POST" style="display: none;">
            <input type="hidden" name="typeid" />
            <input type="hidden" name="del_type" value="1" />
        </form>
        <jsp:include page="../template_jsp/bo_header.jsp" flush="true" />
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h3>Edit Task Type</h3>
                    <table class="table table-hover sortable">
                        <thead>
                        <th data-defaultsort='asc'>Task Type ID</th>
                        <th>Task Type</th>
                        <th></th>
                        </thead>
                        <tfoot>                            
                            <tr>
                                <td> </td>
                                <td><input type="text" id="tasktypetitle" /></td>
                                <td><input type="button" class="btn btn-default btn-warning" value="create"  onclick="createType($('#tasktypetitle').val())"></td>
                            </tr> 
                        </tfoot>
                        <tbody>
                            <c:forEach items="${requestScope.typemap}" var="type">
                            <tr>
                                <td>${type.key.typeID}</td>
                                <td>${type.key.typeName}</td>
                                <!--if the type is being used by certain task, delete button is not allowed to show-->
                                <td>
                                    <c:if test="${type.value}">
                                    <input type="submit" class="btn btn-default btn-danger" value="delete" onclick="delType('${type.key.typeID}')">
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


