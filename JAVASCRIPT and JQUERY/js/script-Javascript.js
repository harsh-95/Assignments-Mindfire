
//regular expressions for validations
var regNumber = /^[0-9]+$/
var regAlphabets = /^[a-zA-Z]+$/;
var regEmail = /^([A-Za-z0-9]+[.-]?[A-Za-z0-9]{1,})*@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$/;
var regPass = /([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*/;
var regAddress = /[a-zA-Z]+/


//function validate() to check if any field value is invalid and 
//called when submit button is pressed
function validate(){
	
	var submitForm = true;
			
	var validateArray = [validateName('first'),  validateMiddleName(),  validateName('last'),
						validateEmail(),  validatePhone(),  validatePassword(),  validateDOB(),
						validateAddress('current'),  validateAddress('permanent'),  validateSelectField('country'),
						validateSelectField('state'), validateSelectField('city'),validateCaptcha(),  validateGender()];

	for(i = 0 ; i < validateArray.length ; i++){
			submitForm = submitForm && validateArray[i];
		}

	//returns true only when all functions returns true
	return  (submitForm); 

}

//for validating Name
function validateName(field){
	var submit = false;
	var fieldname = document.forms["form1"][field];
	
		if(fieldname.value ==''){
			submit = showError(field,'Please fill '+field+' name');
		}
		else if(!(regAlphabets.test(fieldname.value))){
			submit = showError(field,"Please enter only alphabets in "+field+" name");
		}
		else{
			submit = isFieldCorrect(field);
		}
		return submit;
}

//for validating Middle Name
function validateMiddleName(){
	var submit = true;
	var middlename = document.forms["form1"]["middle"];
	
		if(middlename.value != ''){
			if(!(regAlphabets.test(middlename.value))){
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

//for validating Email
function validateEmail(){
	var submit = false;
	var email = document.forms["form1"]["email"]; 
	
		if(email.value ==''){
			submit = showError('email','Please fill email');
		}
		else{	
			if(!(regEmail.test(email.value)) || (checkFreq(email.value) > 1)){
				submit = showError('email',"Please enter email in proper format");
			}
			else{
				submit = isFieldCorrect("email");
			}
		}
		return submit;
}

//for validating Phone
function validatePhone(){
	var submit = false;
	var phone = document.forms["form1"]["phone"]; 
	
		if(!(regNumber.test(phone.value)) || phone.value.length < 10 || phone.value ==''){
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
			submit = showError('password',"Please fill password");
		}
		else
		{	
			if(!(regPass.test(password)) || password.length < 8){
				submit = showError('password',"Password must be alphanumeric and min 8 characters");
			}
			else{
				submit = isFieldCorrect("password");
			}
		}			
		return submit;
}

//for validating Date Of Birth
function validateDOB(){
	var submit = false;
	var dob = document.forms["form1"]["dob"]; 
	
		if(dob.value ==''){
			submit = showError('dob',"Please fill dob properly");
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
			document.getElementById("error_gender").innerHTML = "Please select a gender";
		}
		else{	
			submit = true;
			document.getElementById("error_gender").innerHTML = "";
		}
		return submit;
}

//for validating Address
function validateAddress(field){
	var submit = false;
	var addressField = document.forms["form1"][field];
	addressField = addressField.value.trim();
	
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

//for validating country,state,city
function validateSelectField(field){
	var submit = false;
	var selectedItem = document.forms["form1"][field];
	
		if(selectedItem.value ==''){
			submit = showError(field+'Id','Please select '+field);
		}
		else{
			submit = isFieldCorrect(field+'Id');
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

//function to generate Captcha
function generateCaptcha(){
	operand1 = Math.ceil(Math.random()*100);
	operand2 = Math.ceil(Math.random()*100);  
	operatorValue = (Math.ceil(Math.random()*10))%4;

	if(operatorValue === 0){
		operator = "+";
		res= operand1 + operand2;
	}
	else if(operatorValue === 1){
		operator = "-";
		res = operand1 - operand2;
	}
	else if(operatorValue === 2){
		operator = "*";
		res = operand1 * operand2;
	}
	else{
		operator = "/";
		res = Math.floor(operand1/operand2);
	}
		document.getElementById("show_captcha").innerHTML = operand1 + " " + operator +" " + operand2;
}

