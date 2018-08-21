
//variables for generating captcha
var operand1 = 0,operand2 = 0,operatorValue = 0,result = 0,operator = "";

//regular expressions for validations
var regNumber = /^[0-9]+$/
var regAlphabets = /^[a-zA-Z]+$/;
var regEmail= /\S+@\S+\.\S+/;
var regPass = /[a-zA-Z]+[a-zA-Z]*[0-9]+[a-zA-Z0-9]*/;


//function validate() to check if any field value is invalid and 
//called when submit button is pressed
function validate()								 
{
	validateFirstName();  validateMiddleName();  validateLastName();
	validateEmail();  validatePhone();  validatePassword();  validateDOB();
	validateCurrentAddress();  validatePermanentAddress();  validateCityName();
	validateStateName();  validateZip();  validateCaptcha();  validateGender();

	return  (validateLastName() && validateMiddleName() && validateFirstName()
				&& validateEmail() && validatePassword() && validatePhone() &&
				validateDOB() && validateGender() &&  validateCurrentAddress() &&  
				validatePermanentAddress() && validateCityName() && validateStateName() 
				&& validateZip() && validateCaptcha() );

}

//for validating First Name
function validateFirstName(){
	var submit = false;
	var firstname = document.forms["form1"]["first"];
	
		if(firstname.value ==''){
			submit = showError('first','Please fill first Name');
		}
		else{ 
			if((firstname.value.length < 3)){
				submit = showMinLengthError('first','First Name');
			}
			else if((firstname.value.length > 20)){
				submit = showMaxLengthError('first','First Name');
			}
			else{
				submit = isFieldCorrect("first");
			}
			if(!(regAlphabets.test(firstname.value))){
				submit = showError('first',"Please enter only alphabets in First Name");
			}
		}
		return submit;
}

//for validating Middle Name
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

//for validating Last name
function validateLastName(){
	var submit = false;
	var lastname = document.forms["form1"]["last"];
	
		if(lastname.value ==''){
			submit = showError('last','Please fill Last Name');
		}
		else{ 
			if((lastname.value.length < 3)){
				submit = showMinLengthError('last','Last Name');
			}
			else if((lastname.value.length > 20)){
				submit = showMaxLengthError('last','Last Name');
			}
			else{
				submit = isFieldCorrect("last");
			}
			if(!(regAlphabets.test(lastname.value))){
				submit = showError('last',"Please enter only alphabets in last Name");
			}
		}
		return submit;
}

//for validating Email
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
				if(checkFreq(email.value) > 1){
					document.getElementById('error_email').innerHTML = "cannot have multiple @ character";
					document.getElementById('email').setAttribute("style","background-color: #ff9999");
				}
				else{
					submit = isFieldCorrect("email");
				}
		}
		}
		return submit;
}

//for validating Phone
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

//for validating Password
function validatePassword(){
	var submit = false;
	var password = document.forms["form1"]["password"]; 
	password = password.value.trim();
		if(password ==''){
			submit = showError('password',"Please fill Password");
		}
		else
		{	
			if(password.length < 8){
				submit = showError('password',"Please have min 8 characters in Password");
			}
			else if(password.length > 19){
				submit = showError('password',"Password length should be less than 20 characters");
			}
			else
			{
				if(!(regPass.test(password))){
					submit = showError('password',"Please enter password in alphanumeric String");
				}
				else{
					submit = isFieldCorrect("password");
				}	
			}
		}
		return submit;
}

//for validating Date Of Birth
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

//for validating Gender
function validateGender(){
	var submit = false;
	var male = document.getElementById("male");
	var female = document.getElementById("female");

		if((male.checked === false) && (female.checked === false)){
			submit = false;		
			document.getElementById("error_gender").innerHTML = "Please select a Gender";
		}
		else{	
			submit = true;
			document.getElementById("error_gender").innerHTML = "";
		}
		return submit;
}

//for validating Current Address
function validateCurrentAddress(){
	var submit = false;
	var currentAddress = document.forms["form1"]["current"];
	currentAddress = currentAddress.value.trim();
		if(currentAddress ==''){
			submit = showError('current',"Please fill current Address");
		}
		else{
			submit = isFieldCorrect("current");
		}
		return submit;
}

//for validating Peramanent Address
function validatePermanentAddress(){
	var submit = false;
	var permanentAddress = document.forms["form1"]["permanent"];
	permanentAddress = permanentAddress.value.trim();
	
		if(permanentAddress ==''){
			submit = showError('permanent',"Please fill permanent Address");
		}
		else{
			submit = isFieldCorrect("permanent");
		}
		return submit;
}

//for validating City
function validateCityName(){
	var submit = false;
	var city1 = document.forms["form1"]["city"];
	
		if(city1.value ==''){
			submit = showError('city','Please fill City Name');
		}
		else{ 
			if((city1.value.length < 3)){
				submit = showMinLengthError('city','City Name');
			}
			else if((city1.value.length > 20)){
				submit = showMaxLengthError('city','City Name');
			}
			else{
				submit = isFieldCorrect("city");
			}
			if(!(regAlphabets.test(city1.value))){
				submit = showError('city',"Please enter only alphabets in City Name");
			}
		}
		return submit;
}

//for validating State
function validateStateName(){
	var submit = false;
	var state = document.forms["form1"]["state"];
	
		if(state.value ==''){
			submit = showError('state','Please fill State Name');
		}
		else{ 
			if((state.value.length < 3)){
				submit = showMinLengthError('state','State Name');
			}
			else if((state.value.length > 20)){
				submit = showMaxLengthError('state','State Name');
			}
			else{
				submit = isFieldCorrect("state");
			}
			if(!(regAlphabets.test(state.value))){
				submit = showError('state',"Please enter only alphabets in State Name");
			}
		}
		return submit;
}

//for validating Zip Code
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

//for validating captcha	
function validateCaptcha(){             
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

//for showing error if entered value is not valid	
function showError(field,message){
		document.getElementById("error_"+field).innerHTML = message;
		document.getElementById(field).setAttribute("style","background-color: #ff9999");
		return false;
}

//for showing minimum length error
function showMinLengthError(field, labelName){
		document.getElementById("error_"+field).innerHTML = " a valid "+ labelName +" must have 3 characters atleast";
		document.getElementById(field).setAttribute("style","background-color: #ff9999");
		return false;
}

//for showing maximum length error
function showMaxLengthError(field, labelName){
		document.getElementById("error_"+field).innerHTML = labelName+" should have less than 20 characters ";
		document.getElementById(field).setAttribute("style","background-color: #ff9999");
		return false;
}

//for returning true for a valid entry
function isFieldCorrect(field){
		document.getElementById("error_"+field).innerHTML = "";
		document.getElementById(field).setAttribute("style","background-color: white");
		return true;
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

//function to generate Operands for Captcha
function generateOperands(){
	operand1 = Math.ceil(Math.random()*100);
	operand2 = Math.ceil(Math.random()*100);  
	generateCaptcha(operand1,operand2,operatorValue);
}

//function to generate Operator for Captcha
function generateOperator(){
	operatorValue = (Math.ceil(Math.random()*10))%4;
	generateCaptcha(operand1,operand2,operatorValue);
}

//function to generate Captcha
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

