<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'user'>
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

			<cfquery name="fetch" datasource="Library">
				SELECT title,Books.isbn,author,category,price
				FROM Books
				WHERE Books.ISBN
				NOT IN (SELECT ISBN FROM Books_Record WHERE Email_Id = '#SESSION.login_id#'AND Return_Date_Time IS NULL)
				AND Available > 0
			</cfquery>

			<cfif fetch.RecordCount GT 0>

	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Book Name</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>Category</th>
                <th>Price</th>
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
					<td>#Price#</td>
	<!---			<td><button class="btn-edit" id="issue" >Issue</button></td>   --->
					<td><a class="btn-issue" id="issue" href="../handlers/issue_book_handler.cfm?id=issue&isbn=#ISBN#">ISSUE</a></td>
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