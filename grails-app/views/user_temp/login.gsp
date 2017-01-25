<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.title')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="span">
					<h1>${message(code: 'login.authentication')}</h1>

					<form method='post' action='login'>
						<table id="loginForm">
							<tr>
								<td><label>${message(code: 'user.username')}</label><td/>
								<td><input type='text' name='username'/><td/>
							</tr>
							<tr>
								<td><label>${message(code: 'user.password')}</label><td/>
								<td><input type='password' name='password'/><td/>
							</tr>
						</table>

						<fieldset class="buttons">
							<g:submitButton name="auth" value="${message(code: 'login.login')}"/>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
