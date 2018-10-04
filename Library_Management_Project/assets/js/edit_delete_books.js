$(document).ready(function() {

	createAllBooks();
	  
});

function createAllBooks(){

	 var bookIssue =  $('#example').DataTable( {
		
		 destroy: true,
		 ajax: {
				"url" : "../components/get_table_data.cfc?method=getBooks",
				"type" : "POST",
				"dataSrc" : ""
			},
		    "columnDefs": [
		        { "width": "150px", "targets": 0 },
		        { "width": "70px", "targets": 1 },
		        { "width": "100px", "targets": 2 },
		        { "width": "70px", "targets": 3 },
		        { "width": "35px", "targets": 4 },
		        { "width": "55px", "targets": 5 },
		        { "width": "29px", "targets": 6 },
		        { "width": "100px", "targets": 7 },
		        { "width": "40px", "targets": 8 },
		        { "width": "40px", "targets": 9 }
		      ],
			    columns: [
			        { title: "Book Name" },
			        { title: "ISBN" },
			        { title: "Author" },
			        { title: "Category." },
			        { title: "Total Books" },
			        { title: "Available" },
			        { title: "Price" },
			        { title: "Date Added" },
			        { title: "Edit", searchable: false, render: function(data, type, full, meta){return returnEditColumn();} },
			        { title: "Delete", searchable: false, render: function(data, type, full, meta){return returnDeletecolumn();} }
			        ]
				});
	 
	 $.fn.dataTable.ext.errMode = 'none';
	 
	 $('#example')
	     .on( 'error.dt', function ( e, settings, techNote, message ) {
	         console.log( 'An error has been reported by DataTables: ', message );
 	     	 window.location = "../../error.cfm?errID=3";
	     } )
	     .DataTable();
	 	

 	  	$('#example').off("click").on("click", "td", function(e){
 	  		
 	  		e.preventDefault();
 	  		
	 	  	var columnIndex = bookIssue.cell(this).index().column;
	 	  	var columnHeader = bookIssue.column(columnIndex).header();
	 	  	var headerData = $(columnHeader).html();
 	  		
 	  		var rowdata = bookIssue.cell(this).index().row;
 	  		var isbnNumber = bookIssue.row(rowdata).data()[1];

 	  		if(headerData == 'Edit'){
 	 	  		confirmBookAction('edit', isbnNumber)
 	 	  		console.log(isbnNumber);
 	  		}
 	  		else if(headerData == 'Delete'){
 	 	  		confirmBookAction('delete', isbnNumber)
 	 	  		console.log(isbnNumber);
 	  		}

 	  	})
}

function returnEditColumn(data, type, full, meta){
	var button1 = '<button class="btn-edit" id="edit">Edit</button>';
	return button1;
}

function returnDeletecolumn(data, type, full, meta){
	var button2 = '<button class="btn-delete" id="delete">Delete</button>';
	return button2;
}


function confirmBookAction(action, isbnno){
	$.confirm({
    title: 'Confirm!',
    content: 'Simple confirm!',
    boxWidth: '30%',
	useBootstrap: false,
	type: 'purple',
	title: 'Are You Sure',
    content: 'Do you want to '+action+' this book?',
    draggable: true,
    dragWindowGap: 100, // number of px of distance
    buttons: {
        confirm: function () {
        	if(action == 'delete'){
        		deleteThisBook(isbnno);
        	}
        	else if(action == 'edit'){
        		window.location = "../../admin/views/edit_book.cfm?isbn="+isbnno;
        	}
        },
        cancel: function () {

        }
    }
});
}
	
	function deleteThisBook(isbnno){
		
		$.ajax({
		      type: "POST",
		      url: "../../admin/components/manage_books.cfc?method=deleteBook",
		      data: {isbnn:isbnno},
		      success: function(res){
			    	  res = JSON.parse(res);
		    	  		if(res){
		    	  			createAllBooks();
		    	  		}
		    	  		else{
		    	  			$("h3.show-msg").text('Sorry,some problem occurred deleting this book');
		    	  		}	
		      		},
		      error: function(){
	    	  		$("h3.show-msg").text("Some server error occurred , you may try again later");
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