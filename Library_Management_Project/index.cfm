<cfif NOT Application.loginService.isUserLoggedIn()>
				<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/assets/js/homepage.js"></script>

	</head>
	<body>
		<header>
			<b>LIBRARY MANAGEMENT STUDIO</b>
		</header>

		<div class="navbar">
			<a class="nav-right" href="#home">Help</a>
			<a class="nav-right" href="#news">Contact Us</a>
			<a class="nav-right" href="#news">About</a>

			<div class="dropdown">
				<button class="dropbtn">Login as
					<i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="common/user_login.cfm">User/Admin</a>
				</div>
			</div>


			<div class="dropdown">
				<button class="dropbtn">Register
					<i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="/user/views/register_user.cfm">New User</a>
				</div>
			</div>
				<a class="nav-left"><strong>libmanager.com</strong></a>
		</div>

		<div class="container" style="background-image: url(assets/images/books.jpg);">

        </div>

		<cfinclude template="common/includes/footer.cfm">
	</body>
</html>
<cfelseif session.user_type EQ 'user'>
	<cflocation url="user/views/dashboard.cfm" addtoken="no">
<cfelseif session.user_type EQ 'admin'>
	<cflocation url="admin/views/dashboard.cfm" addtoken="no">
</cfif>