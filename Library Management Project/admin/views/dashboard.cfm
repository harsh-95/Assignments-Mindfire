<html>
	<head>
		<title>Dashboard</title>
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
				<a class="nav-left"><strong><cfoutput>#session.name#</cfoutput></strong></a>
		</div>

		<div class="container" style="background-image: url('/Library Management Project/assets/images/books.jpg');">

		<div class="category1">
			<a href="/Library Management Project/admin/views/add-book.cfm">
				<img class="categories" src="/Library Management Project/assets/images/addbooks.png">
			</a>
		</div>

		<div class="category2">
			<a href="/Library Management Project/admin/views/manage-books.cfm">
				<img class="categories" src="/Library Management Project/assets/images/managebooks.png">
			</a>
		</div>

		<div class="category3">
			<a href="##">
				<img class="categories" src="/Library Management Project/assets/images/booksissued.png">
			</a>
		</div>

		<div class="category4">
			<a href="/Library Management Project/admin/views/manage-users.cfm">
				<img class="categories" src="/Library Management Project/assets/images/manageusers.png">
			</a>
		</div>

        </div>

		<div class="footer">
			<footer>
				© 2018 libmanager.com / All rights reserved
			</footer>
		</div>
		<cfelse>
			<cflocation url="/Library Management Project/admin/views/admin-login.cfm">
		</cfif>
	</body>
</html>