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

			<h3 class="show-msg">Enter the OTP sent to your email id</h3>
			<div class="form1">
				<div class="heading">
					 Create New Password
				</div>

				<form method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">OTP</span>
						</div>
							<input type="" name="otp" class="input-field" id="otp" placeholder="enter the otp" maxlength="6">
							<span class="error" id="error_otp"></span><br><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">New Password</span>
						</div>
							<input type="password" name="new_password" class="input-field" id="new_password" placeholder="enter the new password" maxlength="20">
							<span class="error" id="error_new_password"></span><br><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Confirm Password</span>
						</div>
							<input type="password" name="confirm_password" class="input-field" id="confirm_password" placeholder="enter password again" maxlength="20">
							<span class="error" id="error_confirm_password"></span><br><br>
					</div>

					<div class="label">
						<input type="submit" id="create_password" name="create_password" value="Done">
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