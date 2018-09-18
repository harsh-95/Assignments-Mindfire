<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="/Library Management Project/assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/Library Management Project/assets/js/user-login-validations.js"></script>
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
					<a href="/Library Management Project/admin/views/admin-login.cfm">Admin</a>
					<a href="/Library Management Project/user/views/user-login.cfm">User</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn">Register
					<i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="/Library Management Project/user/views/register-user.cfm">User</a>
				</div>
			</div>
			<a class="nav-left"><strong>libmanager.com</strong></a>
		</div>


		<div class="container" style="background-image: url('/Library Management Project/assets/images/books.jpg');">

			<cfif isDefined("url.id")>
				<cfif isDefined("url.nid")>
					<cfoutput><h3 id="userid">Successfully Registered. Your User_id is #url.nid#</h3></cfoutput>
				</cfif>

				<cfif #url.id# EQ 2>
					<cfoutput><h3 id="showid">Incorrect User_id</h3></cfoutput>
				<cfelseif #url.id# EQ 3>
					<cfoutput><h3 id="showid">Incorrect Password</h3></cfoutput>
				</cfif>
			</cfif>
			<div class="form1">
				<div class="heading">
					User Login
				</div>

				<form action="/Library Management Project/user/handlers/login-handler.cfm" method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">User id</span>
						</div>
							<input type="text" name="user_id" class="input-field" id="user_id" placeholder="enter user id" maxlength="6">
							<span class="error" id="error_user_id"></span><br><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Password</span>
						</div>
							<input type="password" name="password" class="input-field" id="password" placeholder="enter password" maxlength="20">
							<span class="error" id="error_password"></span><br><br>
					</div>
					<div class="label">
						<input type="submit" id="login" value="Login">
					</div>

				</form>
			</div>
        </div>

		<div class="footer">
			<footer>
				© 2018 libmanager.com / All rights reserved
			</footer>
		</div>
	</body>
</html>