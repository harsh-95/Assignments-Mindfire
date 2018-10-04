<cfif NOT APPLICATION.loginService.isUserLoggedIn()>
			<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
<html>
	<head>
		<title>Login</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/assets/js/user-login-validations.js"></script>
	</head>

	<body>
		<cfinclude template="includes/header_homepage.cfm">

		<div class="container" style="background-image: url('../assets/images/books.jpg');">

			<cfif isDefined("URL.id")>
				<cfif URL.id EQ 1>
					<cfoutput><h3 class="show-msg">Successfully Registered. Your Login id is your Email id</h3></cfoutput>
<!--- 			<cfelseif URL.id EQ 2>
					<cfoutput><h3 class="show-msg">Incorrect Login_id</h3></cfoutput>
				<cfelseif URL.id EQ 3>
					<cfoutput><h3 class="show-msg">Incorrect Password</h3></cfoutput>--->
				</cfif>
			</cfif>
			<h3 class="show-msg"></h3>
			<div class="form1">
				<div class="heading">
					 Login
				</div>

				<form  method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Login id</span>
						</div>
							<input type="text" name="email_id" class="input-field" id="email_id" placeholder="enter your email id" maxlength="40">
							<span class="error" id="error_email_id"></span><br><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Password</span>
						</div>
							<input type="password" name="password" class="input-field" id="password" placeholder="enter password" maxlength="40">
							<span class="error" id="error_password"></span><br><br>
					</div>
					<div class="label">
						<input type="submit" id="login" name="login-btn" value="Login">
						<a href="forgot_password.cfm" id="forgot">Forgot Password?</a>
					</div>

				</form>
			</div>
        </div>

		<cfinclude template="includes/footer.cfm">
	</body>
</html>
<cfelseif SESSION.user_type EQ 'user'>
	<cflocation url="../user/views/dashboard.cfm" addtoken="no">
<cfelseif SESSION.user_type EQ 'admin'>
	<cflocation url="../admin/views/dashboard.cfm" addtoken="no">
</cfif>