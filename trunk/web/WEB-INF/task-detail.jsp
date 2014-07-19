<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="task" type="bean.Task" scope="request"/>
<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<c:set var="btntype" value="${requestScope.buttontype}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_style.jsp"%>
        <style>
            body *{
                margin: 0px;
                padding: 0px;
            }

            .task-id{font-size: 16px;}

            .button-section{
                margin-top: 30px;
            }

            .button-section button{
                margin-bottom: 5px;
            }

            .task-info{
                margin-top: 30px;
            }

            .task-basic-info div{
                vertical-align:top;
            }

            h4.task-info-heading{
                width: 90%;
                padding-bottom: 5px;
                margin-bottom: 10px;
                border-bottom: 1px solid #E6E6E6;
                font-style: italic;
            }

            .info-block{
                margin-bottom: 5px;
            }

            .task-basic-info-label{
                color: #666666;
            }

            .commentblock{
                margin-bottom: 30px;
            }

            .commentblock-metadata, .task-creation-time{
                margin-bottom: 5px;
                font-style: italic;
                color: #666666;  
            }

            .task-creation-time{
                margin-top: 5px;
            }

            .modal-dialog{
                width: 80%;
                margin: 0 auto;
                padding-top: 70px;
            }

            .control-label{
                padding-top: 7px;
            }
        </style>
        <link href="css/modalstyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/pnotify.custom.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/pnotify.custom.min.js"></script>
        <script>
            var assign_success = "${requestScope.assign_success}";
            $(document).ready(function() {
                if (assign_success == "true")
                    new PNotify({
                        title: 'Task Assigned Successfully',
                        text: '',
                        type: 'success'
                    });
                else if(assign_success == "false")
                    new PNotify({
                        title: "Task Assigned Fail",
                        text: 'You put the wrong assignee username',
                        type: 'error'
                    });
            });
            function update_prompt(question, field) {
                bootbox.prompt(question, function(result) {
                    if (result === null) {
                    } else {
                        changeStatus("Assigned", result);
                    }
                });
            }
            function changeStatus(newStatus, assignee) {
                document.getElementById("NewStatus").value = newStatus;
                if (assignee != '')
                    document.getElementById("assigneename").value = assignee;
                document.getElementById('statuschange').submit();
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="task-heading">
                <div class="task-id"></div>
                <div class="task-title"><h2>${task.taskID} - ${task.taskName}</h2></div>
                <div class="task-creation-time">Created on ${task.date}</div>
            </div>

            <c:if test="${requestScope.task.assignee.userName eq CurrentUser.userName}">
                <div class="button-section">
                    <form action="taskdetail?action=change&taskid=${task.taskID}" method="post" id="statuschange">
                        <input type="hidden" value="" name="NewStatus" id="NewStatus" />                        
                        <input type="hidden" value="${CurrentUser.userName}" name="assigneename" id="assigneename" />
                        <input type="hidden" value="${CurrentUser.userName}" name="reportername" id="reportername" />
                        <c:choose>
                            <c:when test="${btntype eq 'assigned'}">
                                <button class="btn btn-default btn-primary" type="button" value="Started" name="newstatus" onclick="changeStatus('Started', '')"><span class="glyphicon glyphicon-play"></span> Start progress</button>
                                <button class="btn btn-default btn-warning" type="button" onclick="update_prompt('Assign to...', 'assignee')"><span class="glyphicon glyphicon-user"></span> Assign</button>
                            </c:when>
                            <c:when test="${btntype eq 'started'}">
                                <button class="btn btn-default btn-success" type="button" value="Completed" name="newstatus" onclick="changeStatus('Completed', '')"><span class="glyphicon glyphicon-ok"></span> Complete</button>
                            </c:when>  
                            <c:when test="${btntype eq 'completed'}">
                                <button class="btn btn-default btn-danger" type="button"  onclick="changeStatus('Closed', '')"><span class="glyphicon glyphicon-remove"></span> Close</button>
                            </c:when>
                            <c:when test="${btntype eq 'reported'}">
                                <button class="btn btn-default btn-info" type="button" onclick="changeStatus('Reported', '')"><span class="glyphicon glyphicon-hand-up"></span> Report</button>
                            </c:when>
                        </c:choose>
                    </form>
                </div>
            </c:if>

            <div class="task-basic-info task-info">
                <div class="IB W50">
                    <h4 class="task-info-heading">Details</h4>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Type</div>
                        <div class="task-basic-info-details IB">${task.taskType}</div>
                    </div>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Status</div>
                        <div class="task-basic-info-details IB">${task.status}</div>
                    </div>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Priority</div>
                        <div class="task-basic-info-details IB">${task.priority}</div>
                    </div>
                </div>
                <div class="IB W50">
                    <h4 class="task-info-heading">People</h4>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Assignee</div>
                        <div class="task-basic-info-details IB">${task.assignee}</div>
                    </div>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Reporter</div>
                        <div class="task-basic-info-details IB">${task.reporter}</div>
                    </div>
                </div>
            </div>
            <div class="task-desc-info task-info">
                <h4 class="task-info-heading">Description</h4>
                <p class="description">${task.description}</p>
            </div>
            <div class="task-desc-info task-info">
                <h4 class="task-info-heading">Comments</h4>
                <c:if test="${not empty requestScope.commentList and fn:length(requestScope.commentList) gt 0}">
                    <c:forEach items="${requestScope.commentList}" var="comment">
                        <div class="commentblock">
                            <div class="commentblock-metadata">${comment.commenter} - ${comment.date}</div>
                            <div class="commentblock-comment">${comment.comment}</div>
                        </div>
                    </c:forEach>
                </c:if>
                <form action="taskdetail?action=comment&taskid=${task.taskID}" method="post">
                    <div class="commentarea">
                        <textarea class="form-control" rows="5" name="com_content"></textarea>
                        <button class="btn btn-default btn-info MT10" onclick="this.form.submit()">Comment</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
