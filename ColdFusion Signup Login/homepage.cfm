<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/registration-form-cf-css.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="js/registration-validation.js"></script>
		<style>
			ul {
			    list-style-type: none;
			    margin: 0;
			    padding: 0;
			    overflow: hidden;
			    background-color: #333;
			}

			li a{
			    float: right;
			}

			li a {
			    display: block;
			    color: white;
			    text-align: center;
			    padding: 14px 16px;
			    text-decoration: none;
			}

			li a:hover {
			    background-color: #111;
			}
			#loginname{
				float: left;
				margin-left: 40px;
			    color: white;
			}
			#btnlogout{
			width: 15%;
			}
		</style>
		<title>Homepage</title>
	</head>
<body>
	<div class="mid">
		<header>
			<h1>Homepage</h1>
		</header>

			<ul>
				<li><a class="active" href="#home">etc</a></li>
				<li><a href="#news">News</a></li>
				<li><a href="#contact">Contact</a></li>
				<li><a href="#about">About</a></li>
				<li><cfoutput><h1 id = "loginname">Hello #session.login.name#</h1></cfoutput></li>
			</ul>

			<img src="images/wallpaper.png" height="50%" width="100%">

			<cffunction name="logout" returntype="string" output="false">
				<cfset StructDelete(Session,"login")>
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