<!DOCTYPE html>
<html ondragstart='event.preventDefault();'>
	<head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.name')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="span">
					<h1>${this.question.title}</h1>

					<!-- Flash info -->
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<!-- Display the information of the current user -->
					<table>
						<tr>
							<td><label>${message(code: 'question.creationDate')}</label></td>
							<td>${question.creationDate}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'question.user')}</label></td>
							<td>${question.user.username}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'question.text')}</label></td>
							<td>${question.text}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'question.views')}</label></td>
							<td>${question.views}</td>
						</tr>
						<g:each var="comment" in="${question.comments}">
							<tr>
								<td><label>${message(code: 'question.comments')}</label></td>
								<td>${comment}</td>
							</tr>
						</g:each>
					</table>

					<!-- Edit and delete boutons -->
					<g:if test="${session.user != null && session.user.id == question.user.id}">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${this.question}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
							<input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
						</fieldset>
					</g:if>

					<!-- Answers -->
					<h1>${message(code: 'question.answers')}</h1>
					<table>
						<tr>
							<td><label>${message(code: 'answer.user')}</label></td>
							<td><label>${message(code: 'answer.text')}</label></td>
						</tr>
						<g:each var="answer" in="${question.answers}">
							<tr>
								<td>answer.user.username</td>
								<td><a href="${createLink(uri: '/user/show')}/${answer.user.id}">answer.user.username</a></td>
								<td>answer.text</td>
							</tr>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
