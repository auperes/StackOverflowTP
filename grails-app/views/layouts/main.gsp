<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<title>
			<g:layoutTitle default="Grails"/>
		</title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>

		<asset:stylesheet src="application.css"/>

		<g:layoutHead/>
	</head>

	<body>
		<div class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<!-- MINIMIZED NAV BARRE -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					<!-- ICONE DU SITE -->
					<a class="navbar-brand" href="${createLink(uri: '/')}">
						<i class="fa grails-icon">
							<asset:image src="MSOF-logo-white.png"/>
						</i>
						My StackOverflow
					</a>
				</div>

				<div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
					<!-- NORMAL NAV BARRE -->
					<ul class="nav navbar-nav navbar-right">
						<!-- HOME -->
						<li><a class="home" href="${createLink(uri: '/')}">${message(code: 'menu.home')}</a></li>

						<!-- NOUVEAU MENU -->
						<g:if test="${session.user}">
							<!-- PROFILE MENU -->
							<li><a href="${createLink(uri: '/user_temp/show')}/${session.user.id}">${message(code: 'menu.profile')}</a></li>

							<!-- QUESTION MENU -->
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${message(code: 'menu.questions')}<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${createLink(uri: '/user_temp/show_questions')}/${session.user.id}">${message(code: 'menu.myquestions')}</a></li>
									<li><a href="${createLink(uri: '/question/create')}">${message(code: 'menu.ask')}</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="${createLink(uri: '/question/show_last_questions')}">${message(code: 'menu.lastquestions')}</a></li>
									<li><a href="#">${message(code: 'menu.bestquestions')}</a></li>
									<li><a href="#">${message(code: 'menu.questionsbytag')}</a></li>
								</ul>
							</li>

							<!-- ANSWER MENU -->
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${message(code: 'menu.answers')}<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${createLink(uri: '/user_temp/show_answers')}/${session.user.id}">${message(code: 'menu.myanswers')}</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">${message(code: 'menu.lastanswers')}</a></li>
									<li><a href="#">${message(code: 'menu.bestanswers')}</a></li>
								</ul>
							</li>

							<!-- LOG OUT -->
							<li><a href="${createLink(uri: '/user_temp/logout')}">${message(code: 'menu.logout')}</a></li>
						</g:if>
						<g:else>
							<!-- LOG IN -->
							<li><a href="${createLink(uri: '/user_temp/login')}">${message(code: 'menu.login')}</a></li>

							<!-- SIGN UP -->
							<li><a href="${createLink(uri: '/user_temp/create')}">${message(code: 'menu.signup')}</a></li>
						</g:else>
					</ul>
				</div>
			</div>
		</div>

		<!-- LOGO CENTRAL GRAILS -->
		<div class="svg" role="presentation">
			<div class="grails-logo-container">
				<asset:image src="MSOF.png" class="grails-logo"/>
			</div>
		</div>

		<g:layoutBody/>

		<div id="spinner" class="spinner" style="display:none;">
			<g:message code="spinner.alt" default="Loading&hellip;"/>
		</div>

		<asset:javascript src="application.js"/>
	</body>
</html>
