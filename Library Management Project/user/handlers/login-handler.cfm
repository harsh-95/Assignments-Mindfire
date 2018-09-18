<cfset loginId = #form.user_id#>
<cfset password = #form.password#>

<cfobject
    component = "loginComponent"
    name = "loginComponent" >

<cfinvoke component="loginComponent" method="validateUserLogin" returnVariable="nextUrl">
    <cfinvokeargument name="userId" value= '#loginId#' />
    <cfinvokeargument name="userpassword" value='#password#' />
</cfinvoke>

<cflocation url='#nextUrl#' addtoken="no">
