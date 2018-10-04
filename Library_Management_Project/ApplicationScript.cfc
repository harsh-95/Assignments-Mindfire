
component {
    this.name = "LibraryManagement27111";
    this.applicationTimeout = CreateTimeSpan(0, 0, 50, 0); //10 days
    this.datasource = "Library";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 20, 0); //30 minutes

    function onApplicationStart() {
     writeOutput('   APPLICATIONstart');
		 APPLICATION.loginService = CreateObject("component","/user/components/login_service");
		 APPLICATION.loginComponent = CreateObject("component","/common/components/login_component");
		 APPLICATION.addBook = CreateObject("component","/admin/components/add_book");
		 APPLICATION.LogoutService = CreateObject("component","/common/components/logout");
		 APPLICATION.RegisterUser = CreateObject("component","/user/components/register_component");
		 APPLICATION.issueBook = CreateObject("component","/user/components/issue_book");

        return true;
    }

    function onSessionStart() {
     writeOutput('   sessionstart');
//     WriteDump('CFID '&session.CFID);
//     WriteDump('CFTOKEN '&session.CFTOKEN);
//     WriteDump(session.URLTOKEN);
//     WriteDump(session.SESSIONID);
    }

    // the target page is passed in for reference,
    // but you are not required to include it
    function onRequestStart( string targetPage ) {
     //writeOutput('    onrequeststart '& arguments.targetPage);
    }

    function onRequest( string targetPage ) {
        include arguments.targetPage;
         writeOutput('      onrequest');
    }

    function onRequestEnd() {
     writeOutput('     request end');
    }

    function onSessionEnd( struct SessionScope, struct ApplicationScope ) {
     writeOutput('    session end');
    }

    function onApplicationEnd( struct ApplicationScope ) {
     writeOutput('    app end');
    }

//    function onError( any Exception, string EventName ) {
//     writeOutput('   on error');
//    }

}