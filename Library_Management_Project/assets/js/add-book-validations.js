 //when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regNumber = /^[0-9]+$/;
var regPrice = /^[0-9]+.?[0-9]+$/
var regAlphabetsNoSpace= /^[a-zA-Z]+$/;
var regAlphabetsWithSpace = /^[a-zA-Z ]+$/;


//functions to be run on submit button to validate each input field  
$('#add-book').click(function() {
		var submitForm = true;
	
		var validateArray = [validateTitle(), validateCategory(), validateAuthor(),
			validateIsbn(), validatePrice(), validateNumOfBooks()];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}
			
			//returns true only when all functions returns true
			return submitForm;    
				
})


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

//function to validate Isbn
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
		return true;
}
});