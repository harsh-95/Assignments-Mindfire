<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/registration-form-cf-css.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="js/registration-validation.js"></script>
		<title>Registration Page</title>
   </head>
<body>
	<header class="mid">
		<h1>Registration</h1>
	</header>
		<ul>
			<li><a href="#">etc</a></li>
			<li><a href="#">New</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="#">About</a></li>
			<li><a href="login.cfm">Login</a></li>
		</ul>
<div id="full-form">

	<cfform action="registration-handler.cfm" method="Post" id="signupForm">
		   <hr><h3>

		<div class="key">
			<span class="mandatory">*</span>  Full Name
		</div>
		<cfinput type="text" name="fullname" class="input-field" id="fullname" validate="regex" required="yes" pattern="^[A-Za-z ]{1,20}$"
				message="Enter a valid Name" maxlength="20" validateAt = "onSubmit">
		<span class="error" id="error_fullname">  </span><br><br>
		<!---............................................................................................--->

		<div class="key">
			<span class="mandatory">*</span>  Email
		</div>
		<cfinput type="text" name="email" class="input-field" id="email" validate="regex" required="yes" pattern="^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)*@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$"
				message="Enter a valid Email" maxlength="30" validateAt = "onSubmit">
		<span class="error" id="error_email">  </span><br><br>
		<!---............................................................................................--->

		<div class="key">
			<span class="mandatory">*</span>  Phone
		</div>
		<cfinput type="text" name="phone" class="input-field" id="phone" validate="regex" required="yes" pattern="^[0-9]{10}$"
				message="Enter a valid phone number" maxlength="10" validateAt = "onSubmit">
		<span class="error" id="error_phone">  </span><br><br>
		<!---............................................................................................--->

		<div class="key">
			<span class="mandatory">*</span>  Password
		</div>
		<cfinput type="password" name="password" class="input-field" id="password" validate="regex" required="yes" pattern="([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*"
				message="Enter a valid password" maxlength="15" validateAt = "onSubmit">
		<span class="error" id="error_password">  </span><br><br>
		<!---............................................................................................--->

		<div>
			<cfinput type="submit" name="register" id="submit" value="Register" />
		</div>
			</h3><hr>
	</cfform>
</div>
		<div class="above-footer">
		</div>
		<footer>
			<hr>
			<img src="images/footer.png" height="100px" width="100%%">
		</footer>
</body>
</html>
