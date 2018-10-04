<cfcomponent>

	<cffunction name="isUserLoggedIn" access="public" returntype="boolean">

		<cfreturn StructKeyExists(session,"name")>

	</cffunction>

</cfcomponent>