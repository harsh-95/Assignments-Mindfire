<cfset title = #form.title#>
<cfset category = #form.category#>
<cfset author = #form.author#>
<cfset isbn = #form.isbn#>
<cfset price = #form.price#>
<cfset number = #form.number#>

<cfobject
    component = "addBook"
    name = "addBook" >

<cfinvoke component="addBook" method="addBook" returnVariable="nextUrl">
    <cfinvokeargument name="title" value='#title#' />
	<cfinvokeargument name = "category" value = "#category#" />
	<cfinvokeargument name = "author" value = "#author#" />
	<cfinvokeargument name = "isbn" value = "#isbn#" />
	<cfinvokeargument name = "price" value = "#price#" />
	<cfinvokeargument name = "number" value = "#number#" />
</cfinvoke>

<cflocation url='#nextUrl#' addtoken="no">
