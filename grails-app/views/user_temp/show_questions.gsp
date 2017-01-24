<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'user_temp.label', default: 'User_temp')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>

	<body>
		<div id="show-user_temp" class="content scaffold-show" role="main">
			<h1><g:message code="${message(code: 'user.myquestions')}" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

           <table>
				<tr>
					<td><label>${message(code: 'intervention.date')}</label></td>
					<td><label>${message(code: 'question.title')}</label></td>
				</tr>
				<g:each var="question" in="${user_temp.questions}">
					<tr>
						<td><label>${question.creationDate}</label></td>
						<td><a href="${createLink(uri: '/question/show')}/${question.id}">${question.title}</a></td>
					</tr>
				</g:each>
            </table>
		</div>
	</body>
</html>
