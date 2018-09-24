
<!--- <cfobject component = "logout" name = "logout" > --->
<!--- <cfinvoke component="logout" method="logout" returnVariable="nextUrl"></cfinvoke> --->
<cfset nextUrl = APPLICATION.LogoutService.logout() />

<cflocation url="#nextUrl#" addtoken="no">
