<!DOCTYPE html>
<html ondragstart='event.preventDefault();'>
	<head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.name')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<asset:stylesheet src="application.css"/>
		<asset:stylesheet src="style.css"/>
		<g:layoutHead/>
	</head>

	<body>
		<ul class="gn-menu-main">
			<li><a id="home" href="${createLink(uri: '/')}"></a></li>
			<li><a href="${createLink(uri: '/question/defaultPage')}">${message(code: 'menu.questions')}</a></li>
			<li><a href="${createLink(uri: '/answer/defaultPage')}">${message(code: 'menu.answers')}</a></li>

			<g:if test="${session.user}">
				<li class="last-child"><a href="${createLink(uri: '/user/logout')}" id="deconnexion">${message(code: 'menu.logout')}</a></li>
				<li class="last-child"><a href="${createLink(uri: '/user/defaultPage')}">${message(code: 'menu.profile')}</a></li>
			</g:if>

			<g:else>
				<li class="last-child"><a href="${createLink(uri: '/user/create')}">${message(code: 'menu.signup')}</a></li>
				<li class="last-child"><a href="${createLink(uri: '/user/login')}">${message(code: 'menu.login')}</a></li>
			</g:else>
		</ul>
		<g:layoutBody/>
	</body>
</html>
