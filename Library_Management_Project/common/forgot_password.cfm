<cfif NOT APPLICATION.loginService.isUserLoggedIn()>
			<cfheader name="Pragma" value="no-cache">
			<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
<html>
	<head>
		<title>Forgot Password</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/assets/js/user-login-validations.js"></script>
	</head>

	<body>
		<cfinclude template="includes/header_homepage.cfm">

		<div class="container" style="background-image: url('../assets/images/books.jpg');">

<!--- 			<cfif isDefined("URL.id")>
				<cfif URL.id EQ 2>
					<cfoutput><h3 class="show-msg">This email id is not registered</h3></cfoutput>
				<cfelseif URL.id EQ 3>
					<cfoutput><h3 class="show-msg">Incorrect Password</h3></cfoutput>
				</cfif>
			<cfelse>
				<cfoutput><h3 class="show-msg">An OTP will be sent to this email id</h3></cfoutput>
			</cfif> --->
			<h3 class="show-msg">An OTP will be sent to this email id</h3>
			<div class="form1">
				<div class="heading">
					 Forgot Password
				</div>
<!--- action="handlers/forgot_password_handler.cfm?id=1" --->
				<form method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Login id</span>
						</div>
							<input type="text" name="email_id" class="input-field" id="email_id" placeholder="enter your email id" maxlength="40">
							<span class="error" id="error_email_id"></span><br><br>
					</div>

					<div class="label">
						<input type="submit" id="send_otp" name="send_otp" value="Send">
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