<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'admin'>
			<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
<html>
	<head>
		<title>Dashboard</title>
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
			<a href="add_book.cfm">
				<img class="categories" src="../../assets/images/addbooks.png">
			</a>
		</div>

		<div class="category2">
			<a href="manage_books.cfm">
				<img class="categories" src="../../assets/images/managebooks.png">
			</a>
		</div>

		<div class="category3">
			<a href="issued_books.cfm">
				<img class="categories" src="../../assets/images/booksissued.png">
			</a>
		</div>

		<div class="category4">
			<a href="manage_users.cfm">
				<img class="categories" src="../../assets/images/manageusers.png">
			</a>
		</div>

		<div class="category5">
			<a href="manage_requests.cfm">
				<img class="categories" src="../../assets/images/viewrequests.png">
			</a>
		</div>

        </div>

		<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm" addtoken="no">
</cfif>