 //when the DOM is ready this code should run
$(document).ready(function() {

//regular expressions for validations
var regNumber = /^[0-9]+$/
var regEmail = /^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)*@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$/;
var regPass = /([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*/;


//functions to be run on submit button to validate each input field  
$('#login').click(function(e) {
	
	e.preventDefault();
	
	var email1 =$("#email_id").val();
	var password1 = $("#password").val();
	
		var submitForm = true;
	
		var validateArray = [validateEmail(), validatePassword('password')];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}
			
			if(submitForm){
				$.ajax({
				      type: "POST",
				      url: "../../common/components/login_component.cfc?method=validateUserLogin",
				      data: {loginId: email1, loginPassword: password1 },
				      success: function(res){
				    	  res = JSON.parse(res);
				    	  console.log('login done'+res[0]);
				    	  if(res[0]){
				    		  if(res[1] === 'admin'){
				    			  window.location = "../../admin/views/dashboard.cfm";
				    		  }
				    		  else{
				    			  window.location = "../../user/views/dashboard.cfm";
				    		  }
				    	  }
				    	  else if(!res[0]){
				    		  $("h3.show-msg").text(res[1]);
				    	  }
				    	  else{
				    		  window.location = "../../error.cfm";
				    	  }
								},
				      error: function(res){
				    	  window.location = "../../error.cfm?errID=3";
						}
						}); 
			}
			else{
				
				//returns true only when all functions returns true
				return submitForm; 
			}
})


//functions to be run on send button to validate login_id 
$('#send_otp').click(function(e) {

	e.preventDefault();

	//fetch email entered by user
	var email1 =$("#email_id").val();
	
	// validate that email and return true or false
	var	isEmailValid = validateEmail();
		
	if(isEmailValid){
		$.ajax({
		      type: "POST",
		      url: "../../common/components/forgot_password.cfc?method=sendOTP",
		      data: {loginId: email1 },
		      success: function(res){
		    	  
				    	  res = JSON.parse(res);
		
				    	  if(res){
				    		  window.location = "../../common/create_password.cfm?id=1";
				    	  }
				    	  else if(!res){
				    		  $("h3.show-msg").text('This email id is not registered');
				    	  }
				    	  else{
				    		  $("h3.show-msg").text('Some error occurred sending OTP');
				    	  }
					},
		      error: function(){
		    	  window.location = "../../error.cfm?errID=3";
					}
			}); 

	}
	else{
		
	}
	   	
})


//functions to be run on create password button to validate each input field  
$('#create_password').click(function(e) {
	
		e.preventDefault();
		
		var otp1 = $("#otp").val();
		var newpassword = $("#new_password").val();
		var confirmpassword = $("#confirm_password").val();
	
		var submitForm = true;
	
		var validateArray = [validateOTP(), validatePassword('new_password'), validatePassword('confirm_password') ];
			
			for(i = 0 ; i < validateArray.length ; i++){
				submitForm = submitForm && validateArray[i];
			}
			
			if(submitForm){
				$.ajax({
				      type: "POST",
				      url: "../../common/components/forgot_password.cfc?method=createNewPassword",
				      data: {otp: otp1, new_password: newpassword, confirm_password: confirmpassword },
				      success: function(res){
				    	  
					    	  res = JSON.parse(res);
					    	  //response is true, means password changed successfully
					    	  if(res[0]){
					    			  window.location = "../../common/user_login.cfm";
					    	  }
					    	  //response is false, either user entered invalid or error occurred
					    	  else{
					    		  //show a message to user
					    		  $("h3.show-msg").text(res[1]);
					    	  }
						},
				      error: function(){
				    	  window.location = "../../error.cfm?errID=3";
						}
					}); 
			}
			else{
				
				//returns false, don't submit
				return submitForm; 
			}   	

})


//blur functions for each input field
$("#email_id").blur(function(){
		validateEmail();	
  });
  
$("#password").blur(function(){
			validatePassword('password');
  });
$("#otp").blur(function(){
			validateOTP();
  });
$("#new_password").blur(function(){
			validatePassword('new_password');
  });
$("#confirm_password").blur(function(){
			validatePassword('confirm_password');
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
function validatePassword(id){
	var submit = false;
	var password = $("#"+id).val();
		password = password.trim();
		if(password ==''){
			submit = showError(id,"Please fill Password");
		}
		else if(!(regPass.test(password)) || password.length < 8){
			submit = showError(id,"Password must be alphanumeric and min 8 charaters");
		}
		else{
			submit = markFieldCorrect(id);
		}
		return submit;
}

//function to validate otp
function validateOTP(){
	var submit = false;
	var otp = $("#otp").val();
	
		if(otp ==''){
			submit = showError('otp',"Please fill OTP");
		}
		else if(!(regNumber.test(otp)) || otp.length < 6){
			submit = showError('otp',"Please enter a valid 6 digit OTP");
		}
		else{
			submit = markFieldCorrect("otp");
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

var uri = window.location.toString();
if (uri.indexOf("?") > 0) {
	var clean_uri = uri.substring(0, uri.indexOf("?"));
	window.history.replaceState({}, document.title, clean_uri);
}


