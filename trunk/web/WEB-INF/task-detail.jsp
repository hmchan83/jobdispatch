<%@page import="bean.Task"%>
<%@page import="bean.LoginStaff"%>
<%@page import="bean.Comment"%>
<%@page import="java.util.ArrayList"%>
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
        <script>
            function update_prompt(question, field){
                bootbox.prompt(question, function(result) {                
                if (result === null) {                                                                       
                } else { 
                    changeStatus("Assigned",result);
                }
              });
            }
            function changeStatus(newStatus,assignee){
                document.getElementById("NewStatus").value=newStatus;
                if(assignee!='')
                document.getElementById("assigneeid").value=assignee;
                document.getElementById('statuschange').submit();
            }
        </script>
    </head>
    <body>
        <jsp:useBean id="task" type="bean.Task" scope="request"/>
        <div class="container">
            <div class="task-heading">
                <div class="task-id"></div>
                <div class="task-title"><h2><jsp:getProperty name="task" property="taskID" /> - <jsp:getProperty name="task" property="taskName" /></h2></div>
                <div class="task-creation-time">Created on <jsp:getProperty name="task" property="date" /></div>
            </div>
            
            <jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
            <% if(task.getAssignee().getUserName().equals(CurrentUser.getUserName())){ %>
                <div class="button-section">
                    <form action="taskdetail?action=change&taskid=<jsp:getProperty name="task" property="taskID" />" method="post" id="statuschange">
                        <input type="hidden" value="" name="NewStatus" id="NewStatus" />                        
                        <input type="hidden" value="<jsp:getProperty name="CurrentUser" property="userName" />" name="assigneeid" id="assigneeid" />
                        <input type="hidden" value="<jsp:getProperty name="CurrentUser" property="userName" />" name="reporterid" id="reporterid" />
                        <% if(task.getStatus().getStatusID()==2){ //Assigned %>
                        <button class="btn btn-default btn-primary" type="button" value="Started" name="newstatus" onclick="changeStatus('Started','')"><span class="glyphicon glyphicon-play"></span> Start progress</button>
                        <button class="btn btn-default btn-warning" type="button" onclick="update_prompt('Assign to...', 'assignee')"><span class="glyphicon glyphicon-user"></span> Assign</button>
                        <% }else if (task.getStatus().getStatusID()==3){ //Started %>
                        <button class="btn btn-default btn-success" type="button" value="Completed" name="newstatus" onclick="changeStatus('Completed','')"><span class="glyphicon glyphicon-ok"></span> Complete</button>
                        <% }else if  ((task.getStatus().getStatusID()==4 || task.getStatus().getStatusID()==8) && task.getAssignee().getUserName().equals(task.getReporter().getUserName())){ //Completed %>
                        <button class="btn btn-default btn-danger btn-lg" type="button"  onclick="changeStatus('Closed','')"><span class="glyphicon glyphicon-remove"></span> Closed</button>
                        <% }else if (task.getStatus().getStatusID()==4 || task.getStatus().getStatusID()==8){ // %>
                        <button class="btn btn-default btn-info" type="button" onclick="changeStatus('Reported','')"><span class="glyphicon glyphicon-hand-up"></span> Report</button>
                        <% }%>

                    </form>
                </div>
            <% } %>

            <div class="task-basic-info task-info">
                <div class="IB W50">
                    <h4 class="task-info-heading">Details</h4>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Type</div>
                        <div class="task-basic-info-details IB"><jsp:getProperty name="task" property="taskType" /></div>
                    </div>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Status</div>
                        <div class="task-basic-info-details IB"><jsp:getProperty name="task" property="status" /></div>
                    </div>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Priority</div>
                        <div class="task-basic-info-details IB"><jsp:getProperty name="task" property="priority" /></div>
                    </div>
                </div>
                <div class="IB W50">
                    <h4 class="task-info-heading">People</h4>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Assignee</div>
                        <div class="task-basic-info-details IB"><jsp:getProperty name="task" property="assignee" /></div>
                    </div>
                    <div class="info-block">
                        <div class="task-basic-info-label IB W30">Reporter</div>
                        <div class="task-basic-info-details IB"><jsp:getProperty name="task" property="reporter" /></div>
                    </div>
                </div>
            </div>
            <div class="task-desc-info task-info">
                <h4 class="task-info-heading">Description</h4>
                <p class="description"><jsp:getProperty name="task" property="description" /></p>
            </div>
            <div class="task-desc-info task-info">
                <h4 class="task-info-heading">Comments</h4>
                <% ArrayList<Comment> commentList = (ArrayList<Comment>)request.getAttribute("commentList"); 
                if(commentList!=null && commentList.size()>0)
                for(Comment c : commentList){ %>
                <div class="commentblock">
                    <div class="commentblock-metadata"><%=c.getCommenter()%> - <%=c.getDate()%></div>
                    <div class="commentblock-comment"><%=c.getComment()%></div>
                </div>
                <% }%>
                <form action="taskdetail?action=comment&taskid=<jsp:getProperty name="task" property="taskID" />" method="post">
                <div class="commentarea">
                    <textarea class="form-control" rows="5" name="com_content"></textarea>
                    <button class="btn btn-default btn-info MT10" onclick="this.form.submit()">Comment</button>
                </div>
                </form>
            </div>
        </div>
    </body>
</html>
