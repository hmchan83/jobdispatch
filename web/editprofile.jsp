<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="style_jsp/default_header_style.jsp" %>
        <link rel="stylesheet" href="css/user.css" />
        <style>
            .staff-detail-label{
                color: #666666;
                font-style: italic;
            }
            
            .staff-detail-change a{
                cursor: pointer;
            }
            
            .staff-detail-block{
                margin-bottom: 5px;
            }
        </style>
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
         <jsp:include page="template_jsp/header.jsp" flush="true">
            <jsp:param name="username" value="Joseph" />
        </jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3 hidden-xs hidden-sm staff-container">
                    <jsp:include page="template_jsp/user.jsp" flush="true">
                        <jsp:param name="name" value="Joseph Chong" />
                    </jsp:include>
                </div>
                <div class="col-md-7 staff-detail-container">
                    <div class="staff-detail-block block">
                        <div class="staff-detail-label IB W30">Password</div>
                        <div class="staff-detail-value IB W60">******</div>
                        <!--use "editable" attribute to decide whether show the change button or not-->
                        <div class="staff-detail-change IB"><a onclick="update_prompt('New Password', 'password');">change</a></div>
                    </div>
                    <div class="staff-detail-block block">
                        <div class="staff-detail-label IB W30">Email</div>
                        <div class="staff-detail-value IB W60">joseph@cityu.com.hk</div>
                        <!--use "editable" attribute to decide whether show the change button or not-->
                        <div class="staff-detail-change IB"><a onclick="update_prompt('New Email', 'email')">change</a></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
