<body>

<!--->
<cfif #form.email# EQ ''>
<cfset session.err = 'Email is required'>
<script>
	window.location = "login.html";
</script>
</cfif>
--->
	<cfquery name="fetch" datasource="cfdatasource">
		SELECT * FROM signup WHERE Email = '#form.email#'
	</cfquery>
		<cfif fetch.RecordCount GT 0>
			<cfoutput query="fetch">
				<cfif #Password# EQ '#form.password#'>
					<CFSET session.login.name = #Fullname#>
					<CFSET session.login.email = '#form.email#'>
					Name   		#Fullname# <br>
					Email  		#Email#<br>
					Phone  		#Phone#<br>
					PasswordDB  #Password#<br>
					PasswordIF  #form.password#
					<cflocation url="homepage.cfm" addtoken="no">
				<cfelse>
					<cflocation url="login.cfm?id=2" addtoken="no">
					<h1>Password Incorrect</h1>
				</cfif>
			</cfoutput>

		<cfelse>
			<cflocation url="login.cfm?id=1" addtoken="no">
			<h1>This is not registered email</h1>
		</cfif>
</body>