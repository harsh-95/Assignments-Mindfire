<cfcomponent>
	<cffunction name="logout" access="remote" returnformat='json' returnType="string">

		<cfset StructDelete(session,"name")>
			<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

		 <cfset var nextUrl = '/Library Management Project/homepage.cfm'>

		  <cfreturn nextUrl />
	</cffunction>
</cfcomponent>
