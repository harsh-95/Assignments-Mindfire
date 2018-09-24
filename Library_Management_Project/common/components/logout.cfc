<cfcomponent>
	<cffunction name="logout" access="remote" returnformat="JSON" returnType="string">

		<cfset StructDelete(SESSION,"name")>
			<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

		 <cfset LOCAL.nextUrl = '/index.cfm'>

		  <cfreturn nextUrl />
	</cffunction>
</cfcomponent>
