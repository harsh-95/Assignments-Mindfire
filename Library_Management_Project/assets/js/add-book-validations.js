//when the DOM is ready this code should run
$(document).ready(function() {

//blur functions for each input field
$("#title").blur(function(){
		validateTitle();
  });  
  
$("#category").blur(function(){
	validateCategory();
  });
  
$("#author").blur(function(){
		validateAuthor();	
  });
  
$("#isbn").blur(function(){
			validateIsbn();
  });
  
$("#price").blur(function(){
		validatePrice();
  });
  
 $("#nob").blur(function(){
		validateNumOfBooks();
  });


//functions to be run on submit button to validate each input field  
$('#add-book').click(function(e) {
	
		e.preventDefault();
		
		var isbn1 = $("#isbn").val();
		
		var submitForm = areAllFieldsValid();
		
			if(submitForm){

				$.ajax({
				      type: "POST",
				      url: "../components/manage_books.cfc?method=checkBookRecord",
				      data: {isbn: isbn1},
				      success: function(res){
				    	  console.log('checked book record');
				    	  res = JSON.parse(res);
				    	  		// if book record is already present
			          			if(res[0]){
			          				// if the book was deleted
			          				if(res[1]){
			          					// update the details
			          					addTheBook('update');
			          				}
			          				// if the book wasn't deleted
			          				// show message can't add book
			          				else{
			          					$("h3.show-msg").text("This Book is already present.  You can update its info");
			          				}
			          				
			          			}
			          			//book record is not there
			          			//add the book 
			          			else{
			          				addTheBook('add');
			          			}
							},
						error: function(){
							$("h3.show-msg").text("Some server error occurred , you may try again later");
						}  
					}); 
			}
			else{
				alert('cant submit');
				//will return false and form will not be submitted
				return submitForm; 
			}
})


$('#request-book').click(function(e) {
	
		e.preventDefault();
		
		var isbn1 = $("#isbn").val();

		var submitForm = true;

		var validateArray = [validateTitle(), validateCategory(), validateAuthor(),
		validateIsbn()];
		
		for(i = 0 ; i < validateArray.length ; i++){
			submitForm = submitForm && validateArray[i];
		}
		
			if(submitForm){

				$.ajax({
				      type: "POST",
				      url: "../../admin/components/manage_books.cfc?method=checkBookRecord",
				      data: {isbn: isbn1},
				      success: function(res){
				    	  console.log('checked book record');
				    	  res = JSON.parse(res);
				    	  		// if book record is already present
			          			if(res[0]){
			          				// if the book was deleted
			          				if(res[1]){
			          					// update the details
			          					requestTheBook();
			          				}
			          				// if the book wasn't deleted
			          				// show message can't add book
			          				else{
			          					$("h3.show-msg").text("This Book is already present.  You can issue it.");
			          				}
			          				
			          			}
			          			//book record is not there
			          			//add the book 
			          			else{
			          				requestTheBook();
			          			}
							},
						error: function(){
							$("h3.show-msg").text("Some server error occurred , you may try again later");
						}  
					}); 
			}
			else{
				//will return false and form will not be submitted
				return submitForm; 
			}
})


});

//regular expressions for validations
var regNumber = /^[0-9]+$/;
var regPrice = /^[0-9]+.?[0-9]+$/
var regAlphabetsNoSpace= /^[a-zA-Z]+$/;
var regAlphabetsWithSpace = /^\d*[a-zA-Z]{1,}[']{0,1}\d*/;


// variables in which field values will be stored
var title1;
var category1;
var author1;
var isbn1;
var price1;
var nob1;


// make an ajax call to add the book 
function addTheBook(action){
	
		$.ajax({
	      type: "POST",
	      url: "../components/manage_books.cfc?method="+action+"Book",
	      data: {title: title1, category: category1, author: author1, isbn: isbn1, price: price1, number: nob1},
	      success: function(res){
				    	  res = JSON.parse(res);
			  	  		if(res){
			  	  			window.location = "../views/manage_books.cfm?id=1";
			  	  		}
			  	  		else{
			  	  			$("h3.show-msg").text('Sorry, some problem occurred '+action+'ing this book');
			  	  		}
	      			},
		  error: function(){
			  			$("h3.show-msg").text("Some server error occurred , you may try again later");
				} 
			});
}


// make an ajax call to request a book 
function requestTheBook(){
	
	 title1 =$("#title").val();
	 category1 =$("#category").val();
	 author1 = $("#author").val();
	 isbn1 = $("#isbn").val();

		$.ajax({
	      type: "POST",
	      url: "../../user/components/issue_book.cfc?method=requestBook",
	      data: {title: title1, category: category1, author: author1, isbn: isbn1},
	      success: function(res){
				    	  res = JSON.parse(res);
			  	  		if(res){
			  	  			window.location = "../views/request_book.cfm";
			  	  		}
			  	  		else{
			  	  			$("h3.show-msg").text('Sorry, some problem occurred requesting this book');
			  	  		}
	      			},
		  error: function(){
			  			$("h3.show-msg").text("Some server error occurred , you may try again later");
				} 
			});
}

//check if all fields are validated
function areAllFieldsValid(){

	var isFieldValid = true;
	
	 title1 =$("#title").val();
	 category1 =$("#category").val();
	 author1 = $("#author").val();
	 isbn1 = $("#isbn").val();
	 price1 = $("#price").val();
	 nob1 = $("#nob").val();
	
	var validateArray = [validateTitle(), validateCategory(), validateAuthor(),
		validateIsbn(), validatePrice(), validateNumOfBooks()];
		
		for(i = 0 ; i < validateArray.length ; i++){
			isFieldValid = isFieldValid && validateArray[i];
		}
		
	return isFieldValid;	
}
 
//function to validate title
function validateTitle(){
	var submit = false;
	var title =$("#title").val();
	title = title.trim();
	
		if(title ==''){
			submit = showError('title',"Please enter a book title");
		}
		else if(!(regAlphabetsWithSpace.test(title))){
			submit = showError('title',"Please enter valid book title");
		}
		else{
			submit = markFieldCorrect('title');
		}
		return submit;
}

//function to validate category
function validateCategory(){
	var submit = false;
	var category =$("#category").val();
	category = category.trim();
	
		if(category ==''){
			submit = showError('category',"Please enter a category");
		}
		else if(!(regAlphabetsNoSpace.test(category))){
			submit = showError('category',"Please enter only alphabets in category");
		}
		else{
			submit = markFieldCorrect('category');
		}
		return submit;
}

//function to validate author name
function validateAuthor(){

	var submit = false;
	var author =$("#author").val();
	author = author.trim();
	
		if(author ==''){
			submit = showError('author',"Please enter an author");
		}
		else if(!(regAlphabetsWithSpace.test(author))){
			submit = showError('author',"Please enter only alphabets in author name");
		}
		else{
			submit = markFieldCorrect('author');
		}
		return submit;
}


//function to validate Isbn
function validateIsbn(){
	var submit = false;
	var isbn = $("#isbn").val();
	
		if(isbn ==''){
			submit = showError('isbn',"Please fill isbn ");
		}
		else if(!(regNumber.test(isbn)) || isbn.length != 10 || isbn == '0000000000'){
			submit = showError('isbn',"Please enter a valid 10 digit isbn number");
		}
		else{
			submit = markFieldCorrect("isbn");
		}
		return submit;
}

//for validating book price
function validatePrice(){
	var submit = false;
	var price = $("#price").val();
	price = price.trim();
	
		if(price ==''){
			submit = showError('price',"Please fill price");
		}
		else if(!(regPrice.test(price))){
			submit = showError('price',"Please enter a valid price");
		}
		else{
			submit = markFieldCorrect("price");
		}
		return submit;
}

//function to validate number of books
function validateNumOfBooks(){
	var submit = false;
	var nob = $("#nob").val();
		nob = nob.trim();
	
		if(nob ==''){
			submit = showError('nob',"Please specify number of books");
		}
		else if(!(regNumber.test(nob)) || nob == '00' || nob == '0'){
			submit = showError('nob',"Please specify with a valid number");
		}
		else{
			submit = markFieldCorrect("nob");
		}
		return submit;
}

//function to show error in a field and return false
function showError(field,message){
		$("#error_"+field).text(message);
		$("#"+field).css("border", "1px solid red");
		return false;
}

//function to show that field is valid and return true
function markFieldCorrect(field){
		$("#error_"+field).text('');
		$("#"+field).css("border", "1px solid #b8bdc1");
		$("#"+field).val($("#"+field).val().replace(/\s+/g,' '));
		$("#"+field).val($("#"+field).val().replace(/\.+/g,'.'));
		$("#"+field).val($("#"+field).val().replace(/\'+/g,"'"));
		return true;
}

function updateBook(){
	
	var submitForm = areAllFieldsValid();
	
	if(submitForm){
		// update the details
		addTheBook('update');
	}
	
	else{
		return submitForm;
	}
		
}


function addTheRequested(){
	
	var isbn1 = $("#isbn").val();
	
	var submitForm = areAllFieldsValid();
	
	if(submitForm){
		// update the details
		addTheBook('add');
		deleteTheRequest(isbn1);
	}
	
	else{
		return submitForm;
	}
		
}


function deleteTheRequest(isbnno){
	
	$.ajax({
	      type: "POST",
	      url: "../../admin/components/manage_books.cfc?method=deleteRequest",
	      data: {isbnn:isbnno},
	      success: function(res){
		    	  res = JSON.parse(res);
	    	  		if(res){
	    	  			
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
