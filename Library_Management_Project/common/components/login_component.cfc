
<cfcomponent displayname="validateAndSelectUrl" accessors=true output=false persistent=false >

	<cffunction name="validateUserLogin" output="false" access="public" returntype="String">
		<cfargument name="loginId" type="string" required="true" />
		<cfargument name="loginpassword" type="string" required="true" />

			<cfquery name="fetchUserInfo" datasource="Library">
				SELECT *
				FROM Users
				WHERE Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.loginId#">
			</cfquery>

			<cfif fetchUserInfo.RecordCount GT 0>
				<cfoutput query="fetchUserInfo">
					<cfif fetchUserInfo.Password EQ ARGUMENTS.loginpassword>
						<cflock timeout="10" scope="Session" type="exclusive">
							<cfset SESSION.login_id = ARGUMENTS.loginId />
							<cfset SESSION.name = fetchUserInfo.Name />
							<cfset SESSION.user_type = fetchUserInfo.User_Type />
						</cflock>
							<cfif #User_Type# EQ 'admin'>
								<cfset LOCAL.nextUrl = "../../admin/views/dashboard.cfm" />
							<cfelse>
								<cfset LOCAL.nextUrl = "../../user/views/dashboard.cfm" />
							</cfif>
					<cfelse>
						<cfset LOCAL.nextUrl = "../user_login.cfm?id=3" />
					</cfif>
				</cfoutput>
			<cfelse>
				<cfset LOCAL.nextUrl = "../user_login.cfm?id=2" />
			</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>