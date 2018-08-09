var x=0,y=0,z=0,res=0,op="";
function validate()								 
{
	var re = /^[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.][a-zA-Z0-9]+$/;
	var firstname = document.forms["form1"]["first-name"];
	var middlename = document.forms["form1"]["middle-name"];
	var lastname = document.forms["form1"]["last-name"];	
	var email = document.forms["form1"]["email"]; 
	var phone = document.forms["form1"]["phone"]; 
	var password = document.forms["form1"]["password"]; 
	var dob = document.forms["form1"]["dob"]; 
	var gender = document.forms["form1"]["gender"]; 
	var currAddr = document.forms["form1"]["currAddr"];
	var permAddr = document.forms["form1"]["permAddr"];
	var city1 = document.forms["form1"]["city"];
	var state = document.forms["form1"]["state"];
	var zip = document.forms["form1"]["zip"];
	var enteredValue = document.forms["form1"]["captcha"];

	
	if (firstname.value == "")								 
	{
		window.alert("Please enter your first name.");
		firstname.focus();
		return false;
	}
	if(allLetter(firstname))
	{
	
	}
	if (middlename.value != "")								 
	{
		
	if(allLetter(middlename))
	{
	
	}
	}
	if (lastname.value == "")								 
	{
		window.alert("Please enter your last name.");
		lastname.focus();
		return false;
	}
	if(allLetter(lastname))
	{
	
	}
	if (email.value == "")								 
	{
		window.alert("Please enter a valid e-mail address.");
		email.focus();
		return false;
	}
	 
	if(!(re.test(email.value)))
	{
	window.alert("Please fill Email correctly");
	return false;
	}
	if (phone.value == "")						 
	{
		window.alert("Please enter your phone number.");
		phone.focus();
		return false;
	}
		else if(phone.value.length != 10)
	{
	window.alert("Please enter a valid 10 digit phone number.");
		phone.focus();
		return false;
	}
	else
	{
	}
	if (password.value == "")					 
	{
		window.alert("Please enter your password");
		password.focus();
		return false;
	}
	else if(password.value.length < 8)
	{
	window.alert("Please have minimum 8 characters in Password.");
		password.focus();
		return false;
	}
	else
	{
	}
	if (dob.value == "")					 
	{
		window.alert("Please enter your date of birth");
		dob.focus();
		return false;
	}
                if (gender[0].checked == true) 
				{
                } 
				else if (gender[1].checked == true) 
				{
                } 
				else 
				{
                    window.alert("Please select your gender");
				
                    return false;
                }    
	
	if (currAddr.value == "")							 
	{
		window.alert("Please enter your current address.");
		currAddr.focus();
		return false;
	}
	if (permAddr.value == "")							 
	{
		window.alert("Please enter your permanent address.");
		permAddr.focus();
		return false;
	}
	if (city1.value == "")							 
	{
		window.alert("Please enter your city.");
		city1.focus();
		return false;
	}
	if(allLetter(city1))
	{
	
	}
	if (state.value == "")							 
	{
		window.alert("Please enter your state.");
		state.focus();
		return false;
	}
	if(allLetter(state))
	{
	
	}
	if (zip.value == "")							 
	{
		window.alert("Please enter your zip code.");
		zip.focus();
		return false;
	}
	else if(zip.value.length != 6)
	{
	window.alert("Please enter a valid 6 digit zip code.");
		zip.focus();
		return false;
	}
	else
	{
	}
	if (enteredValue.value == "")								 
	{
		window.alert("Please enter result of Captcha.");
		enteredValue.focus();
		return false;
	}
		if (enteredValue.value != res)								 
	{
		window.alert("Wrong answer of Captcha.");
		enteredValue.focus();
		return false;
	}
	else
	{
	window.alert("Data Submitted.");
	}


	return true;
}

function allLetter(name)
{ 
	var letters = /^[A-Za-z]+$/;
	if(name.value.match(letters))
	{
	return true;
	}
	else
	{
	window.alert(name.name+' must have alphabet characters only');
	name.focus();
	return false;
	}
	
}
///////////////////
function operands() 
{
x=Math.ceil(Math.random()*10);
y=Math.ceil(Math.random()*10);  
captcha(x,y,z);
}
function operator() 
{
z=(Math.ceil(Math.random()*10))%4;
captcha(x,y,z);
}

function captcha(x,y,z) 
{
 var x1=x;
var y1=y;
var z1=z;

if(z1===0)
{
op="+";
res=x1+y1;
}
else if(z1===1)
{
op="-";
res=x1-y1;
}
else if(z1===2)
{
op="*";
res=x1*y1;
}
else
{
op="/";
res=Math.floor(x1/y1);
}
    document.getElementById("cap").innerHTML = x1+" "+op+" "+y1;
}