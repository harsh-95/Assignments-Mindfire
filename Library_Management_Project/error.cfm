
<cfif isDefined(URL.errID)>

	<cfif URL.errID EQ 1>
		<!--- for input error --->
		<cfoutput>
			You entered invalid data.<br>
			Please click the browser Back button and try again<br>
			<!---#cferror.RootCause.detailMessage#--->
		</cfoutput>

	<cfelseif URL.errID EQ 2>
		<!--- for database error --->
		<cfoutput>
			Oops Some error Occurred fetching the data.<br>
			Please Go Back and Try Again.<br>
			<!---#cferror.RootCause.detailMessage#--->
		</cfoutput>

	<cfelseif URL.errID EQ 3>
		<!--- for ajax error --->
		<cfoutput>
			Oops Some error Occurred fetching the data.
			Please Go Back and Try Again
			<!---#cferror.RootCause.detailMessage#--->
		</cfoutput>

	</cfif>

<cfelse>

		<cfoutput>
			oops some error occurred.<br>
			Please click the browser Back button and try again<br>
			<!---#cferror.RootCause.detailMessage#--->
		</cfoutput>

</cfif>