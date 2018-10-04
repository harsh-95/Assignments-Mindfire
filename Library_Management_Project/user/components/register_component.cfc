

<cfcomponent displayname="RegisterUserComponent" output=false >

	<!---function to check if user already registered--->
	<cffunction name="checkAlreadyRegistered" access="remote" output="false" returntype="boolean" returnformat="JSON">

		<cfargument name="email" type="string" required="true" />

			<cftry>
				<!---Check if already a user--->
				<cfquery name="fetchRecord">
					SELECT Email
					FROM Users
					WHERE Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.email#" />
				</cfquery>

				<cfcatch type="database" >
					<!--- Log all errors. --->
					<cflog file="LibraryProjectErrorLog" type="error"
								text="Some error occurred in Database Query fetchRecord, fnName: checkAlreadyRegistered #cfcatch.Detail# #cfcatch.Message#" >

				</cfcatch>

			</cftry>


		<cfif fetchRecord.RecordCount GT 0>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>

	</cffunction>


	<!---function to register user and store its details in database--->
	<cffunction name="registerUser" output="false" access="remote" returntype="boolean" returnformat="JSON">

		<cfargument name="name" type="string" required="true" />
		<cfargument name="email" type="string" required="true" />
		<cfargument name="mobile" type="string" required="true" />
		<cfargument name="password" type="string" required="true" />
		<cfargument name="address" type="string" required="true" />

		<!---generate a salt for the password--->
		<cfset LOCAL.salt = Hash(GenerateSecretKey("AES"),"SHA-512") />
		<!---hash the password and salt together--->
		<cfset LOCAL.hashedPassword = Hash("#ARGUMENTS.password#&#LOCAL.salt#","SHA-512") />

			<cftry>
				<!---Store User Data--->
				<cfquery name="storeData">
					INSERT INTO Users(Name,Email,Mobile,salt,Password,Address,Registration_date,User_Type)
					VALUES(
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.name#" />,
					        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.email#" />,
					        <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.mobile#" />,
					        <cfqueryparam cfsqltype="cf_sql_varchar" value="#LOCAL.salt#" />,
					        <cfqueryparam cfsqltype="cf_sql_varchar" value="#LOCAL.hashedPassword#" />,
					        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.address#" />,
					        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now(),"medium")#" />,
					        <cfqueryparam cfsqltype="cf_sql_varchar" value="user" />
						);
				</cfquery>

				<cfcatch type="database" >
					<!--- Log all errors. --->
					<cflog file="LibraryProjectErrorLog" type="error"
								text="Some error occurred in Database Query storeData, fnName: registerUser #cfcatch.Detail# #cfcatch.Message# #cfcatch.Message#" >
					<cfreturn false />

				</cfcatch>

			</cftry>

		<cfreturn true />

	</cffunction>

</cfcomponent>