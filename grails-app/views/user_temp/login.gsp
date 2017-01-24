<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="title.login" /></title>
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
