<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'admin'>
<html>
	<head>
		<title>Manage Books</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
		<link rel="stylesheet" href="/assets/css/data-tables.css" type="text/css">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script src="/assets/js/edit_delete_books.js"></script>
		<script src="/assets/js/logout.js"></script>

	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

			<button class="btn-dash" onclick="goToDashboard()">Back to</button><br><br>

			<cfif isDefined("url.id")>
				<cfif URL.id EQ 1>
					<cfoutput><h3 id="book-success">Successfully added/updated Book</h3></cfoutput>
				</cfif>
			</cfif>

				<h3 class="show-msg id="errmsg"></h3>
				<table id="example" class="display" style="width:100%">
			        <thead>
			            <tr>
			                <th>Book Name</th>
			                <th>ISBN</th>
			                <th>Author</th>
			                <th>Category</th>
			                <th>Total Books</th>
							<th>Available</th>
			                <th>Price</th>
							<th>Date Added</th>
							<th>Edit</th>
							<th>Delete</th>
			            </tr>
			        </thead>
				</table>

        </div>

	<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm" addtoken="no">
</cfif>