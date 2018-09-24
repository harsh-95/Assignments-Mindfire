<cfif isDefined('URL.id')>

	<cfset isbn = #URL.isbn#>

	<cfif URL.id EQ "issue">
		<cfset nextUrl = APPLICATION.issueBook.issueBook(isbn)>
	<cfelseif URL.id EQ "return">
		<cfset nextUrl = APPLICATION.issueBook.returnBook(isbn)>
	</cfif>

	<cflocation url="#nextUrl#" addtoken="no">

</cfif>