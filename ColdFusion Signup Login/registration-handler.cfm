<body>

	<cfset fullname = #form.fullname#>
	<cfset email = #form.email#>
	<cfset phone = #form.phone#>
	<cfset password = #form.password#>

	<cfquery datasource="cfdatasource" name="store">
		INSERT INTO signup
		values('#fullname#', '#email#', '#phone#', '#password#');
	</cfquery>


	<cflocation url="login.cfm" addtoken="no">

</body>