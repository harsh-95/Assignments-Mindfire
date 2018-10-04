

<cfcomponent displayname="issueBook" accessors=true output=false persistent=false >
	<!---issue a book and store the record in database--->
	<cffunction name="issueBook" output="false" access="remote" returnformat="JSON" returntype="boolean">

		<cfargument name="isbn" type="numeric" required="true" />

		<cftry>
			<!---Store Book Details into the database--->
			<cfquery name="storeData">
				DECLARE @intErrorCode INT
				BEGIN TRANSACTION
				    INSERT INTO Books_Record(isbn,email_id,issue_Date_Time)
				VALUES(
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />,
				     	<cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />,
					    <cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now())#,#TimeFormat(Now())#" />
						);

				    SELECT @intErrorCode = @@ERROR
				    IF (@intErrorCode <> 0) GOTO PROBLEM

				UPDATE Books
				SET Available = (Available - 1)
				WHERE ISBN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />

				    SELECT @intErrorCode = @@ERROR
				    IF (@intErrorCode <> 0) GOTO PROBLEM
				COMMIT TRANSACTION

				PROBLEM:
				IF (@intErrorCode <> 0) BEGIN
				    ROLLBACK TRANSACTION
				END

<!---				INSERT INTO Books_Record(isbn,email_id,issue_Date_Time)
				VALUES(
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />,
				     	<cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />,
					    <cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now())#,#TimeFormat(Now())#" />
					   );
				UPDATE Books
				SET Available = (Available - 1)
				WHERE ISBN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />--->
			</cfquery>

			<cfreturn true />

			<cfcatch type="database" >

				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query storeData fnName: issueBook #cfcatch.Detail# #cfcatch.Message#" >

				<cfreturn false />

			</cfcatch>
		</cftry>


	</cffunction>

	<!---return a book and store the record in database--->
	<cffunction name="returnBook" output="false" access="remote" returnformat="JSON" returntype="boolean">

		<cfargument name="isbn" type="numeric" required="true" />

			<cftry>
				<!---Return Book and update the database--->
				<cfquery name="returnData">
					DECLARE @intErrorCode INT
					BEGIN TRANSACTION
					    UPDATE Books_Record
					SET Return_Date_Time = <cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now())#,#TimeFormat(Now())#" />
					WHERE ISBN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />
					AND Email_Id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />

					    SELECT @intErrorCode = @@ERROR
					    IF (@intErrorCode <> 0) GOTO PROBLEM

					UPDATE Books
					SET Available = (Available + 1)
					WHERE ISBN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />

					    SELECT @intErrorCode = @@ERROR
					    IF (@intErrorCode <> 0) GOTO PROBLEM
					COMMIT TRANSACTION

					PROBLEM:
					IF (@intErrorCode <> 0) BEGIN
					    ROLLBACK TRANSACTION
					END
	<!---				UPDATE Books_Record
					SET Return_Date_Time = <cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now())#,#TimeFormat(Now())#" />
					WHERE ISBN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />
					AND Email_Id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />

					UPDATE Books
					SET Available = (Available + 1)
					WHERE ISBN = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />--->
				</cfquery>

			<cfreturn true />

			<cfcatch type="database" >

				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query storeData fnName: issueBook #cfcatch.Detail# #cfcatch.Message#" >

				<cfreturn false />

			</cfcatch>
		</cftry>

	</cffunction>



	<!---Request a book to the admin--->
	<cffunction name="requestBook" output="false" access="remote" returntype="boolean" returnformat="JSON">

		<cfargument name="title" type="string" required="true" />
		<cfargument name="category" type="string" required="true" />
		<cfargument name="author" type="string" required="true" />
		<cfargument name="isbn" type="numeric" required="true" />

		<cftry>
			<!---Store Requested Book Details into the database--->
			<cfquery name="storeData">
				INSERT INTO Book_Requests(title,category,author,isbn,email,date_requested,IsAdded)
				VALUES(
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.title#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.category#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.author#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#SESSION.login_id#" />,
				        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now())#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="no" />
				 	  );
			</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
					text="Some error occurred in adding book request, fnName: requestBook  #cfcatch.Detail# #cfcatch.Message#" />

				<cfreturn false />

			</cfcatch>

		</cftry>

		<cfreturn true />

	</cffunction>


</cfcomponent>