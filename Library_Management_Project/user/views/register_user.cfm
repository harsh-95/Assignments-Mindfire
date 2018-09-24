<cfif NOT Application.loginService.isUserLoggedIn()>
<html>
	<head>
		<title>Homepage</title>
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR" rel="stylesheet">
		<link rel="stylesheet" href="/assets/css/homepage.css" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/assets/js/register-user-validations.js"></script>
	</head>

	<body>
		<cfinclude template="../../common/includes/header_homepage.cfm">

		<div class="container" style="background-image: url('../../assets/images/books.jpg');">
		<cfif isDefined("url.id")>
			<cfoutput><h3 id="userid">User already registered</h3></cfoutput>
		</cfif>
			<div class="form1">
				<div class="heading">
					New Registration
				</div>

				<form action="../handlers/register_handler.cfm" method="post">
					<div class="field">
						<div class="label">
							<span class="mandatory">Name</span>
						</div>
							<input type="text" name="name" class="input-field" id="name" placeholder="enter first name" maxlength="20" >
							<span class="error" id="error_name"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Email</span>
						</div>
							<input type="text" name="email" class="input-field" id="email" placeholder="enter your email" maxlength="20" >
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
							<input type="password" name="password" class="input-field" id="password" placeholder="enter password" maxlength="20" >
							<span class="error" id="error_password"></span><br>
					</div>

					<div class="field">
						<div class="label">
							<span class="mandatory">Address</span>
						</div>
							<input type="text" name="address" class="input-field" id="address" placeholder="enter address" maxlength="100" >
							<span class="error" id="error_address"></span><br><br>
					</div>

					<div class="field-button">
						<input type="submit" id="submit" value="Register">
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