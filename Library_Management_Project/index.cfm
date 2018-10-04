<cfif NOT Application.loginService.isUserLoggedIn()>
	<!---  headers for disabling cache for this page  --->
	<cfheader name="Pragma" value="no-cache">
	<cfheader name="cache-control" value="no-cache, no-store, must-revalidate">
<html>
	<head>
		<title>Homepage</title>
		<!---  Google Fonts  --->
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
		<!---  Css files  --->
		<link rel="stylesheet" href="assets/css/homepage.css" type="text/css"> 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/assets/js/homepage.js"></script>
	</head>
	<body>
		<header>
			<b>LIBRARY MANAGEMENT STUDIO</b>
		</header>

		<div class="navbar">
			<a class="nav-right" href="#home">Help</a>
			<a class="nav-right" href="#news">Contact Us</a>
			<a class="nav-right" href="#news">About</a>

			<div class="dropdown">
				<button class="dropbtn">Login as
					<i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="common/user_login.cfm">User/Admin</a>
				</div>
			</div>


			<div class="dropdown">
				<button class="dropbtn">Register
					<i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="/user/views/register_user.cfm">New User</a>
				</div>
			</div>
				<a class="nav-left"><strong>libmanager.com</strong></a>
		</div>

		<div class="container-homepage" >
			  <img class="mySlides" src="assets/images/001.jpg" style="height:100%;width:100%;">
			  <img class="mySlides" src="assets/images/002.jpg" style="height:100%;width:100%;">
			  <img class="mySlides" src="assets/images/003.jpg" style="height:100%;width:100%;">
		</div>

			<script>
					var myIndex = 0;
					carousel();

					function carousel() {
					    var i;
					    var x = document.getElementsByClassName("mySlides");
					    for (i = 0; i < x.length; i++) {
					       x[i].style.display = "none";
					    }
					    myIndex++;
					    if (myIndex > x.length) {myIndex = 1}
					    x[myIndex-1].style.display = "block";
					    setTimeout(carousel, 2000); // Change image every 2 seconds
					}
			</script>


		<cfinclude template="common/includes/footer.cfm">
	</body>
</html>
<cfelseif session.user_type EQ 'user'>
	<cflocation url="user/views/dashboard.cfm" addtoken="no">
<cfelseif session.user_type EQ 'admin'>
	<cflocation url="admin/views/dashboard.cfm" addtoken="no">
</cfif>