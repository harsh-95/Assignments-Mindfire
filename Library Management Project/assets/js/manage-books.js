	$(document).ready(function() {
		
		var data;
		var divdata = '<cfquery name="fetch" datasource="Library">'+
				'SELECT * FROM Books'+
			'</cfquery>'+
			
			'<cfif fetch.RecordCount GT 0>'+
				
	'<table id="example" class="display" style="width:100%">'+
        '<thead>'+
            '<tr>'+
                '<th>Book Name</th>'+
                '<th>ISBN</th>'+
                '<th>Author</th>'+
                '<th>Category</th>'+
                '<th>Publisher</th>'+
				'<th>Availability</th>'+
                '<th>Price</th>'+
				'<th>Action</th>'+
				
            '</tr>'+
        '</thead>'+
        '<tbody>'+
            '<cfoutput query="fetch">'+
				'<tr>'+
					'<td>#Title#</td>'+
					'<td>#ISBN#</td>'+
					'<td>#Author#</td>'+
					'<td>#Category#</td>'+
					'<td>#Publisher#</td>'+
					'<td>#Availability#</td>'+
					'<td>#Price#</td>'+
					'<td><a href="##" class="btn-edit">Edit</a>  <button class="delete" id="delete"> Delete </button></td>'+
				'</tr>'+
			'</cfoutput>'+
        '</tbody>'+
    '</table>'+
				
			'</cfif>';
		var table = $('#example').DataTable();
		 
		$('#example tbody').on('click', 'tr', function () {
			 data = table.row( this ).data();
			alert( 'You clicked on '+data[1]+'\'s row' );
		} );
		
		$('.btn-delete').click(function(){
			
			alert('hello'+ data[1]);
				$.ajax({
				url:"manageBooks.cfc?method=deleteBook",
				datatype:'json',
				data: {isbn: data[1]},
				success: function(res){
					alert(res);
				}
			});
			
		});
	});