$(document).ready(function() {

var regNumber = /^[0-9]+$/
var reg = /^[a-zA-Z]+$/;
var re = /\S+@\S+\.\S+/;
var regPass = /[a-zA-Z]+[a-zA-Z]*[0-9]+[a-zA-Z]*/;


function validateFirstName(){
	var submit = false;
	var firstname =$("#first").val();
	
		if(firstname ==''){
		submit = showError('first','Please fill first Name');
		}
		else if(!(reg.test(firstname))){
		submit = showError('first',"Please enter only alphabets in first Name");
		}
		else{
		submit = isFieldCorrect("first");
		}
		return submit;
}



function validateMiddleName(){
	var submit = true;
	var middlename =$("#middle").val();
	
		if(middlename != ''){
		if(!(reg.test(middlename))){
		submit = showError('middle',"Please enter only alphabets in Middle Name");
		}
		else{
		submit = isFieldCorrect("middle");
		}
		}
		return submit;
}


function validateLastName(){
	var submit = false;
	var lastname =$("#last").val();
	
		if(lastname ==''){
		submit = showError('last','Please fill Last Name');
		}
		else if(!(reg.test(lastname))){
		submit = showError('last',"Please enter only alphabets in Last Name");
		}
		else{
		submit = isFieldCorrect("last");
		}
		return submit;
}


function validateEmail(){
	var submit = false;
	var email =$("#email").val();
	
		if(email ==''){
		submit = showError('email','Please fill email');
		}
		else if(!(re.test(email))){
		submit = showError('email',"Please enter email in proper format");
		}
		else{
		submit = isFieldCorrect("email");
		}
		return submit;
}


function validatePhone(){
	var submit = false;
	var phone = $("#phone").val();
	
		if(phone ==''){
		submit = showError('phone',"Please fill Phone number");
		}
		else if(phone.length < 10 || phone.length > 10){
		submit = showError('phone',"Please enter a valid 10 digit mobile number");
		}
		else{
		submit = isFieldCorrect("phone");
		}
		return submit;
}


function validatePassword(){
	var submit = false;
	var password = $("#password").val();
	
		if(password ==''){
		submit = showError('password',"Please fill Password");
		}
		else if(password.length < 8){
		submit = showError('password',"Please have min 8 characters in Password");
		}
		else if((regNumber.test(password))){
		submit = showError('password',"Please have alphabets also in password");
		}
		else if((reg.test(password))){
		submit = showError('password',"Please have numeric also in password");
		}
		else if(!(regPass.test(password))){
		submit = showError('password',"Please enter password in alphanumeric String");
		}
		else{
		submit = isFieldCorrect("password");
		}
		return submit;
}


function validateDOB(){
	var submit = false;
	var dob = $("#dob").val();
	
		if(dob ==''){
		submit = showError('dob',"Please fill dob");
		}
		else{
		submit = isFieldCorrect("dob");
		}
		return submit;
}



function validateGender(){
	var submit = false;
	var gender = $("#gender").val();
	
		if(gender[0].checked == true){
		submit = isFieldCorrect("gender");
		}
		else if(gender[1].checked == true){
		submit = isFieldCorrect("gender");
		}
		else{
		submit = showError('gender',"Please select gender");
		}
		return submit;
}


function validateCurrAddr(){
	var submit = false;
	var currAddr = $("#currAddr").val();
	
		if(currAddr ==''){
		submit = showError('currAddr',"Please fill current Address");
		}
		else{
		submit = isFieldCorrect("currAddr");
		}
		return submit;
}


function validatePermAddr(){
	var submit = false;
	var permAddr = $("#permAddr").val();
	
		if(permAddr ==''){
		submit = showError('permAddr',"Please fill permanent Address");
		}
		else{
		submit = isFieldCorrect("permAddr");
		}
		return submit;
}

function validateCityName(){
	var submit = false;
	var city =$("#city").val();
	
		if(city ==''){
		submit = showError('city','Please fill city Name');
		}
		else if(!(reg.test(city))){
		submit = showError('city',"Please enter only alphabets in city Name");
		}
		else{
		submit = isFieldCorrect("city");
		}
		return submit;
}


function validateStateName(){
	var submit = false;
	var state =$("#state").val();
	
		if(state ==''){
		submit = showError('state','Please fill state Name');
		}
		else if(!(reg.test(state))){
		submit = showError('state',"Please enter only alphabets in state Name");
		}
		else{
		submit = isFieldCorrect("state");
		}
		return submit;
}



function validateZip(){
	var submit = false;
	var zip =$("#zip").val();
	
		if(zip ==''){
		submit = showError('zip','Please fill zip Code');
		}
		else if(zip.length < 6 || zip.length > 6){
		submit = showError('zip',"Please enter a valid 6 digit zip code");
		}
		else{
		submit = isFieldCorrect("zip");
		}
		return submit;
}



function showError(field,message){
		$("#error_"+field).text(message);
		$("#"+field).css("background-color", "#ff9999");
		return false;
}

function isFieldCorrect(field){
		$("#error_"+field).text('');
		$("#"+field).css("background-color", "white");
		return true;
}


 $("#first").blur(function(){
		validateFirstName();
  });
  
  
   $("#middle").blur(function(){
		validateMiddleName();
  });
  
  
   $("#last").blur(function(){
		validateLastName();
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
  
  
  
   $("#dob").blur(function(){
		validateDOB();
  });
  
  
  
  $("#gender").blur(function(){
		validateGender();
  }); 
  
  
  $("#currAddr").blur(function(){
		validateCurrAddr();
  });
  
  
  $("#permAddr").blur(function(){
		validatePermAddr();
  });
  
  
  $("#city").blur(function(){
		validateCityName();
  });
  
  
  $("#state").blur(function(){
		validateStateName();
  });
  
  
  $("#zip").blur(function(){
		validateZip();
  });
  
  $('#submit').click(function() {

			validateLastName(); validateMiddleName(); validateFirstName(); validateEmail(); validatePassword();
			 validatePhone(); validateDOB(); validateGender(); validateCurrAddr(); validatePermAddr(); validateCityName(); 
			validateStateName(); validateZip();
  
return  (validateLastName() && validateMiddleName() && validateFirstName() && validateEmail() && validatePassword() && validatePhone() &&
			validateDOB() && validateGender() && validateCurrAddr() && validatePermAddr() && validateCityName() && validateStateName() 
			&& validateZip());
})
});


