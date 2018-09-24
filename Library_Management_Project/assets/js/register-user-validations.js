 //when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regNumber = /^[0-9]+$/
var regAlphabets = /^[a-zA-Z ]+$/;
var regEmail = /^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)+@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$/;
var regPass = /([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*/;
var regAddress = /[a-zA-Z]+/


//functions to be run on submit button to validate each input field  
$('#submit').click(function() {
		var submitForm = true;
	
		var validateArray = [validateName(), validateEmail(), validateMobile(),
			validatePassword(), validateAddress()];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}
			
			//returns true only when all functions returns true
			return submitForm;    
				
})


//blur functions for each input field
$("#name").blur(function(){
		validateName();
  });  
  
$("#email").blur(function(){
	validateEmail();
  });
  
$("#mobile").blur(function(){
		validateMobile();	
  });
  
$("#password").blur(function(){
			validatePassword();
  });
  
$("#address").blur(function(){
		validateAddress();
  });
  
//function to validate name
function validateName(){
	var submit = false;
	var name =$("#name").val();
	name = name.trim();
	
		if(name ==''){
			submit = showError('name',"Please fill name");
		}
		else if(!(regAlphabets.test(name))){
			submit = showError('name',"Please enter only alphabets in name");
		}
		else{
			submit = markFieldCorrect('name');
		}
		return submit;
}

//function to validate Email
function validateEmail(){
	var submit = false;
	var email =$("#email").val();
	email = email.trim();
	
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

//function to validate mobile
function validateMobile(){
	var submit = false;
	var mobile = $("#mobile").val();
	
		if(mobile ==''){
			submit = showError('mobile',"Please fill mobile number");
		}
		else if(!(regNumber.test(mobile)) || mobile.length != 10 || mobile == '0000000000'){
			submit = showError('mobile',"Please enter a valid 10 digit mobile number");
		}
		else{
			submit = markFieldCorrect("mobile");
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
			$("#error_password").text('');
			$("#password").css("border", "1px solid #b8bdc1");
			submit = true;
		}
		return submit;
}

//for validating Address and replaces multple spaces to one space
function validateAddress(){
	var submit = false;
	var address = $("#address").val() ;
	address = address.trim();
	
		if(address ==''){
		submit = showError('address',"Please fill address");
		}
		else if(!regAddress.test('address')){
			document.getElementById('address').value = address.replace(/\s+/g,' ');
			submit = showError('address',"Please enter a valid address");
		}
		else{
			document.getElementById('address').value = address.replace(/\s+/g,' ');
			submit = markFieldCorrect('address');
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


