
var table;
$(document).ready(function() {
    table = $("#example").DataTable()
    $(".btn-edit").click(function() {
    	
        table.fnDestroy();
        table = $("#example").DataTable();
    });
});