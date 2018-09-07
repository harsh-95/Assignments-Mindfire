<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/registration-form-cf-css.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="js/registration-validation.js"></script>
		<script type="text/javascript">
	        function noBack()
	         {
	             window.history.forward()
	         }
	        noBack();
	        window.onload = noBack;
	        window.onpageshow = function(evt) { if (evt.persisted) noBack() }
	        window.onunload = function() { void (0) }
  	 	 </script>
		<title>Homepage</title>
	</head>
<body>
	<div class="mid">
		<header>
			<h1>Homepage</h1>
		</header>

			<ul>
				<li><a href="#">etc</a></li>
				<li><a href="#">New</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="#">About</a></li>
				<li><a href="login.cfm">Login with other id</a></li>
				<li><a href="registration.cfm">Register new user</a></li>
				<li><cfoutput><h3 id = "loginname">Hello #session.login.name#</h3></cfoutput></li>
			</ul>

			<img src="images/wallpaper.png" height="50%" width="100%">

			<cffunction name="logout" returntype="string" output="false">
				<cfset StructDelete(Session,"login")>
					<cfheader name="Expires" value="Tue, 01 Jan 1985 00:00:01 GMT">
					<cfheader name="Pragma" value="no-cache">
					<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
			</cffunction><br><br>

			<cfform action="login.cfm" method="post">
				<cfinput name="btn" type="submit" value="Logout" id="btnlogout" onclick="#logout()#">
			</cfform><br>

		<footer>
			<hr>
			<img src="images/footer.png" width="100%">
		</footer>
	</div>
</body>
</html>
