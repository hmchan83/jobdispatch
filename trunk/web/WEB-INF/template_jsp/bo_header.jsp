<jsp:useBean id="CurrentUser" class="bean.LoginStaff" scope="session" />
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="bo_main">Unnamed system</a>
        </div>
        <ul class="nav navbar-nav navbar-right navbar-collapse collapse">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tasks  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="bo_taskDetail">Task Detail</a></li>
                    <li><a href="bo_taskQuery">Task Query</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Staff  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="bo_createStaff">Create Staff</a></li>
                    <li><a href="bo_staffQuery">Staff Query</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Company  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="bo_structControl">Structure Control</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Log  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="bo_logQuery">Log Query</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><jsp:getProperty name="CurrentUser" property="userName" />  <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="logout">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div><!--/.nav-collapse -->
</div>

