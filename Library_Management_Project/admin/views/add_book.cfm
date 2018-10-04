<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'admin'>
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
		<script src="/assets/js/add-book.js"></script>
		<script src="/assets/js/admin_dashboard.js"></script>
		<script src="/assets/js/logout.js"></script>
	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">



		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

		<button class="btn-dash" onclick="goToDashboard()">Back to</button><br><br>

			<h3 class="show-msg"></h3>
			<div class="form1">
				<div class="heading">
					Book Info
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
							<span class="error" id="error_isbn"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Price</span>
						</div>
							<input type="text" name="price" class="input-field" id="price" placeholder="enter price" maxlength="7" required>
							<span class="error" id="error_price"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Number Of Books</span>
						</div>
							<input type="text" name="number" class="input-field" id="nob" placeholder="enter no. of books" maxlength="2" required>
							<span class="error" id="error_nob"></span><br><br>
					</div>

					<div class="field-button">
							<input type="submit" id="add-book" value="Add Book">
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