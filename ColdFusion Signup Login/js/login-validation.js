
 //when the DOM is ready this code should run
$(document).ready(function() {

//functions to be run on submit button to validate each input field  
$('#submit').click(function() {
		
		var submitForm = true;
			
		var validateArray = [validateEmail(),
			validatePassword()];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}

			//returns true only when all functions returns true
			return submitForm; 
					
})

$("#email").keyup(function(){
		var x = document.getElementsByClassName('loginerror');
		x[0].innerHTML = '';
  });

//blur functions for each input field


$("#email").blur(function(){
		validateEmail();
  });
  
$("#password").blur(function(){
		validatePassword();
  });

//function to validate Email
function validateEmail(){
	var submit = false;
	var email =$("#email").val();
	
		if(email ==''){
			submit = showError('email','Please fill email');
		}
		else{
			submit = markFieldCorrect("email");
		}
		return submit;
	
}

//function to validate Password
function validatePassword(){
	var submit = false;
	var password = $("#password").val();
		password = password.trim();
		if(password ==''){
			submit = showError('password',"Please fill Password");
		}
		else{
			submit = markFieldCorrect("password");
		}
		return submit;
}

//function to show error in a field and return false
function showError(field,message){
		$("#error_"+field).text(message);
		return false;
}

//function to show that field is valid and return true
function markFieldCorrect(field){
		$("#error_"+field).text('');
		return true;
}

});
var uri = window.location.toString();
if (uri.indexOf("?") > 0) {
	var clean_uri = uri.substring(0, uri.indexOf("?"));
	window.history.replaceState({}, document.title, clean_uri);
}
 

