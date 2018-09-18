<cfset name = #form.name#>
<cfset email = #form.email#>
<cfset mobile = #form.mobile#>
<cfset password = #form.password#>
<cfset address = #form.address#>

<cfobject
    component = "registerComponent"
    name = "registerComponent" >

<cfinvoke component="registerComponent" method="registerUser" returnVariable="nextUrl">
    <cfinvokeargument name="name" value='#name#' />
    <cfinvokeargument name="email" value='#email#' />
	<cfinvokeargument name="mobile" value='#mobile#' />
	<cfinvokeargument name="password" value='#password#' />
	<cfinvokeargument name="address" value='#address#' />
</cfinvoke>

<cflocation url='#nextUrl#' addtoken="no">
