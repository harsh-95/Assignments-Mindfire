<!---
  --- Application
  --- -------------
  ---
  --- author: harsh
  --- date:   9/22/18
  --->
<cfcomponent displayname="Application" hint="Handle the application.">


    <!--- Set up the application. --->
	<cfset THIS.name = "LibraryManagement4777" />
	<cfset THIS.applicationTimeout = CreateTimeSpan(0, 0, 50, 0) />
	<cfset THIS.datasource = "Library" />
	<cfset THIS.sessionManagement = true />
	<cfset THIS.sessionTimeout = CreateTimeSpan(0, 0, 20, 0) />



    <cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false"
		hint="Fires when the application is first created.">

		<cfset APPLICATION.loginService = CreateObject("component","common.components.login_service") />

		<cfset APPLICATION.getTableData = CreateObject("component","admin.components.get_table_data") />

		<cfset APPLICATION.manageBook = CreateObject("component","admin.components.manage_books") />

        <cfreturn true />
    </cffunction>



    <cffunction name="OnSessionStart" access="public" returntype="void" output="false"
        hint="Fires when the session is first created.">

        <cfreturn />
    </cffunction>



    <cffunction name="OnRequestStart" access="public" returntype="boolean" output="false"
        hint="Fires at first part of page processing.">

        <!--- Define arguments. --->
        <cfargument name="TargetPage" type="string" required="true" />

        <cfreturn true />
    </cffunction>



    <cffunction name="OnRequest" access="public" returntype="void" output="true"
        hint="Fires when page is processed">

        <!--- Define arguments. --->
        <cfargument name="TargetPage" type="string" required="true" />

        <!--- Include the requested page. --->
        <cfinclude template="#ARGUMENTS.TargetPage#" />

        <cfreturn />
    </cffunction>



    <cffunction name="OnRequestEnd" access="public" returntype="void" output="true"
        hint="Fires after the page processing is complete.">

        <cfreturn />
    </cffunction>



    <cffunction name="OnSessionEnd" access="public" returntype="void" output="false"
        hint="Fires when the session is terminated.">

        <!--- Define arguments. --->
        <cfargument name="SessionScope" type="struct" required="true"/>

        <cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#"/>

        <cfreturn />
    </cffunction>



    <cffunction name="OnApplicationEnd" access="public" returntype="void" output="false"
        hint="Fires when the application is terminated.">

        <!--- Define arguments. --->
        <cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />

        <cfreturn />
    </cffunction>



	<cffunction name="onMissingTemplate" access="public"
		hint="Fires when a requested template does not exist">

        <!--- Define arguments. --->
		<cfargument name="targetPage" type="string" required=true/>

		<!--- Use a try block to catch errors. --->
		<cftry>
			<!--- Log all errors. --->
			<cflog type="error" text="Missing template: #ARGUMENTS.targetPage#">
			<!--- Display an error message. --->
			<cfoutput>
				<h3>#ARGUMENTS.targetPage# could not be found.</h3>
				<p>You requested a non-existent ColdFusion page.<br />
				Please check the URL.</p>
			</cfoutput>
			<cfreturn true />
			<!--- If an error occurs, return false and the default error
			handler will run. --->
			<cfcatch>
				<cfreturn false />
			</cfcatch>
		</cftry>
	</cffunction>


<!---    <cffunction name="OnError" access="public" returntype="void" output="true"
       		 hint="Fires when an exception occures that is not caught by a try/catch.">

        <!--- Define arguments. --->
		<cfargument name="Exception" type="any" required=true/>

		<cfargument type="String" name="EventName" required=true/>

		<!--- Log all errors. --->
		<cflog file="LibraryProjectErrorLog" type="error" text="Event Name: #ARGUMENTS.Eventname# Message:#ARGUMENTS.Exception.message#" >

		<!---Display an error message if there is a page context. --->
		<cfif NOT (ARGUMENTS.EventName IS "onSessionEnd") OR
				  (ARGUMENTS.EventName IS "onApplicationEnd")>
			<cfoutput>
				<h2>An unexpected error occurred.</h2>
				<p>Please provide the following information to technical support:</p>
				<p>Error Event: #Arguments.EventName#</p>
			</cfoutput>
		</cfif>
	</cffunction> --->

</cfcomponent>
