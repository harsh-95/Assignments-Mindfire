<cfif NOT Application.loginService.isUserLoggedIn()>
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">

		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
		<script src="/assets/js/logout.js"></script>
		<script src="/assets/js/register-user-validations.js"></script>
	</head>

	<body>
		<cfinclude template="../../common/includes/header_homepage.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">
<!--- 		<cfif isDefined("url.id")>
			<cfoutput><h3 class="show-msg">User already registered</h3></cfoutput>
		</cfif> --->
		<h3 class="show-msg id="errmsg"></h3>
			<div class="form1">
				<div class="heading">
					New Registration
				</div>

				<form method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Name</span>
						</div>
							<input type="text" name="name" class="input-field" id="name" placeholder="enter your name" maxlength="40" >
							<span class="error" id="error_name"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Email</span>
						</div>
							<input type="text" name="email" class="input-field" id="email" placeholder="enter your email" maxlength="40" >
							<span class="error" id="error_email"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Mobile</span>
						</div>
							<input type="text" name="mobile" class="input-field" id="mobile" placeholder="enter mobile number" maxlength="10" >
							<span class="error" id="error_mobile"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Password</span>
						</div>
							<input type="password" name="password" class="input-field" id="password" placeholder="enter a password" maxlength="40" >
							<span class="error" id="error_password"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Confirm Password</span>
						</div>
							<input type="password" name="confirm-password" class="input-field" id="confirm-password" placeholder="enter password again" maxlength="40" >
							<span class="error" id="error_confirm-password"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Address</span>
						</div>
							<input type="text" name="address" class="input-field" id="address" placeholder="enter address" maxlength="200" >
							<span class="error" id="error_address"></span><br><br>
					</div>

					<div class="field-button">
						<input type="submit" name="register" id="register" value="Register">
					</div>

				</form>

			</div>
		</div>

		<cfinclude template="../../common/includes/footer.cfm">
	</body>
</html>
<cfelseif session.user_type EQ 'user'>
	<cflocation url="dashboard.cfm" addtoken="no">
<cfelseif session.user_type EQ 'admin'>
	<cflocation url="../../admin/views/dashboard.cfm" addtoken="no">
</cfif>