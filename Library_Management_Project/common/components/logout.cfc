<cfcomponent displayname="LogoutComponent" output=false >
	<cffunction name="logout" access="remote" returnformat="JSON" returntype="boolean">

		<cfset StructDelete(SESSION,"name")>
			<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

		  <cfreturn true />
	</cffunction>
</cfcomponent>
