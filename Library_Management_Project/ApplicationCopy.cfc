<cfcomponent>


this.name = "LibraryManagementd14";
    this.applicationTimeout = CreateTimeSpan(0, 0, 5, 0); //10 days
    this.datasource = "Library";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 2, 0); //30 minutes
	
	
	<cffunction name="onApplicationStart">
	
		application.loginService = CreateObject("component","/user/components/login_service");
		 application.loginComponent = CreateObject("component","/common/components/login_component");
		 application.addBook = CreateObject("component","/admin/components/add_book");
		 application.LogoutService = CreateObject("component","/common/components/logout");
		 application.RegisterUser = CreateObject("component","/user/components/register_component");
	
	</cffunction>
	
	<cffunction name="onMissingTemplate"> 
		<cfargument name="targetPage" type="string" required=true/> 
		<!--- Use a try block to catch errors. ---> 
		<cftry> 
		<!--- Log all errors. ---> 
		<cflog type="error" text="Missing template: #Arguments.targetPage#"> 
		<!--- Display an error message. ---> 
		<cfoutput> 
		<h3>#Arguments.targetPage# could not be found.</h3> 
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
	
	








</cfcomponent>
