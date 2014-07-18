<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.TaskType"%>
<%HashMap<TaskType, Boolean> tasktype = (HashMap<TaskType, Boolean>) request.getAttribute("tasktype");%>
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
    </head>
    <body>
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
                        <tfoot>                            <tr>
                                <td><input type="number" name="tasktypeid" /></td>
                                <td><input type="text" name="tasktypetitle" /></td>
                                <td><input type="submit" class="btn btn-default btn-warning" value="create"></td>
                            </tr>  </tfoot>
                        <tbody>
                            <% for (Map.Entry<TaskType, Boolean> t : tasktype.entrySet()) { %>
                            <tr>
                                <td><%=t.getKey().getTypeID()%></td>
                                <td><%=t.getKey().getTypeName()%></td>
                                <!--if the type is being used by certain task, delete button is not allowed to show-->
                                <td>
                                    <%if (t.getValue() == Boolean.TRUE) {%>
                                    <input type="submit" class="btn btn-default btn-danger" value="delete">
                                    <%}%></td>
                            </tr>
                            <% } %>                          
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>


