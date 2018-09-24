<!--- <cfset title = #form.title#> --->
<!--- <cfset category = #form.category#> --->
<!--- <cfset author = #form.author#> --->
<!--- <cfset isbn = #form.isbn#> --->
<!--- <cfset price = #form.price#> --->
<!--- <cfset number = #form.number#> --->

<cfif isDefined("URL.id")>

	<cfif isDefined("FORM.title")>

		<cfparam name="title" default="#form.title#" type="string">
		<cfparam name="category" default="#form.category#" type="string">
		<cfparam name="author" default="#form.author#" type="string">
		<cfparam name="isbn" default="#form.isbn#" type="string">
		<cfparam name="price" default="#form.price#" type="string">
		<cfparam name="number" default="#form.number#" type="string">

		<cfif URL.id EQ 1>

			<cfset nextUrl = APPLICATION.manageBook.addBook(title,category,author,isbn,price,number)>

		<cfelseif URL.id EQ 2>

			<cfset nextUrl = APPLICATION.manageBook.updateBook(title,category,author,isbn,price,number)>

		</cfif>

	<cfelse>

		<cfparam name="isbnn" default="#URL.isbnno#" type="string">


		<cfset nextUrl = APPLICATION.manageBook.deleteBook(isbnn)>

	</cfif>

<cflocation url='#nextUrl#' addtoken="no">

</cfif>