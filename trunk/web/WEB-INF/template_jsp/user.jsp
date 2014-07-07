<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<div class="staff-photo block">
    <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="username">
</div>
<div class="staff-data block">
    <div class="staff-name block txt-center">
        <h2><jsp:getProperty name="CurrentUser" property="realName" /></h2>
    </div>
    <div class="staff-role block txt-center">
        <jsp:getProperty name="CurrentUser" property="role"/> of <jsp:getProperty name="CurrentUser" property="dept"/>
    </div>
</div>