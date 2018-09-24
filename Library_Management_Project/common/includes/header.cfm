		<header>
			<b>LIBRARY MANAGEMENT STUDIO</b>
		</header>

		<div class="navbar">
			<a href="/common/handlers/logout_handler.cfm" class="nav-right" id="logout">Logout</a>
			<a class="nav-right" href="#home">Help</a>
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