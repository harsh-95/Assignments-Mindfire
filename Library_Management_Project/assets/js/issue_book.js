$(document).ready(function() {

	createBooksToIssue();
	  
});

function createBooksToIssue (){

	 var bookIssue =  $('#example').DataTable( {
		
		 destroy: true,
		 ajax: {
				"url" : "../components/get_books.cfc?method=getBooksToIssue",
				"type" : "POST",
				"dataSrc" : ""
			},
			 "columnDefs": [
			        { "width": "150px", "targets": 0, "className": "text-center" },
			        { "width": "60px", "targets": 1, "className": "text-center" },
			        { "width": "100px", "targets": 2, "className": "text-center" },
			        { "width": "70px", "targets": 3, "className": "text-center" },
			        { "width": "50px", "targets": 4, "className": "text-center" },
			        { "width": "25px", "targets": 5, "className": "text-center" }
			      ],
			    columns: [
			        { title: "Book Name" },
			        { title: "ISBN" },
			        { title: "Author" },
			        { title: "Category." },
			        { title: "Price." },
			        { title: "Action", render: function(data, type, full, meta){return issueBookcolumn();} }
			        ]
				});
	 
	 
			 $.fn.dataTable.ext.errMode = 'none';
			 
			 $('#example')
			     .on( 'error.dt', function ( e, settings, techNote, message ) {
			         console.log( 'An error has been reported by DataTables: ', message );
			         //window.location = "../../error.cfm?errID=1";
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
 	 	  		confirmBookAction('issue', isbnNumber);
	
 	  		}


 	  	})
}

function issueBookcolumn(data, type, full, meta){
	var button = '<button class="btn-edit" id="issue">Issue</button>';
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
        	if(action == 'issue'){
        		issueMyBook(isbnno);
        	}
        },
        cancel: function () {

        }
    }
});
}

	function issueMyBook(isbnno){	
		console.log('ajax call');  
		$.ajax({
			  type: "POST",
		      url: "../../user/components/book_options.cfc?method=issueBook",
		      data: {isbn:isbnno},
		      success: function(res){
		    	  res = JSON.parse(res);
		    	  		if(res){
		    	  			console.log('success');
		    	  			createBooksToIssue();
		    	  		}
		    	  		else{
		    	  			$("h3.show-msg").text('Sorry,this book just got Out of Stock');
		    	  			createBooksToIssue();
		    	  		}		    	  
		      		},
		      error: function(res){
		    	  		$("h3.show-msg").text("Some server error occurred , you may try again later");
		      		}
				});
	}
	
	function goToDashboard(){
		
		window.location = "/user/views/dashboard.cfm";
		
	}