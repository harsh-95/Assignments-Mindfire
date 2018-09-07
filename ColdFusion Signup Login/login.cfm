<!DOCTYPE html>
<html>
	<head>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/registration-form-cf-css.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="js/login-validation.js"></script>
		<title>Login Page</title>
	</head>
<body>
	<header class="mid">
		<h1>Login</h1>
	</header>
	<!---Navigation bar--->
		<ul>
			<li><a href="#">etc</a></li>
			<li><a href="#">New</a></li>
			<li><a href="#">Contact</a></li>
			<li><a href="#">About</a></li>
			<li><a href="registration.cfm">Register</a></li>
		</ul>

	<div id="full-form">
		<cfform action="login-handler.cfm" method="Post" id="signupForm">
			<cfif isDefined("url.id")>
				<cfif #url.id# EQ 1>
					<span class="loginerror"><cfoutput>Email id is not Registered</cfoutput></span>
				<cfelse>
					<span class="loginerror"><cfoutput>Incorrect Password</cfoutput></span>
				</cfif>
			</cfif>

			   <hr><h3>

			<!---............................................................................................--->
			<div class="key">
				<span class="mandatory">*</span>Email
			</div>
			<cfinput type="text" name="email" class="input-field" id="email" required="yes"
					message="Please fill Email" maxlength="30" validateAt = "onSubmit">
			<span class="error" id="error_email">  </span><br><br>
			<!---............................................................................................--->

			<div class="key">
				<span class="mandatory">*</span>Password
			</div>
			<cfinput type="password" name="password" class="input-field" id="password" required="yes"
					message="Please enter Password" maxlength="15" validateAt = "onSubmit">
			<span class="error" id="error_password">  </span><br><br>
			<!---............................................................................................--->

			<div>
				<cfinput type="submit" name="login" id="submit" value="Login" />
			</div>
			</h3><hr>
		</cfform>
	</div>
		<div class="above-footer">
		</div>
		<footer>
			</h3><hr>
			<img src="images/footer.png" height="100px" width="100%">
		</footer>
</body>
</html>
