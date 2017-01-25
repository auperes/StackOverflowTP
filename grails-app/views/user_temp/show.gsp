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
					<h1>${message(code: 'user.myprofile')}</h1>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<table>
						<tr>
							<td><label>${message(code: 'user.username')}</label></td>
							<td><f:display bean="user_temp" property="username" /></td>
						</tr>
						<tr>
							<td><label>${message(code: 'user.role')}</label></td>
							<td>${user_temp.role}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'user.comments')}</label></td>
							<td>${user_temp.questions.size()}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'user.answers')}</label></td>
							<td>${user_temp.questions.size()}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'user.questions')}</label></td>
							<td>${user_temp.questions.size()}</td>
						</tr>
						<tr>
							<td><label>${message(code: 'user.votes')}</label></td>
							<td><f:display bean="user_temp" property="nbVotes" /></td>
						</tr>
						<tr>
							<td><label>${message(code: 'user.creationdate')}</label></td>
							<td><f:display bean="user_temp" property="creation" /></td>
						</tr>
					</table>

					<g:form resource="${this.user_temp}" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${this.user_temp}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
