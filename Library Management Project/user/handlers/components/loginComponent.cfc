
<cfcomponent displayname="validateAndSelectUrl" accessors=true output=false persistent=false >

	<cffunction name="validateUserLogin" output="false" access="public" returntype="String">
		<cfargument name="userId" type="string" required="true" />
		<cfargument name="userpassword" type="string" required="true" />

			<cfquery name="fetchUserInfo" datasource="Library">
				SELECT * FROM Users WHERE User_Id = '#arguments.userId#'
			</cfquery>

			<cfif fetchUserInfo.RecordCount GT 0>
				<cfoutput query="fetchUserInfo">
					<cfif '#arguments.userpassword#' EQ '#Password#'>
						<cfset session.login.user_id = #arguments.userId# />
						<cfset session.login.name = #Name# />
						<cfset var nextUrl = "dashboard.cfm?id=1" />
					<cfelse>
						<cfset var nextUrl = "user-login.cfm?id=3" />
					</cfif>
				</cfoutput>
			<cfelse>
				<cfset var nextUrl = "user-login.cfm?id=2" />
			</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>