<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'admin'>
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/assets/js/add-book-validations.js"></script>
	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">

		<cfquery name="fetchBook" datasource="Library">
			SELECT title,isbn,author,category,total_books,price
			FROM Books
			WHERE isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#URL.id#">
		</cfquery>

<cfoutput query="fetchBook">
		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

			<div class="form1">
				<div class="heading">
					Book Info
				</div>

				<form action="../handlers/manage_book_handler.cfm?id=2&isbnno=#URL.id#" method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Book Title</span>
						</div>
							<input type="text" name="title" class="input-field" id="title" placeholder="enter book title" value="#title#" maxlength="20" required>
							<span class="error" id="error_title"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Category</span>
						</div>
							<input type="text" name="category" class="input-field" id="category" placeholder="enter book category" value="#category#" maxlength="20" required>
							<span class="error" id="error_category"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Author</span>
						</div>
							<input type="text" name="author" class="input-field" id="author" placeholder="enter author name" value="#author#" maxlength="20" required>
							<span class="error" id="error_author"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">ISBN Number</span>
						</div>
							<input type="text" name="isbn" class="input-field" id="isbn" placeholder="enter ISBN number" maxlength="10" value="#isbn#" required>
							<span class="error" id="error_isbn"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Price</span>
						</div>
							<input type="text" name="price" class="input-field" id="price" placeholder="enter price" maxlength="7" value="#price#" required>
							<span class="error" id="error_price"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Number Of Books</span>
						</div>
							<input type="text" name="number" class="input-field" id="nob" placeholder="enter no. of books" value="#total_books#" maxlength="2" required>
							<span class="error" id="error_nob"></span><br><br>
					</div>

					<div class="field-button">
							<input type="submit" id="add-book" value="Update Info">
					</div>
				</form>
			</div>
        </div>
</cfoutput>
		<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm">
</cfif>