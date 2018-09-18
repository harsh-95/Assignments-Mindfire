<cfcomponent>
	<cffunction name="deleteBook" access="remote" returnformat='json' returnType="string">
		<cfargument name="isbn" type="string" required="true">

		<cfquery name="deleteBookInfo" datasource="Library">
			DELETE FROM Books WHERE isbn = '#arguments.isbn#'
		</cfquery>

		 <cfset var name1 = #arguments.isbn# & ' done'>

		  <cfreturn name1 />
	</cffunction>
</cfcomponent>
