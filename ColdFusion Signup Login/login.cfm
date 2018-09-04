<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/registration-form-cf-css.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- <script src="js/registration-validation.js"></script>-->
		<title>Login Page</title>
	</head>
<body>
	<header class="mid">
		<h1>Login</h1>
	</header>
	<h3>

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
		<cfinput type="text" name="email" class="input-field" id="email" validate="regex" required="yes" pattern="^([A-Za-z0-9]+([.-]?[A-Za-z0-9])*)*@[A-Za-z0-9-]+(\.[a-zA-Z0-9]+)+$"
				message="Enter a valid Email" maxlength="30" validateAt = "onSubmit">
		<span class="error" id="error_email">  </span><br><br>
		<!---............................................................................................--->

		<div class="key">
			<span class="mandatory">*</span>Password
		</div>
		<cfinput type="text" name="password" class="input-field" id="password" validate="regex" required="yes" pattern="([A-Za-z]+.*[0-9]|[0-9]+.*[A-Za-z])[A-Za-z0-9]*"
				message="Enter a valid password" maxlength="15" validateAt = "onSubmit">
		<span class="error" id="error_password">  </span><br><br>
		<!---............................................................................................--->


		<div>
	<cfinput type="submit" name="login" value="Login" />
		</div>
		</h3><hr>
	</cfform>
</div>
	</h3>

</body>
</html>