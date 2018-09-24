
<!--- <!--- Action part of the page. ---> --->
<!--- <!--- If an expression exception occurs, run the express_error.cfm page. ---> --->
<!--- <cferror type="EXCEPTION" exception="expression" template="/express_error.cfm"> --->
<!--- <!--- Make sure the form was submitted. ---> --->
<!--- <cfif isDefined("form.saveSubmit")> --->
<!--- <!--- Use cfparam tags to check the form field data types. ---> --->
<!--- <cfparam name="form.emailAddr" type="email"> --->
<!--- <cfparam name="form.UserID" type="integer"> --->
<!--- <cfparam name="form.phoneNo" type="telephone"> --->
<!--- <!--- Application code to update the database goes here. ---> --->
<!--- <cfoutput> --->
<!--- <h3>The e-mail address and phone number for user #Form.UserID# --->
<!--- have been added</h3> --->
<!--- </cfoutput> --->
<!--- </cfif> --->



<cferror type="EXCEPTION" exception="expression" template="/express_error.cfm">

<cfif isDefined("FORM.login-btn")>
	<cfparam name="emailId" default="#FORM.email_id#" type="string">
	<cfparam name="password" default="#FORM.password#" type="string">
	<!--- <cfset password = #form.password#> --->
	<!--- <cfset loginId = #form.user_id#> --->


<cfset nextUrl = APPLICATION.loginComponent.validateUserLogin(emailId, password)>

	<cflocation url="#nextUrl#" addtoken="no">
</cfif>