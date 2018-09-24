<cfif APPLICATION.loginService.isUserLoggedIn() && SESSION.user_type EQ 'admin'>
<html>
	<head>
		<title>Manage Users</title>
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

			<cfquery name="fetch" datasource="Library" cachedwithin="#CreateTimespan(0,0,2,0)#">
				SELECT name,email,mobile,address,registration_date
				FROM Users
				WHERE User_Type = 'user'
			</cfquery>

			<cfif fetch.RecordCount GT 0>

	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
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

		<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelse>
	<cflocation url="../../common/user_login.cfm">
</cfif>