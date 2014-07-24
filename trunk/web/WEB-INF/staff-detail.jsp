<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="staff" class="bean.Staff" scope="request" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="style_jsp/default_style.jsp"%>
        <style>
            #staff_photo{
                width: 100px;
                border: 4px #F5F5F5 solid;
            }

            .staff-detail-block .row{
                height: 35px;
            }
        </style>
        <title>Staff Detail - ${staff.realName}</title>
    </head>
    <body class="PT20">
        <div class="container">
            <div class="row">
                <div class="col-md-5 txt-right italic-heading">
                    <img class="img-circle" id="staff_photo" src="img/staffphoto/${staff.staffID}.jpg" onerror="this.src='img/staffphoto/default.jpg'" />
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-6">
                    <div class="row">
                        <h2>${staff.realName}</h2>
                    </div>
                    <div class="row">
                        <h4 class="italic-heading">${staff.role} Of ${staff.dept}</h4>
                    </div>
                </div>
            </div>
            <div class="row PT20 staff-detail-block">
                <div class="12">
                    <div class="row">
                        <div class="col-md-5 txt-right italic-heading" >staff id</div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">${staff.staffID}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 txt-right italic-heading" >username</div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">${staff.userName}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 txt-right italic-heading" >tel no.</div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">${staff.tel}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 txt-right italic-heading" >email</div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">${staff.eMail}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 txt-right italic-heading" ></div>
                        <div class="col-md-1"></div>
                        <div class="col-md-6">${staff.retired?"retired":"not yet retired"}</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
