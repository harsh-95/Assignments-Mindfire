

<cfcomponent displayname="issueBook" accessors=true output=false persistent=false >

	<cffunction name="issueBook" output="false" access="public" returntype="String">

		<cfargument name="isbn" type="numeric" required="true" />

				<!---Store Book Details into the database--->
			<cfquery name="storeData" datasource="Library">
				INSERT INTO Books_Record(isbn,email_id,issue_Date_Time)
				VALUES(
						<cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbn#" />,
				     	<cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />,
					    <cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now())#,#TimeFormat(Now())#" />
					   );
				UPDATE Books
				SET Available = Available - 1
				WHERE ISBN = #ARGUMENTS.isbn#
			</cfquery>


				<cfset LOCAL.nextUrl = "../views/issue_book.cfm" />

			<cfreturn nextUrl />
	</cffunction>


	<cffunction name="returnBook" output="false" access="public" returntype="String">

		<cfargument name="isbn" type="numeric" required="true" />

				<!---Return Book into the database--->
			<cfquery name="returnData" datasource="Library">
				UPDATE Books_Record
				SET Return_Date_Time = <cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now())#,#TimeFormat(Now())#" />
				WHERE ISBN = #ARGUMENTS.isbn#
				AND Email_Id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />

				UPDATE Books
				SET Available = Available + 1
				WHERE ISBN = #ARGUMENTS.isbn#
			</cfquery>

				<cfset LOCAL.nextUrl = "../views/return_book.cfm" />

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>