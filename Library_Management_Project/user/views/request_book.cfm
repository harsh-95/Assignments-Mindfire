<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'user'>
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
		<script src="/assets/js/add-book-validations.js"></script>
		<script src="/assets/js/issue_book.js"></script>
		<script src="/assets/js/logout.js"></script>

	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

			<button class="btn-dash" onclick="goToDashboard()">Back to</button><br><br>

			<h3 class="show-msg id="errmsg"></h3>
			<div class="form1">
				<div class="heading">
					Request Book
				</div>

				<form method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Book Title</span>
						</div>
							<input type="text" name="title" class="input-field" id="title" placeholder="enter book title" maxlength="40" required>
							<span class="error" id="error_title"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Category</span>
						</div>
							<input type="text" name="category" class="input-field" id="category" placeholder="enter book category" maxlength="40" required>
							<span class="error" id="error_category"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Author</span>
						</div>
							<input type="text" name="author" class="input-field" id="author" placeholder="enter author name" maxlength="40" required>
							<span class="error" id="error_author"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">ISBN Number</span>
						</div>
							<input type="text" name="isbn" class="input-field" id="isbn" placeholder="enter ISBN number" maxlength="10" required>
							<span class="error" id="error_isbn"></span><br><br>
					</div>

					<div class="field-button">
							<input type="submit" id="request-book" value="Send">
					</div>
				</form>
			</div>

        </div>

	<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm" addtoken="no">
</cfif>