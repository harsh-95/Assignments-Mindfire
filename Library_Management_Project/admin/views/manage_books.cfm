<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'admin'>
<html>
	<head>
		<title>Manage Books</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
		<link rel="stylesheet" href="/assets/css/data-tables.css" type="text/css">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script src="/assets/js/manage-books.js"></script>
	</head>

	<body>
		<cfinclude template="../../common/includes/header.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">

			<cfif isDefined("url.id")>
				<cfif URL.id EQ 1>
					<cfoutput><h3 id="book-success">Successfully added Book</h3></cfoutput>
				<cfelseif URL.id EQ 2>
					<cfoutput><h3 id="book-success">Successfully updated Book</h3></cfoutput>
				</cfif>
			</cfif>

			<cfquery name="fetch" datasource="Library">
				SELECT title,isbn,author,category,total_books,available,price,date_added
				FROM Books
				WHERE IsDeleted = 'no'
			</cfquery>

			<cfif fetch.RecordCount GT 0>

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
				<th>Action</th>

            </tr>
        </thead>
        <tbody>
            <cfoutput query="fetch">
				<tr>
					<td class="clickable">#Title#</td>
					<td>#ISBN#</td>
					<td>#Author#</td>
					<td>#Category#</td>
					<td>#Total_Books#</td>
					<td>#Available#</td>
					<td>#Price#</td>
					<td>#DateFormat(Date_Added)#</td>
					<td><a href="edit_book.cfm?id=#ISBN#" class="btn-edit">Edit</a>  <a href="../handlers/manage_book_handler.cfm?id=3&isbnno=#ISBN#" class="btn-delete">Delete</a></td>
				</tr>
			</cfoutput>
        </tbody>
    </table>

			</cfif>

        </div>

	<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm">
</cfif>