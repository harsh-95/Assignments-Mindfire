var operand1 = 0,operand2 = 0,operatorValue = 0,result = 0,operator = "";
var regNumber = /^[0-9]+$/
var regAlphabets = /^[a-zA-Z]+$/;
var regEmail= /\S+@\S+\.\S+/;
var regPass = /[a-zA-Z]+[a-zA-Z]*[0-9]+[a-zA-Z]*/;

function validateFirstName(){
	var submit = false;
	var firstname = document.forms["form1"]["first"];
	
		if(firstname.value ==''){
		submit = showError('first','Please fill first Name');
		}
		else if(!(regAlphabets.test(firstname.value))){
		submit = showError('first',"Please enter only alphabets in First Name");
		}
		else{
		submit = isFieldCorrect("first");
		}
		return submit;
}

function validateMiddleName(){
	var submit = true;
	var middlename = document.forms["form1"]["middle"];
	
		if(middlename.value != ''){
			if(!(regAlphabets.test(middlename.value))){
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
	var lastname = document.forms["form1"]["last"];
	
		if(lastname.value ==''){
		submit = showError('last','Please fill Last Name');
		}
		else if(!(regAlphabets.test(lastname.value))){
		submit = showError('last',"Please enter only alphabets in Last Name");
		}
		else{
		submit = isFieldCorrect("last");
		}
		return submit;
}

function validateEmail(){
	var submit = false;
	var email = document.forms["form1"]["email"]; 
	
		if(email.value ==''){
		submit = showError('email','Please fill email');
		}
		else
		{
			if(!(regEmail.test(email.value))){
			submit = showError('email',"Please enter email in proper format");
			}
			else{
			submit = isFieldCorrect("email");
			}
		}
		return submit;
}


function validatePhone(){
	var submit = false;
	var phone = document.forms["form1"]["phone"]; 
	
		if(phone.value ==''){
		submit = showError('phone',"Please fill Phone number");
		}
		else if(phone.value.length < 10 || phone.value.length > 10){
		submit = showError('phone',"Please enter a valid 10 digit mobile number");
		}
		else{
		submit = isFieldCorrect("phone");
		}
		return submit;
}


function validatePassword(){
	var submit = false;
	var password = document.forms["form1"]["password"]; 
	
		if(password.value ==''){
		submit = showError('password',"Please fill Password");
		}
		else
		{	
		if(password.value.length < 8){
		submit = showError('password',"Please have min 8 characters in Password");
		}
		else
		{
		if(!(regPass.test(password.value))){
		submit = showError('password',"Please enter password in alphanumeric String");
		}
		else{
		submit = isFieldCorrect("password");
		}
		
		}
		}
		return submit;
}


function validateDOB(){
	var submit = false;
	var dob = document.forms["form1"]["dob"]; 
	
		if(dob.value ==''){
		submit = showError('dob',"Please fill dob");
		}
		else{
		submit = isFieldCorrect("dob");
		}
		return submit;
}



function validateGender(){
	var submit = true;
	var gender = $("#gender").val();
	
		if(!(gender[0].checked) || (gender[1].checked)){
		submit = showError('gender',"Please select gender");
		}
		else{
		submit = isFieldCorrect("gender");
		}
		return submit;
}

function validateCurrentAddress(){
	var submit = false;
	var currentAddress = document.forms["form1"]["current"];
	
		if(currentAddress.value ==''){
		submit = showError('current',"Please fill current Address");
		}
		else{
		submit = isFieldCorrect("current");
		}
		return submit;
}


function validatePermanentAddress(){
	var submit = false;
	var permanentAddress = document.forms["form1"]["permanent"];
	
		if(permanentAddress.value ==''){
		submit = showError('permanent',"Please fill permanent Address");
		}
		else{
		submit = isFieldCorrect("permanent");
		}
		return submit;
}

function validateCityName(){
	var submit = false;
	var city1 = document.forms["form1"]["city"];
	
		if(city1.value ==''){
		submit = showError('city','Please fill city Name');
		}
		else if(!(regAlphabets.test(city.value))){
		submit = showError('city',"Please enter only alphabets in city Name");
		}
		else{
		submit = isFieldCorrect("city");
		}
		return submit;
}


function validateStateName(){
	var submit = false;
	var state = document.forms["form1"]["state"];
	
		if(state.value ==''){
		submit = showError('state','Please fill state Name');
		}
		else if(!(regAlphabets.test(state.value))){
		submit = showError('state',"Please enter only alphabets in state Name");
		}
		else{
		submit = isFieldCorrect("state");
		}
		return submit;
}



function validateZip(){
	var submit = false;
	var zip = document.forms["form1"]["zip"];
	
		if(zip.value ==''){
		submit = showError('zip','Please fill zip Code');
		}
		else if(zip.value.length < 6 || zip.value.length > 6){
		submit = showError('zip',"Please enter a valid 6 digit zip code");
		}
		else{
		submit = isFieldCorrect("zip");
		}
		return submit;
}

function validateCaptcha(){             //for captcha	
	var submit = false;
	var enteredValue = document.forms["form1"]["captcha"];
	
		if (enteredValue.value == ""){
		submit = showError('cap',"Please enter result of Captcha.");
		}
		else if(enteredValue.value != res){
		submit = showError('cap',"Wrong answer of Captcha.");
		}
		else{
		submit = isFieldCorrect('cap');
		}
		return submit;
}
	

function showError(field,message){
		document.getElementById("error_"+field).innerHTML = message;
		document.getElementById(field).setAttribute("style","background-color: #ff9999");
		return false;
}

function isFieldCorrect(field){
		document.getElementById("error_"+field).innerHTML = "";
		document.getElementById(field).setAttribute("style","background-color: white");
		return true;
}

function generateOperands(){
	operand1 = Math.ceil(Math.random()*10);
	operand2 = Math.ceil(Math.random()*10);  
	generateCaptcha(operand1,operand2,operatorValue);
}

function generateOperator(){
	operatorValue = (Math.ceil(Math.random()*10))%4;
	generateCaptcha(operand1,operand2,operatorValue);
}

function generateCaptcha(operand1,operand2,operatorValue){
	var local_operand1 = operand1;
	var local_operand2 = operand2;
	var local_operatorValue = operatorValue;

	if(local_operatorValue === 0){
		operator = "+";
		res= local_operand1 + local_operand2;
	}
	else if(local_operatorValue === 1){
		operator = "-";
		res = local_operand1 - local_operand2;
	}
	else if(local_operatorValue === 2){
		operator = "*";
		res = local_operand1 * local_operand2;
	}
	else{
		operator = "/";
		res = Math.floor(local_operand1/local_operand2);
	}
		document.getElementById("show_captcha").innerHTML = local_operand1 + " " + operator +" " + local_operand2;
}


function validate()								 
{
	validateFirstName();validateMiddleName();validateLastName();validateEmail();validatePhone();
	validatePassword();validateDOB();validateCurrentAddress();validatePermanentAddress();validateCityName();
	validateStateName();validateZip();validateCaptcha();

return  (validateLastName() && validateMiddleName() && validateFirstName() && validateEmail() && validatePassword() && validatePhone() &&
			validateDOB() && validateCurrentAddress() &&  validatePermanentAddress() && validateCityName() && validateStateName() 
			&& validateZip() && validateCaptcha());

}
