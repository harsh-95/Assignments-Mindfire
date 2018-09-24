<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/Library Management Project/assets/js/homepage.js"></script>

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

		<div class="container" style="background-image: url(assets/images/books.jpg);">

        </div>

		<div class="footer">

			<footer>
				© 2018 libmanager.com / All rights reserved
			</footer>

		</div>
	</body>
</html>
