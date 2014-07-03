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
            
            #change_assignee_popup .modal-dialog{
                width: 80%;
                margin: 0 auto;
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
                }
              });
            }
        </script>
    </head>
    <body>
        <div class="task-heading">
            <div class="task-id">13579</div>
            <div class="task-title"><h2>This is a task title</h2></div>
            <div class="task-creation-time">Created on 5/July/2015 9:30AM</div>
        </div>
        
        <div class="button-section">
            <button class="btn btn-default btn-primary"><span class="glyphicon glyphicon-play"></span> Start progress</button>
            <button class="btn btn-default btn-success"><span class="glyphicon glyphicon-ok"></span> Complete</button>
            <button class="btn btn-default btn-warning" onclick="update_prompt('Assign to...', 'assignee')"><span class="glyphicon glyphicon-user"></span> Assign</button>
        </div>
        
        <div class="task-basic-info task-info">
            <div class="IB W50">
                <h4 class="task-info-heading">Details</h4>
                <div class="info-block">
                    <div class="task-basic-info-label IB W30">Type</div>
                    <div class="task-basic-info-details IB">Bug</div>
                </div>
                <div class="info-block">
                    <div class="task-basic-info-label IB W30">Status</div>
                    <div class="task-basic-info-details IB">Active</div>
                </div>
                <div class="info-block">
                    <div class="task-basic-info-label IB W30">Priority</div>
                    <div class="task-basic-info-details IB">Top</div>
                </div>
            </div>
            <div class="IB W50">
                <h4 class="task-info-heading">People</h4>
                <div class="info-block">
                    <div class="task-basic-info-label IB W30">Asignee</div>
                    <div class="task-basic-info-details IB">Joseph</div>
                </div>
            </div>
        </div>
        <div class="task-desc-info task-info">
            <h4 class="task-info-heading">Description</h4>
            <p class="description">This is a description</p>
        </div>
        <div class="task-desc-info task-info">
            <h4 class="task-info-heading">Comments</h4>
            <div class="commentblock">
                <div class="commentblock-metadata">username comment - 13/Jun/2014 9:25AM</div>
                <div class="commentblock-comment">This is a comment!</div>
            </div>
            <div class="commentblock">
                <div class="commentblock-metadata">username comment - 13/Jun/2014 9:25AM</div>
                <div class="commentblock-comment">This is a comment!</div>
            </div>
            <div class="commentarea">
                <textarea class="form-control" rows="5"></textarea>
                <button class="btn btn-default btn-info MT10">Comment</button>
            </div>
        </div>
    </body>
</html>
