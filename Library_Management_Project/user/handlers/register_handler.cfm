<cfset name = #FORM.name#>
<cfset email = #FORM.email#>
<cfset mobile = #FORM.mobile#>
<cfset password = #FORM.password#>
<cfset address = #FORM.address#>
<!---
<cfobject
    component = "register_component"
    name = "register_component" >

<cfinvoke component="register_component" method="registerUser" returnVariable="nextUrl">
    <cfinvokeargument name="name" value='#name#' />
    <cfinvokeargument name="email" value='#email#' />
	<cfinvokeargument name="mobile" value='#mobile#' />
	<cfinvokeargument name="password" value='#password#' />
	<cfinvokeargument name="address" value='#address#' />
</cfinvoke>
--->
<cfset nextUrl = APPLICATION.RegisterUser.registerUser(name,email,mobile,password,address)>

<cflocation url='#nextUrl#' addtoken="no">
