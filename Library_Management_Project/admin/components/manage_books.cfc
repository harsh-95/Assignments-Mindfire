

<cfcomponent displayname="addBook" accessors=true output=false persistent=false >

	<cffunction name="addBook" output="false" access="public" returntype="String">


		<cfargument name="title" type="string" required="true" />
		<cfargument name="category" type="string" required="true" />
		<cfargument name="author" type="string" required="true" />
		<cfargument name="isbn" type="numeric" required="true" />
		<cfargument name="price" type="numeric" required="true" />
		<cfargument name="number" type="numeric" required="true" />



		<!---Check if book is already present--->
		<cfquery name="checkBookAvailability" datasource="Library">
			SELECT isbn
			FROM books
			WHERE isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbn#">
		</cfquery>

		<cfif checkBookAvailability.RecordCount GT 0>

			<cfoutput query="checkBookAvailability">

				<cfset LOCAL.nextUrl = "../views/add_book.cfm?id=1&bookid=#isbn#" />

			</cfoutput>

		<cfelse>
			<!---Store Book Details into the database--->
			<cfquery name="storeData" datasource="Library">
				INSERT INTO Books(title,category,author,isbn,price,total_books,available,Date_Added,isDeleted)
				VALUES(
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.title#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.category#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.author#" />,
				        <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbn#" />,
				        <cfqueryparam cfsqltype="cf_sql_float" value="#ARGUMENTS.price#" />,
				        <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />,
				        <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />,
				        <cfqueryparam cfsqltype="cf_sql_date" value="#DateFormat(Now())#" />,
				        <cfqueryparam cfsqltype="cf_sql_varchar" value="no" />
				 	  );
			</cfquery>

				<cfset LOCAL.nextUrl = "../views/manage_books.cfm?id=1" />

		</cfif>

			<cfreturn nextUrl />
	</cffunction>


	<cffunction name="updateBook" output="false" access="public" returntype="String">

		<cfargument name="title" type="string" required="true" />
		<cfargument name="category" type="string" required="true" />
		<cfargument name="author" type="string" required="true" />
		<cfargument name="isbn" type="numeric" required="true" />
		<cfargument name="price" type="numeric" required="true" />
		<cfargument name="number" type="numeric" required="true" />



				<!---Store Book Details into the database--->
			<cfquery name="storeData" datasource="Library">
				UPDATE Books
				SET title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.title#" />,
			        category = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.category#" />,
			        author = <cfqueryparam cfsqltype="cf_sql_varchar" value="#ARGUMENTS.author#" />,
			        isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbn#" />,
			        price = <cfqueryparam cfsqltype="cf_sql_float" value="#ARGUMENTS.price#" />,
			        total_books = <cfqueryparam cfsqltype="cf_sql_integer" value="#ARGUMENTS.number#" />
				WHERE isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#URL.isbnno#" />

			</cfquery>


				<cfset LOCAL.nextUrl = "../views/manage_books.cfm?id=2" />

			<cfreturn nextUrl />
	</cffunction>


	<cffunction name="deleteBook" output="false" access="public" returnType="string">

		<cfargument name="isbnn" type="numeric" required="true">


		<cfquery name="deleteBookInfo" datasource="Library">
			UPDATE Books
			SET IsDeleted = <cfqueryparam cfsqltype="cf_sql_varchar" value="yes" />
			WHERE isbn = <cfqueryparam cfsqltype="cf_sql_bigint" value="#ARGUMENTS.isbnn#">
		</cfquery>

		 <cfset LOCAL.nextUrl = "../views/manage_books.cfm?id=3" />

			<cfreturn nextUrl />
	</cffunction>

</cfcomponent>