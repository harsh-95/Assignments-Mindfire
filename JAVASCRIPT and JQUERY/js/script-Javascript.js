
//regular expressions for validations
var regNumber = /^[0-9]+$/
var regAlphabets = /^[a-zA-Z]+$/;
var regEmail = /^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)+@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$/;
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
			if(submitForm === false){
				break;
			}
		}

	//returns true only when all functions returns true
	return  (submitForm); 

}

//for validating Name
function validateName(field){
	var submit = false;
	var fieldname = document.forms["form1"][field];
		fieldname.value = fieldname.value.trim();
		
		if(fieldname.value ==''){
			submit = showError(field,'Please fill '+field+' name');
		}
		else if(!(regAlphabets.test(fieldname.value))){
			submit = showError(field,"Please enter only alphabets in "+field+" name");
		}
		else{
			submit = markFieldCorrect(field);
		}
		return submit;
}

//for validating Middle Name
function validateMiddleName(){
	var submit = true;
	var middlename = document.forms["form1"]["middle"];
		middlename.value = middlename.value.trim();
	
		if(middlename.value != ''){
			if(!(regAlphabets.test(middlename.value))){
				submit = showError('middle',"Please enter only alphabets in middle name");
			}
			else{
				submit = markFieldCorrect("middle");
			}
		}
		else{
			submit = markFieldCorrect("middle");
		}
		return submit;
}

//for validating Email
function validateEmail(){
	var submit = false;
	var email = document.forms["form1"]["email"];
		email.value = email.value.trim();
	
		if(email.value ==''){
			submit = showError('email','Please fill email');
		}
		else{	
			if(!(regEmail.test(email.value)) || (checkFreq(email.value) > 1)){
				submit = showError('email',"Please enter email in proper format");
			}
			else{
				submit = markFieldCorrect("email");
			}
		}
		return submit;
}

//for validating Phone
function validatePhone(){
	var submit = false;
	var phone = document.forms["form1"]["phone"]; 
	
		if(!( regNumber.test(phone.value)) || phone.value.length < 10 || phone.value =='' || phone.value =='0000000000'){
			submit = showError('phone',"Please enter a valid 10 digit mobile number");
		}
		else{
			submit = markFieldCorrect("phone");
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
		else if(!(regPass.test(password)) || password.length < 8){
			submit = showError('password',"Password must be alphanumeric and min 8 charaters");
		}
		else{
			submit = markFieldCorrect("password");
		}		
		return submit;
}

//for validating Date Of Birth, year must be in between 1900 to 2010
function validateDOB(){
	//fetch system date
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0
	var yyyy = today.getFullYear();
	
	var submit = false;
	//fetch selected date
	var dob = document.forms["form1"]["dob"].value;
		var d = new Date(Date.parse(dob));
		var day = d.getDate();
		var month = d.getMonth()+1;
		var year = d.getFullYear();
		if(dob ==''){
			submit = showError('dob',"Please fill DOB properly");
		}
		else{
			if(year === yyyy){
					if(month === mm){
							if(day > dd){
								submit = showError('dob',"Invalid Date Of Birth");
							}
							else{
								submit = markFieldCorrect("dob");
							}
					}
					else if(month > mm){
						submit = showError('dob',"Invalid Date Of Birth");
					}
					else{
						submit = markFieldCorrect("dob");
					}
			}
			else if(year > yyyy){
				submit = showError('dob',"Invalid Date Of Birth");
			}
			else{
				submit = markFieldCorrect("dob");
			}
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
			submit = markFieldCorrect(field);
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
			submit = markFieldCorrect(field+'Id');
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
			submit = markFieldCorrect('cap');
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
function markFieldCorrect(field){
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
	operand1 = Math.floor(Math.random()*100);
	operand2 = Math.floor(Math.random()*100);  
	operatorValue = (Math.ceil(Math.random()*10))%4;

	//addition
	if(operatorValue === 0){
		operator = "+";
		res= operand1 + operand2;
	}
	//subtraction
	else if(operatorValue === 1){
		operator = "-";
		res = operand1 - operand2;
	}
	//multiplication
	else if(operatorValue === 2){
		operator = "*";
		res = operand1 * operand2;
	}
	//division
	else{
		operator = "/";
		var decimalValue = (operand1/operand2) - Math.floor(operand1/operand2);
		if(decimalValue > 0){
			remainderValue = operand1 % operand2;
			operand1 = operand1 - remainderValue + operand2;
			if(operand1 > 99){
				operand1 = operand2;
			}
		}
		if(operand2 == 0){
			operand2 = operand2 + 1;
		}
		res = (operand1/operand2);
	}
		document.getElementById("show_captcha").innerHTML = operand1 + " " + operator +" " + operand2;
}

