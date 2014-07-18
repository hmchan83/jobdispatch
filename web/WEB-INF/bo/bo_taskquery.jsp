<%@page import="bean.Status"%>
<%@page import="bean.Priority"%>
<%@page import="bean.TaskType"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ArrayList<TaskType> types = (ArrayList<TaskType>) request.getAttribute("tasktype");%>
<%ArrayList<Priority> priority = (ArrayList<Priority>) request.getAttribute("taskpriority");%>
<%ArrayList<Status> status = (ArrayList<Status>) request.getAttribute("taskstatus");%>
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
            function changeURL(){
               var url = $(".result_block").data("url")+"?";
               $(".form-horizontal .col-md-6 input").each(function(){
                  url += $(this).attr("name") + "=" + $(this).val() + "&"; 
               });
               $(".form-horizontal .col-md-6 select").each(function(){
                  url += $(this).attr("name") + "=" + $(this).val() + "&"; 
               });
               $(".result_block").attr("src", url);
               return false
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
                            <label for="taskid" class="col-sm-3 col-md-3 control-label">Task ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="taskid" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tasktitle" class="col-sm-3 col-md-3 control-label">Task Title</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="text" class="form-control" name="taskname" />
                            </div>
                        </div> 
                        <div class="form-group">
                            <label for="tasktype" class="col-sm-3 col-md-3 control-label">Task Type</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="typeid" class="form-control">
                                    <option value="" selected>All</option>
                                    <%for (TaskType type : types) {%>
                                    <option value="<%=type.getTypeID()%>"><%=type%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div> 
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="taskpriority" class="col-sm-3 col-md-3 control-label">Task Priority</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="priorityid" class="form-control">
                                    <option value="" selected>All</option>
                                    <%for (Priority p : priority) {%>
                                    <option value="<%=p.getPriorityID()%>"><%=p%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="taskstatus" class="col-sm-3 col-md-3 control-label">Task Status</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="statusid" class="form-control">
                                    <option value="" selected>All</option>
                                    <%for (Status s : status) {%>
                                    <option value="<%=s.getStatusID()%>"><%=s%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="assigneeid" class="col-sm-3 col-md-3 control-label">Assignee ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="assigneeid" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reporterid" class="col-sm-3 col-md-3 control-label">Reporter ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="reporterid" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 MT20 txt-center">
                        <div class="form-group row">
                            <input type="submit" class="btn btn-primary" value="Submit">
                            <input type="reset" class="btn btn-danger" value="Reset">
                        </div>
                    </div>
                </form>
            </div>
            <iframe class="result_block" src="" data-url="bo_taskQueryResult">
            </iframe>
        </div>
    </body>
</html>


