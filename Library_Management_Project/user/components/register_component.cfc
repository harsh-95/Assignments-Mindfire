

<cfcomponent displayname="RegisterUserAndSendUrl" accessors=true output=false persistent=false >

	<cffunction name="registerUser" output="false" access="public" returntype="String">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="email" type="string" required="true" />
		<cfargument name="mobile" type="string" required="true" />
		<cfargument name="password" type="string" required="true" />
		<cfargument name="address" type="string" required="true" />

		<!---Check if already a user--->
		<cfquery name="checkEmailAvailability" datasource="Library">
			SELECT Email FROM Users WHERE Email = '#ARGUMENTS.email#'
		</cfquery>

		<cfif checkEmailAvailability.RecordCount GT 0>
			<cfoutput query="checkEmailAvailability">
				<cfset var nextUrl = "../views/register_user.cfm?id=1" />
			</cfoutput>
		<cfelse>
			<!---Store User Data--->
			<cfquery name="storeData" datasource="Library">
				INSERT INTO Users(Name,Email,Mobile,Password,Address,Registration_date,User_Type)
						values(
								<cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.name#" />,
						        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.email#" />,
						        <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.mobile#" />,
						        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.password#" />,
						        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.address#" />,
						        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now())#" />,
						        <cfqueryparam cfsqltype="cf_sql_varchar" value="user" />
							);
			</cfquery>

			<!---Fetch User Id--->
			<cfquery name="fetch" datasource="Library">
				SELECT Email FROM Users WHERE Email = '#email#'
			</cfquery>

			<cfoutput query="fetch">
				<cfset var nextUrl = "../../common/user_login.cfm?id=1" />
			</cfoutput>

		</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>