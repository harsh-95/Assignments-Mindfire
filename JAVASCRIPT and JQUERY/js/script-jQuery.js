//when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regNumber = /^[0-9]+$/
var reg = /^[a-zA-Z]+$/;
var re = /\S+@\S+\.\S+/;
var regPass = /([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*/;
var regAddress = /[a-zA-Z]+/


//functions to be run on submit button to validate each input field  
$('#submit').click(function() {
	
			validateRequiredName('first'); validateMiddleName(); validateRequiredName('last'); validateEmail();
			validatePassword();validatePhone();validateDOB(); validateGender(); validateAddress('current');
			validateAddress('permanent'); validateSelectField('country'); validateSelectField('state'); validateSelectField('city');
  
					//returns true only when all functions returns true
			return  (validateRequiredName('first') && validateMiddleName() && validateRequiredName('last') && validateEmail() && validatePassword()
					&& validatePhone() && validateDOB() && validateGender() && validateAddress('current') && validateAddress('permanent')
					&& validateSelectField('country') && validateSelectField('state') && validateSelectField('city'));    
				
})


//blur functions for each input field
$("#first").blur(function(){
		validateRequiredName('first');
  });  
  
$("#middle").blur(function(){
		validateMiddleName();
  });
  
$("#last").blur(function(){
		validateRequiredName('last');
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
  
$(".gender").change(function(){
		validateGender();
  });
  
$("#current").blur(function(){
		validateAddress('current');
  });
  
$("#permanent").blur(function(){
		validateAddress('permanent');
  });
  
  
$("#countryId").change(function(){
		validateSelectField('country');
  });
  
$("#stateId").change(function(){
		validateSelectField('state');
  });
  
$("#cityId").change(function(){
		validateSelectField('city');
  });
  
//function to validate first and last name
function validateRequiredName(field){
	var submit = false;
	var fieldname =$("#"+field).val();
	
		if(fieldname ==''){
			submit = showError(field,"Please fill "+field+" name");
		}
		else if(!(reg.test(fieldname))){
			submit = showError(field,"Please enter only alphabets in "+field+" name");
		}
		else if(fieldname.length < 3){
			submit = showError(field,field+" name must have atleast 3 characters");
		}
		else{
			submit = isFieldCorrect(field);
		}
		return submit;
}

//function to validate middle name
function validateMiddleName(){
	var submit = true;
	var middlename =$("#middle").val();
	
		if(middlename != ''){
			if(!(reg.test(middlename))){
				submit = showError('middle',"Please enter only alphabets in middle name");
			}
			else{
				submit = isFieldCorrect("middle");
			}
		}
		else{
				submit = isFieldCorrect("middle");
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
		else if((!(re.test(email))) || checkFreq(email) > 1){
			submit = showError('email',"Please enter email in proper format");
		}
		else{
			submit = isFieldCorrect("email");
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
			submit = isFieldCorrect("phone");
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
		else if(password.length < 8){
			submit = showError('password',"Password must be alphanumeric and min 8 charaters");
		}
		else if(!(regPass.test(password))){
			submit = showError('password',"Password must be alphanumeric and min 8 charaters");
		}
		else{
			submit = isFieldCorrect("password");
		}
		return submit;
}

//function to validate Date Of Birth
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

//function to validate Gender
function validateGender(){
	var submit = false;
	var male = $('input:radio[name=gender]')[0];
	var female = $('input:radio[name=gender]')[1];
	
		if((male.checked === false) && (female.checked === false)){
			submit = false;
		$("#error_gender").text("Please select gender");
		}
		else{
			submit = true;
		$("#error_gender").text("");
		}
		return submit;
}

//for validating Address and replaces multple spaces to one space
function validateAddress(field){
	var submit = false;
	var addressField = $("#"+field).val() ;
	addressField = addressField.trim();
	
		if(addressField ==''){
		submit = showError(field,"Please fill "+field+" address");
		}
		else if(!regAddress.test(addressField)){
			document.getElementById(field).value = addressField.replace(/\s+/g,' ');
			submit = showError(field,"Please enter a valid "+field+" address");
		}
		else{
			document.getElementById(field).value = addressField.replace(/\s+/g,' ');
			submit = isFieldCorrect(field);
		}
		return submit;
}

//function to validate Select Field
function validateSelectField(field){
	var submit = false;
	var selectedItem =$("#"+field+'Id').val();
	
		if(selectedItem ==''){
			submit = showError(field+'Id','Please select a '+field);
		}
		else{
			submit = isFieldCorrect(field+'Id');
		}
		return submit;
}


//function to show error in a field and return false
function showError(field,message){
		$("#error_"+field).text(message);
		$("#"+field).css("background-color", "#ff9999");
		return false;
}

//function to show that field is valid and return true
function isFieldCorrect(field){
		$("#error_"+field).text('');
		$("#"+field).css("background-color", "white");
		return true;
}

});


