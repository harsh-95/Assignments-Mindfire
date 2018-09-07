 //when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regNumber = /^[0-9]+$/
var regAlphabets = /^[a-zA-Z ]+$/;
var regEmail = /^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)*@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$/;
var regPass = /([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*/;

//functions to be run on submit button to validate each input field  
$('#submit').click(function() {
		
		var submitForm = true;
			
		var validateArray = [validateFullname(), validateEmail(),
			validatePassword(),validatePhone()];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}

			//returns true only when all functions returns true
			return submitForm; 
					
})


//blur functions for each input field

$("#fullname").blur(function(){
		validateFullname();
  });

$("#email").blur(function(){
		validateEmail();
  });
  
$("#phone").blur(function(){
		validatePhone();	
  });
  
$("#password").blur(function(){
		validatePassword();
  });
  

  
//function to validate Full Name
function validateFullname(){
	var submit = false;
	var fullname =$("#fullname").val();
		fullname = fullname.trim();
		if(fullname ==''){
			submit = showError('fullname',"Please fill fullname");
		}
		else if(!(regAlphabets.test(fullname))){
			document.getElementById('fullname').value = fullname.replace(/\s+/g,' ');
			submit = showError('fullname',"Please enter only alphabets in full	name");
		}
		else{
			document.getElementById('fullname').value = fullname.replace(/\s+/g,' ');
			submit = markFieldCorrect('fullname');
		}
		return submit;
}



//function to validate Email
function validateEmail(){
	var submit = false;
	var email =$("#email").val();
	
		if(email ==''){
			submit = showError('email','Please fill email');
		}
		else if((!(regEmail.test(email))) || checkFreq(email) > 1){
			submit = showError('email',"Please enter email in proper format");
		}
		else{
			submit = markFieldCorrect("email");
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

//function to validate Phone
function validatePhone(){
	var submit = false;
	var phone = $("#phone").val();
	
		if(phone ==''){
			submit = showError('phone',"Please fill Phone number");
		}
		else if(!(regNumber.test(phone)) || phone.length < 10){
			submit = showError('phone',"Please enter a valid 10 digit mobile number");
		}
		else{
			submit = markFieldCorrect("phone");
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
	//	$("#"+field).css("background-color", "#ff9999");
		return false;
}

//function to show that field is valid and return true
function markFieldCorrect(field){
		$("#error_"+field).text('');
	//	$("#"+field).css("background-color", "white");
		return true;
}

});


