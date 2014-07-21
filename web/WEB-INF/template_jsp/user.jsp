<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<div class="staff-photo block">
    <img class="img-circle" src="img/staffphoto/${CurrentUser.staffID}.jpg" alt="username" onerror="this.src='img/staffphoto/default.jpg'" />
</div>
<div class="staff-data block">
    <div class="staff-name block txt-center">
        <h2>${CurrentUser.realName}</h2>
    </div>
    <div class="staff-role block txt-center">
        ${CurrentUser.role} of ${CurrentUser.dept}
    </div>
</div>