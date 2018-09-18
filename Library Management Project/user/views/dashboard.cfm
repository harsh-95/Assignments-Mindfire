<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="/Library Management Project/assets/css/homepage.css" type="text/css">
	</head>

	<body>
		<cfif StructKeyExists(session,"name")>
		<header>
			<b>LIBRARY MANAGEMENT STUDIO</b>
		</header>

		<div class="navbar">
			<a href="/Library Management Project/common/logout-handler.cfm" class="nav-right" id="logout">Logout</a>
			<a class="nav-right" href="#home">Help</a>
			<a class="nav-right" href="#news">Contact Us</a>
			<a class="nav-right" href="#news">About</a>

			<a class="nav-left"><strong>libmanager.com</strong></a>
					<cfoutput><a class="nav-left"><strong>Hi #session.name#</strong></a></cfoutput>
		</div>

		<div class="container" style="background-image: url('/Library Management Project/assets/images/books.jpg');">

        </div>

		<div class="footer">
			<footer>
				© 2018 libmanager.com / All rights reserved
			</footer>
		</div>
		<cfelse>
			<cflocation url="/Library Management Project/user/views/user-login.cfm" addtoken="no">
		</cfif>
	</body>
</html>