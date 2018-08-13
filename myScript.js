//when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regNumber = /^[0-9]+$/
var reg = /^[a-zA-Z]+$/;
var re = /\S+@\S+\.\S+/;
var regPass = /[a-zA-Z0-9]*[0-9]+[a-zA-Z0-9]*/;


//functions to be run on submit button to validate each input field  
$('#submit').click(function() {

			validateLastName(); validateMiddleName(); validateFirstName();validateEmail();
			validatePassword();validatePhone();validateDOB(); validateGender(); validateCurrentAdress();
			validatePermanentAddress(); validateCityName(); validateStateName(); validateZip();
  
					//returns true only when all functions returns true
			return  (validateLastName() && validateMiddleName() && validateFirstName() && validateEmail() && validatePassword()
					&& validatePhone() && validateDOB() && validateGender() && validateCurrentAdress() && validatePermanentAddress()
					&& validateCityName() && validateStateName() && validateZip());
})


//blur functions for each input field
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
  
$("#current").blur(function(){
		validateCurrentAdress();
  });
  
$("#permanent").blur(function(){
		validatePermanentAddress();
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
  
//function to validate first name
function validateFirstName(){
	var submit = false;
	var firstname =$("#first").val();
	
		if(firstname ==''){
		submit = showError('first','Please fill first Name');
		}
		else if(!(reg.test(firstname))){
		submit = showError('first',"Please enter only alphabets in first Name");
		}
		else if(firstname.length < 3){
		submit = showError('first',"First Name must have atleast 3 characters");
		}
		else if(firstname.length > 20){
		submit = showError('first',"First Name can't have more than 20 characters");
		}
		else{
		submit = isFieldCorrect("first");
		}
		return submit;
}

//function to validate middle name
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

//function to validate last name
function validateLastName(){
	var submit = false;
	var lastname =$("#last").val();
	
		if(lastname ==''){
		submit = showError('last','Please fill Last Name');
		}
		else if(!(reg.test(lastname))){
		submit = showError('last',"Please enter only alphabets in Last Name");
		}
		else if(lastname.length < 3){
		submit = showError('last',"Last Name must have atleast 3 characters");
		}
		else if(lastname.length > 20){
		submit = showError('last',"Last Name can't have more than 20 characters");
		}
		else{
		submit = isFieldCorrect("last");
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
		else if(!(re.test(email))){
		submit = showError('email',"Please enter email in proper format");
		}
		else if(checkFreq(email) > 1){
		submit = showError('email',"can't have multiple @ symbols");
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
		else if(phone.length < 10 || phone.length > 10){
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
		submit = showError('password',"Please have min 8 characters in Password");
		}
		else if((regNumber.test(password))){
		submit = showError('password',"must have alphabets in password");
		}
		else if((reg.test(password))){
		submit = showError('password',"a numeric is must in password");
		}
		else if(!(regPass.test(password))){
		submit = showError('password',"Please enter password in alphanumeric String");
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

//function to validate Current Address
function validateCurrentAdress(){
	var submit = false;
	var currentAddress = $("#current").val();
	currentAddress = currentAddress.trim();
		if(currentAddress ==''){
		submit = showError('current',"Please fill current Address");
		}
		else{
		submit = isFieldCorrect("current");
		}
		return submit;
}

//function to validate Permanent Address
function validatePermanentAddress(){
	var submit = false;
	var permanentAddress = $("#permanent").val();
	permanentAddress = permanentAddress.trim();
	
		if(permanentAddress ==''){
		submit = showError('permanent',"Please fill permanent Address");
		}
		else{
		submit = isFieldCorrect("permanent");
		}
		return submit;
}

//function to validate City Name
function validateCityName(){
	var submit = false;
	var city =$("#city").val();
	
		if(city ==''){
		submit = showError('city','Please fill city Name');
		}
		else if(!(reg.test(city))){
		submit = showError('city',"Please enter only alphabets in city Name");
		}
		else if(city.length < 3){
		submit = showError('city',"city must have atleast 3 characters");
		}
		else if(city.length > 20){
		submit = showError('city',"city can't have more than 20 characters");
		}
		else{
		submit = isFieldCorrect("city");
		}
		return submit;
}

//function to validate State 
function validateStateName(){
	var submit = false;
	var state =$("#state").val();
	
		if(state ==''){
		submit = showError('state','Please fill state Name');
		}
		else if(!(reg.test(state))){
		submit = showError('state',"Please enter only alphabets in state Name");
		}
		else if(state.length < 3){
		submit = showError('state',"state must have atleast 3 characters");
		}
		else if(state.length > 20){
		submit = showError('state',"state can't have more than 20 characters");
		}
		else{
		submit = isFieldCorrect("state");
		}
		return submit;
}

//function to validate Zip Code
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


