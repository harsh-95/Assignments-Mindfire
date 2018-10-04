
<cfcomponent displayname="getTableDataForAdmin" output=false >

	<!---get all books from the database--->
	<cffunction name="getBooks" output="false" access="remote" returnformat="JSON" returntype="array">

		<cftry>
			<!---fetch Book details from the database--->
			<cfquery name="fetchBooks">
				SELECT title,isbn,author,category,total_books,available,price,date_added
				FROM Books
				WHERE IsDeleted = 'no'
			</cfquery>

			<cfset booksArray = arrayNew(1) />

			<cfloop query="fetchBooks">
				<cfset book = arrayNew(1) />
				<cfset ArrayAppend( book, title) />
				<cfset ArrayAppend( book, isbn) />
				<cfset ArrayAppend( book, author) />
				<cfset ArrayAppend( book, category) />
				<cfset ArrayAppend( book, total_books) />
				<cfset ArrayAppend( book, available) />
				<cfset ArrayAppend( book, price) />
				<cfset ArrayAppend( book, DateFormat(date_added)) />

				<cfset ArrayAppend(booksArray, book) />
			</cfloop>

			 <cfreturn booksArray />

			<cfcatch type="database" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fnName: getBooks #cfcatch.Detail# #cfcatch.Message#" >
				<cfreturn [false] />
			</cfcatch>

			<cfcatch type="any" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in returning array fnName: getBooks  #cfcatch.Detail# #cfcatch.Message#" />
				<cfreturn [false] />
			</cfcatch>

		</cftry>

	</cffunction>



	<!---get all User details from the database--->
	<cffunction name="getUsers" output="false" access="remote" returnformat="JSON" returntype="Query">

		<cftry>
			<!---fetch User details from the database--->
			<cfquery name="fetchUsers">
				SELECT name,email,mobile,address,registration_date
				FROM Users
				WHERE User_Type = 'user'
			</cfquery>

			<cfreturn fetchUsers />

			<cfcatch type="database" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fnName: getUsers #cfcatch.Detail# #cfcatch.Message#" >
				<cflocation url="../../error.cfm?errID=2" addtoken="no">
			</cfcatch>

			<cfcatch type="any" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in returning query fnName: getUsers  #cfcatch.Detail# #cfcatch.Message#" />
				<cflocation url="../../error.cfm?errID=2" addtoken="no">
			</cfcatch>

		</cftry>

	</cffunction>



	<!---get issued books details from the database--->
	<cffunction name="getIssuedBooksDetails" output="false" access="remote" returnformat="JSON" returntype="Query">

		<cftry>
			<!---fetch issued book details from the database--->
			<cfquery name="fetchIssuedBooks" >
				SELECT isbn, email_id, issue_date_time, return_date_time
				FROM Books_Record
			</cfquery>

			<cfreturn fetchIssuedBooks />

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query, fnName: getIssuedBooksDetails #cfcatch.Detail# #cfcatch.Message#" >
				<cflocation url="../../error.cfm?errID=2" addtoken="no">
			</cfcatch>

			<cfcatch type="any" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in returning query, fnName: getIssuedBooksDetails  #cfcatch.Detail# #cfcatch.Message#" />
				<cflocation url="../../error.cfm?errID=2" addtoken="no">
			</cfcatch>

		</cftry>

	</cffunction>



	<!---get requested books details from the database--->
	<cffunction name="getRequestedBooks" output="false" access="remote" returnformat="JSON" returntype="array">

		<cftry>
			<!---fetch issued book details from the database--->
			<cfquery name="fetchRequestedBooks" >
				SELECT title, category, author, isbn, email, date_requested
				FROM Book_Requests
				WHERE IsAdded = 'no'
			</cfquery>

			<cfset booksArray = arrayNew(1) />

			<cfloop query="fetchRequestedBooks">
				<cfset book = arrayNew(1) />
				<cfset ArrayAppend( book, title) />
				<cfset ArrayAppend( book, category) />
				<cfset ArrayAppend( book, author) />
				<cfset ArrayAppend( book, isbn) />
				<cfset ArrayAppend( book, email) />
				<cfset ArrayAppend( book, DateFormat(date_requested)) />

				<cfset ArrayAppend(booksArray, book) />
			</cfloop>

			 <cfreturn booksArray />

			<cfcatch type="database" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fetchRequestedBooks, fnName: getRequestedBooks #cfcatch.Detail# #cfcatch.Message#" >
				<cfreturn [false] />
			</cfcatch>

			<cfcatch type="any" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in returning array fnName: getRequestedBooks  #cfcatch.Detail# #cfcatch.Message#" />
				<cfreturn [false] />
			</cfcatch>

		</cftry>

	</cffunction>

</cfcomponent>