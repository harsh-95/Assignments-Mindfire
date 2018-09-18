<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="/Library Management Project/assets/css/homepage.css" type="text/css">
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
				<cfif #url.id# EQ 2>
					<cfoutput><h3 id="userid">Incorrect id</h3></cfoutput>
				<cfelse>
					<cfoutput><h3 id="userid">Incorrect Password</h3></cfoutput>
				</cfif>
			</cfif>

			<div class="form1" >
				<div class="heading">
					ADMIN Login
				</div>

				<form action="/Library Management Project/admin/handlers/login-handler.cfm" method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Login id</span>
						</div>
							<input type="text" name="login_id" class="input-field" value="admin" maxlength="20" required><br><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Password</span>
						</div>
							<input type="password" name="password" class="input-field" placeholder="enter password" maxlength="20" required><br><br>
					</div>

					<div class="field-button">
						<input type="submit" value="Login">
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