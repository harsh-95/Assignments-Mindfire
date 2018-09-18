
<cfcomponent displayname="validateAndSelectUrl" accessors=true output=false persistent=false >

	<cffunction name="validateAdminLogin" output="false" access="public" returntype="String">
		<cfargument name="loginId" type="string" required="true" />
		<cfargument name="password" type="string" required="true" />

				<cfif arguments.loginId EQ 'admin'>
					<cfif arguments.password EQ 'admin123'>
					<cfset session.login.name = 'ADMIN'>
						<cfset var nextUrl = "/Library Management Project/admin/views/dashboard.cfm"  />
					<cfelse>
						<cfset var nextUrl = "/Library Management Project/admin/views/admin-login.cfm?id=3"  />
					</cfif>
				<cfelse>
					<cfset var nextUrl = "/Library Management Project/admin/views/admin-login.cfm?id=2"  />
				</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>
