<cfif Application.loginService.isUserLoggedIn() && session.user_type EQ 'user'>
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
		<script src="/assets/js/logout.js"></script>
	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

			<div class="category1">
				<a href="issue_book.cfm">
					<img class="categories" src="../../assets/images/issuebook.png">
				</a>
			</div>

			<div class="category3">
				<a href="return_book.cfm">
					<img class="categories" src="../../assets/images/returnbook.png">
				</a>
			</div>

			<div class="category6">
				<a href="request_book.cfm">
					<img class="categories" src="../../assets/images/requestbook.png">
				</a>
			</div>

        </div>

		<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm" addtoken="no">
</cfif>