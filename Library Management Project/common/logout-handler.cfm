
<cfobject
    component = "logout"
    name = "logout" >

<cfinvoke component="logout" method="logout" returnVariable="nextUrl">

</cfinvoke>

<cflocation url='#nextUrl#' addtoken="no">
