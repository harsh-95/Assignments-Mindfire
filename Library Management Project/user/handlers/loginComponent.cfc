
<cfcomponent displayname="validateAndSelectUrl" accessors=true output=false persistent=false >

	<cffunction name="validateUserLogin" output="false" access="public" returntype="String">
		<cfargument name="userId" type="string" required="true" />
		<cfargument name="userpassword" type="string" required="true" />

			<cfquery name="fetchUserInfo" datasource="Library">
				SELECT * FROM Users WHERE User_Id = '#arguments.userId#'
			</cfquery>

			<cfif fetchUserInfo.RecordCount GT 0>
				<cfoutput query="fetchUserInfo">
					<cfif arguments.userpassword EQ '#Password#'>
						<cfset session.user_id = #arguments.userId# />
						<cfset session.name = #Name# />
						<cfset var nextUrl = "/Library Management Project/user/views/dashboard.cfm" />
					<cfelse>
						<cfset var nextUrl = "/Library Management Project/user/views/user-login.cfm?id=3" />
					</cfif>
				</cfoutput>
			<cfelse>
				<cfset var nextUrl = "/Library Management Project/user/views/user-login.cfm?id=2" />
			</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>