
function confirmLogout(){
	$.confirm({
    title: 'Confirm!',
    content: 'Simple confirm!',
    boxWidth: '30%',
	useBootstrap: false,
	type: 'purple',
	title: 'Are You Sure',
    content: 'Do you want to Logout?',
    draggable: true,
    dragWindowGap: 100, // number of px of distance
    buttons: {
        confirm: function () {
        		doLogout();
        },
        cancel: function () {

        }
    }
});
}

function doLogout(){
	
	$.ajax({
	      type: "POST",
	      url: "../../common/components/logout.cfc?method=logout",

	      success: function(res){
	    	  			res = JSON.parse(res);
	    	  			if(res){

	    	  				window.location = "/index.cfm";
	    	  			}
	    	  			else{
		    	  			alert('logout failed');
	    	  			}
	      			},
	      error: function(){
						$("h3.show-msg").text("Some server error occurred , you may try again later");
					}
			});
}
