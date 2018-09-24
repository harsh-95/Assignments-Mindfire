 //when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regEmail = /^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)*@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$/;
var regPass = /([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*/;


//functions to be run on submit button to validate each input field  
$('#login').click(function() {
		var submitForm = true;
	
		var validateArray = [validateEmail(), validatePassword()];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}
			
			//returns true only when all functions returns true
			return submitForm;    	
})


//blur functions for each input field
$("#email_id").blur(function(){
		validateEmail();	
  });
  
$("#password").blur(function(){
			validatePassword();
  });
 

//function to validate Email
function validateEmail(){
	var submit = false;
	var email =$("#email_id").val();
	
		if(email ==''){
			submit = showError('email_id','Please fill email');
		}
		else if((!(regEmail.test(email))) || checkFreq(email) > 1){
			submit = showError('email_id',"Please enter email in proper format");
		}
		else{
			submit = markFieldCorrect("email_id");
		}
		return submit;
}
//for checking frequency of @ in email field
function checkFreq(email){
	var count=0;
	for(var i=0;i<email.length;i++){
		if(email[i] === '@'){
			count++;
		}
	}
	return count;
}

//function to validate Password
function validatePassword(){
	var submit = false;
	var password = $("#password").val();
		password = password.trim();
		if(password ==''){
			submit = showError('password',"Please fill Password");
		}
		else if(!(regPass.test(password)) || password.length < 8){
			submit = showError('password',"Password must be alphanumeric and min 8 charaters");
		}
		else{
			submit = markFieldCorrect("password");
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
		return true;
}

});


