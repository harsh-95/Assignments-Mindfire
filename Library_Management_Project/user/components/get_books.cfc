

<cfcomponent displayname="getTableData" accessors=true output=false persistent=false >
	<!---fetch books that are avialable and return an array of books--->
	<cffunction name="getBooksToIssue" output="false" access="remote" returnformat="JSON" returntype="array">

		<cftry>
			<!---fetch books that are avialable from the database--->
			<cfquery name="fetchBooks">
				SELECT b.title,b.isbn,b.author,b.category,b.price
				FROM Books b
				WHERE b.isbn
				NOT IN (SELECT isbn FROM Books_Record WHERE Email_Id = '#SESSION.login_id#'AND Return_Date_Time IS NULL)
				AND Available > 0
				AND IsDeleted = 'no'
			</cfquery>

			<cfset booksArray = arrayNew(1) />

			<cfloop query="fetchBooks">
				<cfset book = arrayNew(1) />
				<cfset ArrayAppend( book, title) />
				<cfset ArrayAppend( book, isbn) />
				<cfset ArrayAppend( book, author) />
				<cfset ArrayAppend( book, category) />
				<cfset ArrayAppend( book, price) />

				<cfset ArrayAppend(booksArray, book) />
			</cfloop>

			 <cfreturn booksArray />

			<cfcatch type="database" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fnName: getBooksToIssue #cfcatch.Detail# #cfcatch.Message#" >
				<cfreturn [false] />
			</cfcatch>

			<cfcatch type="any" >
				<!--- Log the errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in returning array fnName: getBooksToIssue  #cfcatch.Detail# #cfcatch.Message#" />
				<cfreturn [false] />
			</cfcatch>

		</cftry>

	</cffunction>



	<!---fetch books that are issued and return array of these books--->
	<cffunction name="getBooksToReturn" output="false" access="remote" returnformat="JSON" returntype="array">

		<cftry>
			<!---fetch issued book details from the database--->
			<cfquery name="fetchIssuedBooks">
				SELECT title,Books.isbn,author,category,price
				FROM Books
				WHERE Books.ISBN IN (
									 SELECT ISBN
									 FROM Books_Record
									 WHERE Email_Id = '#SESSION.login_id#'
									 AND Return_Date_Time IS NULL
									)
			</cfquery>

			<cfset booksArray = arrayNew(1) />
			<cfloop query="fetchIssuedBooks">
				<cfset book = arrayNew(1) />
				<cfset ArrayAppend( book, title) />
				<cfset ArrayAppend( book, isbn) />
				<cfset ArrayAppend( book, author) />
				<cfset ArrayAppend( book,  category) />
				<cfset ArrayAppend( book,  price) />

				<cfset ArrayAppend(booksArray, book) />
			</cfloop>

			 <cfreturn booksArray />

			<cfcatch type="database" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in Database Query fnName: getBooksToReturn #cfcatch.Detail# #cfcatch.Message#" >
				<cfreturn [false] />
			</cfcatch>

			<cfcatch type="any" >
				<!--- Log all errors. --->
				<cflog file="LibraryProjectErrorLog" type="error"
							text="Some error occurred in returning array fnName: getBooksToReturn  #cfcatch.Detail# #cfcatch.Message#" />
				<cfreturn [false] />
			</cfcatch>

		</cftry>

	</cffunction>

</cfcomponent>