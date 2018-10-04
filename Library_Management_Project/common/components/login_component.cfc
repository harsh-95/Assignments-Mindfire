
<cfcomponent displayname="validateTheUserLogin" output=false >

	<cffunction name="validateUserLogin" output="false" access="remote" returntype="array" returnformat="jSON">
		<cfargument name="loginId" type="string" required="true" />
		<cfargument name="loginPassword" type="string" required="true" />

			<cftry>
				<cfquery name="fetchUserInfo">
					SELECT *
					FROM Users
					WHERE Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.loginId#">
				</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fetchUserInfo, fnName: validateUserLogin #cfcatch.Detail# #cfcatch.Message#" >

				<cfreturn [false,'Some internal problem occurred. Please try again'] />

			</cfcatch>

		</cftry>


			<cfif fetchUserInfo.RecordCount GT 0>

				<cfoutput query="fetchUserInfo">

					<cfset LOCAL.hashedLoginPassword = Hash("#ARGUMENTS.loginPassword#&#fetchUserInfo.salt#","SHA-512") />

					<cfif fetchUserInfo.Password EQ LOCAL.hashedLoginPassword >

						<cflock timeout="10" scope="Session" type="exclusive">
							<cfset SESSION.login_id = ARGUMENTS.loginId />
							<cfset SESSION.name = fetchUserInfo.Name />
							<cfset SESSION.user_type = fetchUserInfo.User_Type />
						</cflock>

							<cfif #User_Type# EQ 'admin'>

									<cfreturn [true,'admin'] />
							<cfelse>

									<cfreturn [true,'user'] />
							</cfif>
					<cfelse>

							<cfreturn [false,'Password is Incorrect'] />
					</cfif>
				</cfoutput>
			<cfelse>

					<cfreturn [false,'This email is not registered'] />
			</cfif>

	</cffunction>

</cfcomponent>