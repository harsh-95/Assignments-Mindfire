
<cfcomponent displayname="manageBooks" output=false >

	<!---Add a book into the database--->
	<cffunction name="addBook" output="false" access="remote" returntype="boolean" returnformat="JSON">

		<cfargument name="title" type="string" required="true" />
		<cfargument name="category" type="string" required="true" />
		<cfargument name="author" type="string" required="true" />
		<cfargument name="isbn" type="numeric" required="true" />
		<cfargument name="price" type="numeric" required="true" />
		<cfargument name="number" type="numeric" required="true" />

		<cftry>
			<!---Store Book Details into the database--->
			<cfquery name="storeData">
				INSERT INTO Books(title,category,author,isbn,price,total_books,available,Date_Added,isDeleted)
				VALUES(
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.title#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.category#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.author#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />,
				        <cfqueryparam cfsqltype="cf_sql_float" value="#ARGUMENTS.price#" />,
				        <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />,
				        <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />,
				        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now())#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="no" />
				 	  );
			</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
					text="Some error occurred in adding book, fnName: addBook  #cfcatch.Detail# #cfcatch.Message#" />

				<cfreturn false />

			</cfcatch>

		</cftry>

		<cfreturn true />

	</cffunction>



	<!---update books details into the database--->
	<cffunction name="updateBook" output="false" access="remote" returntype="boolean" returnformat="JSON">

		<cfargument name="title" type="string" required="true" />
		<cfargument name="category" type="string" required="true" />
		<cfargument name="author" type="string" required="true" />
		<cfargument name="isbn" type="numeric" required="true" />
		<cfargument name="price" type="numeric" required="true" />
		<cfargument name="number" type="numeric" required="true" />

		<cftry>
			<!---Update the book details with given isbn--->
			<cfquery name="storeData">
				UPDATE Books
				SET title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.title#" />,
			        category = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.category#" />,
			        author = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.author#" />,
			        isbn = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />,
			        price = <cfqueryparam cfsqltype="cf_sql_float" value="#ARGUMENTS.price#" />,
			        total_books = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />,
					available = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />,
			        Date_Added = <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now())#" />,
			        IsDeleted = <cfqueryparam cfsqltype="cf_sql_varchar" value="no" />
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />
			</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
					text="Some error occurred in updating book, fnName: updateBook  #cfcatch.Detail# #cfcatch.Message#" />

				<cfreturn false />

			</cfcatch>

		</cftry>

		<cfreturn true />

	</cffunction>



	<!---Delete the book from the database--->
	<cffunction name="deleteBook" output="false" access="remote" returnType="boolean" returnformat="JSON">

		<cfargument name="isbnn" type="numeric" required="true">

		<cftry>
			<!---Set IsDeleted of book to Yes--->
			<cfquery name="deleteBookInfo">
				UPDATE Books
				SET IsDeleted = <cfqueryparam cfsqltype="cf_sql_varchar" value="yes" />
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbnn#">
			</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
						text="Some error occurred in deleting book, fnName: deleteBook  #cfcatch.Detail# #cfcatch.Message#" />
				<cfreturn false />

			</cfcatch>

		</cftry>

			<cfreturn true />

	</cffunction>



	<!---Fetch the book to edit--->
	<cffunction name="fetchBookByIsbn" output="false" access="remote" returnType="query" returnformat="JSON">

		<cfargument name="isbnn" type="numeric" required="true">

		<cftry>
			<!---fetch book details with given isbn--->
			<cfquery name="LOCAL.fetchBookInfo">
				SELECT title,isbn,author,category,total_books,price,IsDeleted
				FROM Books
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbnn#">
			</cfquery>

			<cfreturn LOCAL.fetchBookInfo />

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
						text="Some error occurred in query fetchBookInfo, fnName: fetchBookByIsbn  #cfcatch.Detail# #cfcatch.Message#" />
				<!--- <cflocation url="../../error.cfm?errID=2" addtoken="no"> --->

				<cfset LOCAL.emptyQuery = QueryNew("") />

				<cfreturn LOCAL.emptyQuery />

			</cfcatch>

		</cftry>

	</cffunction>



	<!---Fetch the requested book to add--->
	<cffunction name="fetchBookToAdd" output="false" access="remote" returnType="query">

		<cfargument name="isbnn" type="string" required="true">

		<cftry>
			<!---fetch book details with given isbn--->
			<cfquery name="fetchBookInfo">
				SELECT title,category,author,isbn
				FROM Book_Requests
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbnn#">
			</cfquery>

			<cfreturn fetchBookInfo />

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
						text="Some error occurred in query fetchBookInfo, fnName: fetchBookToAdd  #cfcatch.Detail# #cfcatch.Message#" />
<!--- 				<cflocation url="../../error.cfm?errID=2" addtoken="no"> --->

				<cfset LOCAL.emptyQuery = QueryNew("") />

				<cfreturn LOCAL.emptyQuery />

			</cfcatch>

		</cftry>

	</cffunction>



	<!---Check if book is already in database--->
<!--- 	<cffunction name="checkBookRecord" access="remote" output="false" returntype="array" returnformat="JSON">

		<cfargument name="isbn" type="string" required="true" />

		<cftry>
			<!---fetch IsDeleted of a book with given ISBN--->
			<cfquery name="fetchRecord">
				SELECT IsDeleted
				FROM Books
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.isbn#" />
			</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
						text="Some error occurred in query fetchRecord, fnName: checkBookRecord  #cfcatch.Detail# #cfcatch.Message#" />

						<!--- <cflocation url="../../error.cfm?errID=2" addtoken="no"> --->

			</cfcatch>
		</cftry>


		<cfoutput query="fetchRecord">
			<cfset LOCAL.Deleted = fetchRecord.IsDeleted />
		</cfoutput>

		<cfif fetchRecord.RecordCount GT 0>
			<cfreturn [true, LOCAL.Deleted] />
		<cfelse>
			<cfreturn [false] />
		</cfif>

	</cffunction> --->



	<!---Delete the requested book from the database--->
	<cffunction name="deleteRequest" output="false" access="remote" returnType="boolean" returnformat="JSON">

		<cfargument name="isbnn" type="numeric" required="true">

		<cftry>
			<!---Set IsDeleted of book to Yes--->
			<cfquery name="deleteRequestInfo">
				UPDATE Book_Requests
				SET IsAdded = <cfqueryparam cfsqltype="cf_sql_varchar" value="yes" />
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbnn#">
			</cfquery>

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
						text="Some error occurred in deleting book request, fnName: deleteRequest  #cfcatch.Detail# #cfcatch.Message#" />
				<cfreturn false />

			</cfcatch>

		</cftry>

			<cfreturn true />

	</cffunction>

</cfcomponent>