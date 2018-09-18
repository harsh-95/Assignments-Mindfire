
component {
    this.name = "myApplication";
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
    this.datasource = "my_datasource";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 10, 0); //30 minutes
    this.customTagPaths = [ expandPath('/myAppCustomTags') ];
    this.mappings = {
        "/foo" = expandPath('/com/myCompany/foo')
    };

    function onApplicationStart() {
        writeOutput('appstart');
        return true;
    }

    function onSessionStart() {
     writeOutput('   sessionstart');
     WriteDump(session.CFID);
     WriteDump(session.CFTOKEN);
    }

    // the target page is passed in for reference,
    // but you are not required to include it
    function onRequestStart( string targetPage ) {
     writeOutput('    onrequeststart '& arguments.targetPage);
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

    function onError( any Exception, string EventName ) {
     writeOutput('   on error');
    }

}