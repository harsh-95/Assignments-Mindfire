<!---
  --- Application 1
  --- -------------
  ---
  --- author: harsh
  --- date:   9/22/18
  --->
<cfcomponent
    displayname="Application" output="true" hint="Handle the application.">


    <!--- Set up the application. --->
  <cfset THIS.name = "LibraryManageme7341" />
  <cfset THIS.applicationTimeout = CreateTimeSpan(0, 0, 5, 0) />
  <cfset THIS.datasource = "Library" />
  <cfset THIS.sessionManagement = true />
  <cfset THIS.sessionTimeout = CreateTimeSpan(0, 0, 2, 0) />



    <cffunction
        name="OnApplicationStart" access="public" returntype="boolean" output="false"
		hint="Fires when the application is first created.">


		<cfset APPLICATION.loginService = CreateObject("component","/user/components/login_service") />
		<cfset APPLICATION.loginComponent = CreateObject("component","/common/components/login_component") />
		<cfset APPLICATION.manageBook = CreateObject("component","/admin/components/manage_books") />
		<cfset APPLICATION.LogoutService = CreateObject("component","/common/components/logout") />
		<cfset APPLICATION.RegisterUser = CreateObject("component","/user/components/register_component") />
		<cfset APPLICATION.issueBook = CreateObject("component","/user/components/issue_book") />

        <!--- Return out. --->
        <cfreturn true />
    </cffunction>


    <cffunction
        name="OnSessionStart" access="public" returntype="void" output="false"
        hint="Fires when the session is first created.">


        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
        name="OnRequestStart" access="public" returntype="boolean" output="false"
        hint="Fires at first part of page processing.">


        <!--- Define arguments. --->
        <cfargument name="TargetPage" type="string" required="true" />

        <!--- Return out. --->
        <cfreturn true />
    </cffunction>


    <cffunction
        name="OnRequest" access="public" returntype="void" output="true"
        hint="Fires when the session is first created.">


        <!--- Define arguments. --->
        <cfargument name="TargetPage" type="string" required="true" />

        <!--- Include the requested page. --->
        <cfinclude template="#ARGUMENTS.TargetPage#" />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
        name="OnRequestEnd" access="public" returntype="void" output="true"
        hint="Fires after the page processing is complete.">

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
        name="OnSessionEnd" access="public" returntype="void" output="false"
        hint="Fires when the session is terminated.">

        <!--- Define arguments. --->
        <cfargument
            name="SessionScope"
            type="struct"
            required="true"
            />

        <cfargument
            name="ApplicationScope"
            type="struct"
            required="false"
            default="#StructNew()#"
            />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
        name="OnApplicationEnd" access="public" returntype="void" output="false"
        hint="Fires when the application is terminated.">

        <!--- Define arguments. --->
        <cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>


    <cffunction
		name="OnError" access="public" returntype="void" output="true"
        hint="Fires when an exception occures that is not caught by a try/catch.">

        <!--- Define arguments. --->
        <cfargument name="Exception" type="any" required="true" />

        <cfargument name="EventName" type="string" required="false" default="" />

        <!--- Return out. --->
        <cfreturn />
    </cffunction>

</cfcomponent>