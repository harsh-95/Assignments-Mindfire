$(document).ready(function() {

	fetchAllRequests();
	  
});

function fetchAllRequests(){

	 var bookIssue =  $('#example').DataTable( {
		
		 destroy: true,
		 ajax: {
				"url" : "../components/get_table_data.cfc?method=getRequestedBooks",
				"type" : "POST",
				"dataSrc" : ""
			},
		    "columnDefs": [
		        { "width": "80px", "targets": 0, "className": "text-center" },
		        { "width": "70px", "targets": 1, "className": "text-center" },
		        { "width": "80px", "targets": 2, "className": "text-center" },
		        { "width": "100px", "targets": 3, "className": "text-center" },
		        { "width": "140px", "targets": 4, "className": "text-center" },
		        { "width": "90px", "targets": 5, "className": "text-center" },
		        { "width": "30px", "targets": 6, "className": "text-center" }
		      ],
			    columns: [
			        { title: "Book Name" },
			        { title: "Category." },					        
			        { title: "Author" },	        
			        { title: "ISBN" },
			        { title: "Requested By" },
			        { title: "Date Requested" },
			        { title: "Add", searchable: false, render: function(data, type, full, meta){return returnAddColumn();} }
			        ]
				});
	 
	 $.fn.dataTable.ext.errMode = 'none';
	 
	 $('#example')
	     .on( 'error.dt', function ( e, settings, techNote, message ) {
	         console.log( 'An error has been reported by DataTables: ', message );
 	     	 //window.location = "../../error.cfm?errID=3";
	     } )
	     .DataTable();
	 	

 	  	$('#example').off("click").on("click", "td", function(e){
 	  		
 	  		e.preventDefault();
 	  		
	 	  	var columnIndex = bookIssue.cell(this).index().column;
	 	  	var columnHeader = bookIssue.column(columnIndex).header();
	 	  	var headerData = $(columnHeader).html();
 	  		
 	  		var rowdata = bookIssue.cell(this).index().row;
 	  		var isbnNumber = bookIssue.row(rowdata).data()[3];

 	  		if(headerData == 'Add'){
 	 	  		confirmBookAction(isbnNumber)
 	 	  		console.log(isbnNumber);
 	  		}

 	  	})
}

function returnAddColumn(data, type, full, meta){
	var button1 = '<button class="btn-edit" id="add">Add</button>';
	return button1;
}

function confirmBookAction(isbnno){
	$.confirm({
    title: 'Confirm!',
    content: 'Simple confirm!',
    boxWidth: '30%',
	useBootstrap: false,
	type: 'purple',
	title: 'Are You Sure',
    content: 'Do you want to add this book?',
    draggable: true,
    dragWindowGap: 100, // number of px of distance
    buttons: {
        confirm: function () {
        	
        		window.location = "../../admin/views/add_requested_book.cfm?isbn="+isbnno;
        },
        cancel: function () {

        }
    }
});
}
	
	function goToDashboard(){
		
		window.location = "/user/views/dashboard.cfm";
		
	}
	
	var uri = window.location.toString();
	if (uri.indexOf("?") > 0) {
		var clean_uri = uri.substring(0, uri.indexOf("?"));
		window.history.replaceState({}, document.title, clean_uri);
	}
	