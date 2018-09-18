<html>
	<head>
		<title>Manage Users</title>
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

			<cfquery name="fetch" datasource="Library">
				SELECT * FROM Users
			</cfquery>

			<cfif fetch.RecordCount GT 0>

	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
				<th>User_Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Registration_date</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="fetch">
				<tr>
					<td>#User_Id#</td>
					<td>#Name#</td>
					<td>#Email#</td>
					<td>#Mobile#</td>
					<td>#Address#</td>
					<td>#DateFormat(Registration_date)#</td>
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