<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'user_temp.label', default: 'User_temp')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="span">
					<h1>${message(code: 'user.myanswers')}</h1>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

				   <table>
						<tr>
							<td><label>${message(code: 'intervention.date')}</label></td>
							<td><label>${message(code: 'question.title')}</label></td>
						</tr>
						<g:each var="answer" in="${user_temp.answers}">
							<tr>
								<td><label>${answer.creationDate}</label></td>
								<td><a href="${createLink(uri: '/answer/show')}/${answer.id}">${answer.question.title}</a></td>
							</tr>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
