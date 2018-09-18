

<cfcomponent displayname="RegisterUserAndSendUrl" accessors=true output=false persistent=false >

	<cffunction name="addBook" output="false" access="public" returntype="String">
		<cfargument name="title" type="string" required="true" />
		<cfargument name="category" type="string" required="true" />
		<cfargument name="author" type="string" required="true" />
		<cfargument name="isbn" type="string" required="true" />
		<cfargument name="price" type="string" required="true" />
		<cfargument name="number" type="string" required="true" />

		<!---Check if already a book--->
		<cfquery name="checkBookAvailability" datasource="Library">
			SELECT isbn FROM books WHERE isbn = '#arguments.isbn#'
		</cfquery>

		<cfif checkBookAvailability.RecordCount GT 0>
			<cfoutput query="checkBookAvailability">
				<cfset var nextUrl = "add-book.cfm?id=1&bookid=#isbn#" />
			</cfoutput>
		<cfelse>
			<!---Store User Data--->
			<cfquery name="storeData" datasource="Library">
				INSERT INTO Books(title,category,author,isbn,price,total_books,available,Date_Added,isDeleted)
						values('#arguments.title#', '#arguments.category#', '#arguments.author#','#arguments.isbn#',
						 '#arguments.price#','#arguments.number#','#arguments.number#','#DateFormat(Now())#','no');
			</cfquery>

				<cfset var nextUrl = "manage-books.cfm?id=1" />

		</cfif>

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>