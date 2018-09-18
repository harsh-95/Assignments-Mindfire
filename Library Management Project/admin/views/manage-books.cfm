<html>
	<head>
		<title>Manage Books</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="/Library Management Project/assets/css/homepage.css" type="text/css">
		<link rel="stylesheet" href="/Library Management Project/assets/css/data-tables.css" type="text/css">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script src="/Library Management Project/assets/js/manage-books.js"></script>
	</head>

	<body>
		<header>
			<b>LIBRARY MANAGEMENT STUDIO</b>
		</header>

		<div class="navbar">
			<a href="/Library Management Project/common/logout-handler.cfm" class="nav-right" id="logout">Logout</a>
			<a class="nav-right" href="#home">Help</a>
			<a class="nav-right" href="#news">Contact Us</a>
			<a class="nav-right" href="#news">About</a>

			<a class="nav-left"><strong>libmanager.com</strong></a>
			<a class="nav-left"><strong><cfoutput>#session.login.name#</cfoutput></strong></a>

		</div>

		<div class="container" style="background-image: url('/Library Management Project/assets/images/books.jpg');">

			<cfif isDefined("url.id")>
				<cfoutput><h3 id="userid">Successfully added Book</h3></cfoutput>
			</cfif>

			<cfquery name="fetch" datasource="Library">
				SELECT * FROM Books
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
					<td>#Title#</td>
					<td>#ISBN#</td>
					<td>#Author#</td>
					<td>#Category#</td>
					<td>#Total_Books#</td>
					<td>#Available#</td>
					<td>#Price#</td>
					<td>#DateFormat(Date_Added)#</td>
					<td><a href="##" class="btn-edit">Edit</a>  <button class="btn-delete" id="delete"> Delete </button></td>
				</tr>
			</cfoutput>
        </tbody>
    </table>

			</cfif>

        </div>

		<div class="footer">
			<footer>
				© 2018 libmanager.com / All rights reserved
			</footer>
		</div>
	</body>
</html>