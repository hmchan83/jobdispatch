<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <style>
            .advices{
                margin-top: 20px;
            }
            
            .stat-containter div{
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="template_jsp/header.jsp" flush="true">
            <jsp:param name="username" value="Joseph" />
        </jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-6 stat-container resolved">
                    <div class="resolved-graph stat-graph"></div>
                    <jsp:include page="template_jsp/num-stat.jsp" flush="true">
                        <jsp:param name="status" value="resolved"/>
                        <jsp:param name="type" value="priority" />
                    </jsp:include>
                    <jsp:include page="template_jsp/num-stat.jsp" flush="true">
                        <jsp:param name="status" value="resolved"/>
                        <jsp:param name="type" value="type" />
                    </jsp:include>
                    <jsp:include page="template_jsp/ppl-stat.jsp" flush="true">
                        <jsp:param name="status" value="resolved" />
                    </jsp:include>
                </div>
                <div class="col-sm-6 col-md-6 stat-container unresolved">
                    <div class="unresolved-graph stat-graph"></div>
                    <jsp:include page="template_jsp/num-stat.jsp" flush="true">
                        <jsp:param name="status" value="unresolved"/>
                        <jsp:param name="type" value="priority" />
                    </jsp:include>
                    <jsp:include page="template_jsp/num-stat.jsp" flush="true">
                        <jsp:param name="status" value="unresolved"/>
                        <jsp:param name="type" value="type" />
                    </jsp:include>
                    <jsp:include page="template_jsp/ppl-stat.jsp" flush="true">
                        <jsp:param name="status" value="unresolved" />
                    </jsp:include>
                </div> 
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12 advices-container">
                    <h3>advices</h3>
                    <div class="jobs-first-container advices table-responsive">
                        <div class="italic-heading FS18">work on these jobs first</div>
                        <table class="table table-hover">
                            <thead>
                                <th>Job ID</th>
                                <th>Job title</th>
                                <th>Priority</th>
                                <th>Unresolved for</th>
                            </thead>
                            <tr>
                                <td>1357</td>
                                <td>This is a title</td>
                                <td>High</td>
                                <td>56 days</td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-6 col-md-6 PL0">
                        <jsp:include page="template_jsp/advice_joballocation.jsp" flush="true">
                            <jsp:param name="type" value="stop" />
                        </jsp:include>
                    </div>
                    <div class="col-sm-6 col-md-6 PR0">
                        <jsp:include page="template_jsp/advice_joballocation.jsp" flush="true">
                            <jsp:param name="type" value="give" />
                        </jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
