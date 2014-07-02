<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">Unnamed system</a>
        </div>
        <ul class="nav navbar-nav navbar-right navbar-collapse collapse">
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="tasks.jsp">Tasks</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${param.username} <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="editprofile.jsp">Edit Profile</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div><!--/.nav-collapse -->
</div>
