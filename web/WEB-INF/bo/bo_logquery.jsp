<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Query</title>
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

            td{
                vertical-align: middle !important;
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
                            <label for="logid" class="col-sm-3 col-md-3 control-label">Log ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="logid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="logtype" class="col-sm-3 col-md-3 control-label">Log Type</label>
                            <div class="col-sm-9 col-md-9">
                                <select name="logtype" class="form-control">
                                    <option value="" selected>all</option>
                                    <c:forEach items="${requestScope.logtypelist}" var="logtype">
                                    <option value="${logtype}">${logtype}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="taskid" class="col-sm-3 col-md-3 control-label">Task ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="taskid"/>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="assigneeid" class="col-sm-3 col-md-3 control-label">Assignee ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="assigneeid"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reporterid" class="col-sm-3 col-md-3 control-label">Reporter ID</label>
                            <div class="col-sm-9 col-md-9">
                                <input type="number" class="form-control" name="reporterid"/>
                            </div>
                        </div>       
                    </div>
                    <div class="col-sm-12 col-md-12 MT20 txt-center">
                        <div class="form-group row">
                            <input type="submit" class="btn btn-primary" value="Submit"/>
                            <input type="reset" class="btn btn-danger" value="Reset"/>
                        </div>
                    </div>
                </form>
            </div>
            <iframe class="result_block" src="" data-url="bo_logQueryResult">
            </iframe>
        </div>
        <%@include file="../template_jsp/footer-dark.jsp" %>
    </body>
</html>


