
<cfcomponent displayname="validateAndSelectUrl" accessors=true output=false persistent=false >


	<cffunction name="sendOTP" output="false" access="remote" returntype="boolean" returnformat="JSON">

		<cfargument name="loginId" type="string" required="true" />

			<cftry>
				<cfquery name="fetchUserInfo">
					SELECT *
					FROM Users
					WHERE Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.loginId#">
				</cfquery>

				<cfif fetchUserInfo.RecordCount GT 0>

					<cfset SESSION.email_forgot_password = ARGUMENTS.loginId />
					<cfset SESSION.email_otp = randRange(100000,999999,"SHA1PRNG") />

					<cfmail from="harshgupta951114@gmail.com" to="#ARGUMENTS.loginId#"
							subject="Online Library Management FORGOT PASSWORD">

							Hi, To To create your new password
							OTP is #SESSION.email_otp#

					</cfmail>
					<!--- if OTP is sent--->
					<cfreturn true />
				<cfelse>
					<!--- if email not registered--->
					<cfreturn false />
				</cfif>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fetchUserInfo, fnName: sendOTP #cfcatch.Detail# #cfcatch.Message#" >

			</cfcatch>

			<cfcatch type="any" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in sending email fnName: sendOTP  #cfcatch.Detail# #cfcatch.Message#" />
			</cfcatch>

		</cftry>

	</cffunction>


	<cffunction name="createNewPassword" output="false" access="remote" returntype="array" returnformat="JSON">

		<cfargument name="otp" type="numeric" required="true" />
		<cfargument name="new_password" type="string" required="true" />
		<cfargument name="confirm_password" type="string" required="true" />

			<cfif ARGUMENTS.otp EQ SESSION.email_otp>

				<cfif ARGUMENTS.new_password EQ ARGUMENTS.confirm_password>

					<cfset LOCAL.salt = Hash(GenerateSecretKey("AES"),"SHA-512") />
					<cfset LOCAL.hashedPassword = Hash("#ARGUMENTS.new_password#&#LOCAL.salt#","SHA-512") />

						<cftry>
							<cfquery name="updateNewPassword">
								UPDATE Users
								SET Salt = <cfqueryparam cfsqltype="cf_sql_varchar" value="#LOCAL.salt#">,
									Password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#LOCAL.hashedPassword#">
								WHERE Email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.email_forgot_password#">
							</cfquery>

							<cfcatch type="database" >
								<!--- Log the errors. --->
								<cflog file="LibraryProjectErrorLog" type="error"
											text="Some error occurred in Database Query updateNewPassword, fnName: createNewPassword #cfcatch.Detail# #cfcatch.Message#" >

								<cfreturn [false,"Some problem occurred setting new password"] />

							</cfcatch>

						</cftry>

						<cfreturn [true] />

				<cfelse>

						<cfreturn [false,"Passwords didn't matched"] />
				</cfif>

			<cfelse>

					<cfreturn [false,"Entered OTP is wrong"] />
			</cfif>

	</cffunction>

</cfcomponent>