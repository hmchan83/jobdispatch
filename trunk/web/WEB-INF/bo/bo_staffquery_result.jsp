<%@page import="bean.Staff"%>
<%@page import="java.util.ArrayList"%>
<%ArrayList<Staff> staffs = (ArrayList<Staff>) request.getAttribute("result");%>
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
                    <% for (Staff s : staffs) {%>
                    <tr class="<%if(s.isRetired()){%>danger<%}%>">
                        <td><%=s.getStaffID()%></td>
                        <td><%=s.getUserName()%></td>
                        <td><%=s.getRealName()%></td>
                        <td><%=s.getRole()%></td>
                        <td><%=s.getDept()%></td>
                        <td><%=s.geteMail()%></td>
                        <td><%=s.getTel()%></td>
                        <%if(!s.isRetired()){%>
                        <td><button class="btn btn-default btn-danger retire_btn" onclick="retireStaff(<%=s.getStaffID()%>);">RETIRE</button></td>
                        <%}else{%>
                        <td><button class="btn btn-default btn-success hire_btn" onclick="hireStaff(<%=s.getStaffID()%>);">HIRE</button></td>
                        <%}%>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
