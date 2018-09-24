<cfcomponent>

	<cffunction name="isUserLoggedIn" access="public" returntype="boolean">

<!---	<cfset user_type = session.user_type> --->

<!--- 		<cfdump var="#user_type#"><cfabort> --->


		<cfreturn StructKeyExists(session,"name")>

	</cffunction>

</cfcomponent>