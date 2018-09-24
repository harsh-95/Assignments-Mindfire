<cfif Application.loginService.isUserLoggedIn() && session.user_type EQ 'user'>
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

			<div class="category1">
				<a href="issue_book.cfm">
					<img class="categories" src="../../assets/images/issuebook.png">
				</a>
			</div>

			<div class="category2">
				<a href="return_book.cfm">
					<img class="categories" src="../../assets/images/returnbook.png">
				</a>
			</div>

        </div>

		<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm">
</cfif>