<cfcomponent>

	<cffunction name="isUserLoggedIn" access="public" output="false" returntype="boolean">

		<cfreturn StructKeyExists(session,"name")>

	</cffunction>

</cfcomponent>