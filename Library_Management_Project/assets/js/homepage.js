
$().ready(function() {
    if(document.referrer != 'http://localhost:8500/'){
        history.pushState(null, null, '');
        window.addEventListener('popstate', function () {
            history.pushState(null, null, '');
        });
    }
   
});
