<cfset loginId = #form.login_id#>
<cfset password = #form.password#>

<cfobject
    component = "loginComponent"
    name = "loginComponent" >

<cfinvoke component="loginComponent" method="validateAdminLogin" returnVariable="nextUrl">
    <cfinvokeargument name="loginId" value= '#loginId#' />
    <cfinvokeargument name="password" value='#password#' />
</cfinvoke>

<cflocation url='#nextUrl#' addtoken="no">
