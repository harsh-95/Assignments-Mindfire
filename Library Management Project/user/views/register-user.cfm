<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
		<link rel="stylesheet" href="/Library Management Project/assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/Library Management Project/assets/js/register-user-validations.js"></script>
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
					<a href="/Library Management Project/user/views/register-user.cfm">New User</a>
				</div>
			</div>

			<a class="nav-left"><strong>libmanager.com</strong></a>
		</div>

		<div class="container" style="background-image: url('/Library Management Project/assets/images/books.jpg');">
		<cfif isDefined("url.id")>
			<cfif isDefined("url.uid")>
				<cfoutput><h3 id="userid">User already registered and User_id is #url.uid#</h3></cfoutput>
			<cfelse>
				<cfoutput><h3 id="userid">Successfully Registered. Your User_id is #url.nid#</h3></cfoutput>
			</cfif>
		</cfif>
			<div class="form1">
				<div class="heading">
					New Registration
				</div>

				<form action="/Library Management Project/user/handlers/register-handler.cfm" method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Name</span>
						</div>
							<input type="text" name="name" class="input-field" id="name" placeholder="enter first name" maxlength="20" >
							<span class="error" id="error_name"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Email</span>
						</div>
							<input type="text" name="email" class="input-field" id="email" placeholder="enter your email" maxlength="20" >
							<span class="error" id="error_email"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Mobile</span>
						</div>
							<input type="text" name="mobile" class="input-field" id="mobile" placeholder="enter mobile number" maxlength="10" >
							<span class="error" id="error_mobile"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Password</span>
						</div>
							<input type="password" name="password" class="input-field" id="password" placeholder="enter password" maxlength="20" >
							<span class="error" id="error_password"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Address</span>
						</div>
							<input type="text" name="address" class="input-field" id="address" placeholder="enter address" maxlength="20" >
							<span class="error" id="error_address"></span><br><br>
					</div>

					<div class="field-button">
						<input type="submit" id="submit" value="Register">
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