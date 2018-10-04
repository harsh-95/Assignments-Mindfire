
		<header>
			<b>LIBRARY MANAGEMENT PROJECT</b>
		</header>

		<div class="navbar">
			<a><button class="nav-right" id="logout" onclick="confirmLogout()">Logout</button></a>

			<a class="nav-right" href="#news">Contact Us</a>
			<a class="nav-right" href="#news">About</a>

			<a class="nav-left"><strong>libmanager.com</strong></a>
				<a class="nav-left">
					<strong>
						<cflock timeout="10" scope="Session" type="exclusive">
							<cfoutput>#SESSION.name#</cfoutput>
						</cflock>
					</strong>
				</a>
		</div>

