$(document).ready(function() {

	createBooksToReturn();
	  
});

function createBooksToReturn (){

	 var bookIssue =  $('#example').DataTable( {
		
		 destroy: true,
		 ajax: {
				"url" : "../components/get_books.cfc?method=getBooksToReturn",
				"type" : "POST",
				"dataSrc" : ""
			},
			 "columnDefs": [
			        { "width": "150px", "targets": 0 },
			        { "width": "60px", "targets": 1 },
			        { "width": "100px", "targets": 2 },
			        { "width": "70px", "targets": 3 },
			        { "width": "50px", "targets": 4 },
			        { "width": "25px", "targets": 5 }
			      ],
			    columns: [
			        { title: "Book Name", "searchable": true, "targets": 0, "className": "text-center" },
			        { title: "ISBN", "searchable": true, "targets": 1, "className": "text-center" },
			        { title: "Author", "searchable": true, "targets": 2, "className": "text-center" },
			        { title: "Category", "searchable": true, "targets": 3, "className": "text-center" },
			        { title: "Price", "searchable": true, "targets": 4, "className": "text-center" },
			        { title: "Action", searchable: false, render: function(data, type, full, meta){return returnBookcolumn();} }
			        ]
				});
	 
	 
				 $.fn.dataTable.ext.errMode = 'none';
				 
				 $('#example')
				     .on( 'error.dt', function ( e, settings, techNote, message ) {
				         console.log( 'An error has been reported by DataTables: ', message );
				         //window.location = "../../error.cfm?errID=3";
				         $("h3.show-msg").text("OOPS some error occurred in fetching values");
				     } )
				     .DataTable();
	 
	    

 	  	$('#example').off("click").on("click", "td", function(e){
 	  		e.preventDefault();
 	  		
	 	  	var columnIndex = bookIssue.cell(this).index().column;
	 	  	var columnHeader = bookIssue.column(columnIndex).header();
	 	  	var headerData = $(columnHeader).html();
	 	  		
 	  		
 	  		var rowdata = bookIssue.cell(this).index().row;
 	  		var isbnNumber = bookIssue.row(rowdata).data()[1];

 	  		if(headerData == 'Action'){
 	 	  		confirmBookAction('return', isbnNumber)
 	  		}

 	  	})
}

function returnBookcolumn(data, type, full, meta){
	var button = '<button class="btn-edit" id="return">Return</button>';
	return button;	
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
        	if(action == 'return'){
        		returnBook(isbnno);
        	}
        },
        cancel: function () {

        }
    }
});
}
	
	function returnBook(isbnno){
					
		$.ajax({
		      type: "POST",
		      url: "../../user/components/book_options.cfc?method=returnBook",
		      data: {isbn:isbnno},
		      success: function(res){
		    	  res = JSON.parse(res);
		    	  		if(res){
		    	  			createBooksToReturn();
		    	  		}
		    	  		else{
		    	  			$("h3.show-msg").text('Sorry,some problem occurred returning this book');
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