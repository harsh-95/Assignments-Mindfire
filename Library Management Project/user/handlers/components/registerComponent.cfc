

<cfcomponent displayname="RegisterUserAndSendUrl" accessors=true output=false persistent=false >

	<cffunction name="registerUser" output="false" access="public" returntype="String">
		<cfargument name="name" type="string" required="true" />
		<cfargument name="email" type="string" required="true" />
		<cfargument name="mobile" type="string" required="true" />
		<cfargument name="password" type="string" required="true" />
		<cfargument name="address" type="string" required="true" />

		<!---Check if already a user--->
		<cfquery name="checkEmailAvailability" datasource="Library">
			SELECT User_Id FROM Users WHERE Email = '#arguments.email#'
		</cfquery>

		<cfif checkEmailAvailability.RecordCount GT 0>
			<cfoutput query="checkEmailAvailability">
				<cfset var nextUrl = "register-user.cfm?id=1&uid=#User_Id#" />
			</cfoutput>
		<cfelse>
			<!---Store User Data--->
			<cfquery name="storeData" datasource="Library">
				INSERT INTO Users(Name,Email,Mobile,Password,Address,Registration_date)
						values('#arguments.name#', '#arguments.email#', '#arguments.mobile#',
								'#arguments.password#', '#arguments.address#','#DateFormat(Now())#');
			</cfquery>

			<!---Fetch User Id--->
			<cfquery name="fetch" datasource="Library">
				SELECT User_Id FROM Users WHERE Email = '#email#'
			</cfquery>

			<cfoutput query="fetch">
				<cfset var nextUrl = "user-login.cfm?id=1&nid=#User_Id#" />
			</cfoutput>

		</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>