<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<div class="staff-photo block">
    <form id="staff_photo_form" enctype="multipart/form-data" method="POST" action="changeStaffPhoto">
        <input type="hidden" value="" id="redirect_loc" name="redirect_location"/>
        <input type="file" id="staff_photo_img" style="display: none" name="new_staff_photo" onchange="readyToChange($(this).val())"/>
        <img class="img-circle" id="staff_photo" src="img/staffphoto/${CurrentUser.staffID}.jpg" onerror="this.src='img/staffphoto/default.jpg'" />
        <h5 id="readyToChangeSpan" class="hide txt-center italic" style="color: red;">Ready to change</h5>
        <button class="btn btn-default btn-success hide W100 MT10" onclick="$('#staff_photo_form').submit()" id="staff_photo_btn"><span class="glyphicon glyphicon-wrench"></span> Submit</button>
        <input type="reset" class="btn btn-default btn-danger hide W100 MT10" id="reset_form_btn" value="Cancel"/>
    </form>
    <script>
        $("#staff_photo").click(function() {
            $("#staff_photo_img").click();
        });

        $("#reset_form_btn").bind("click", clearChange);

        function readyToChange(url) {
            $('#staff_photo_btn').removeClass('hide');
            $('#readyToChangeSpan').removeClass('hide');
            $('#reset_form_btn').removeClass('hide');
        }

        function clearChange() {
            $('#staff_photo_btn').addClass('hide');
            $('#readyToChangeSpan').addClass('hide');
            $('#reset_form_btn').addClass('hide');
        }
    </script>
</div>
<div class="staff-data block">
    <div class="staff-name block txt-center">
        <h2>${CurrentUser.realName}</h2>
    </div>
    <div class="staff-role block txt-center">
        ${CurrentUser.role} of ${CurrentUser.dept}
    </div>
</div>