
$(document).ready(function() {

});

function goToDashboard(){
	
	window.location = "/admin/views/dashboard.cfm";
	
}

function confirmBookCancel(){
	$.confirm({
    title: 'Confirm!',
    content: 'Simple confirm!',
    boxWidth: '30%',
	useBootstrap: false,
	type: 'purple',
	title: 'Are You Sure',
    content: 'Do you want to go back?',
    draggable: true,
    dragWindowGap: 100, // number of px of distance
    buttons: {
        confirm: function () {
				window.location = "/admin/views/manage_books.cfm";
        },
        cancel: function () {

        }
    }
});
}
