<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>

	<body>
		<a href="#create-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
 
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="create-question" class="content scaffold-create" role="main">
			<h1><g:message code="question.new" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:hasErrors bean="${this.question}">
				<ul class="errors" role="alert">
					<g:eachError bean="${this.question}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
			</g:hasErrors>

			<g:form action="save">
				<fieldset class="form">
					<table id="userForm">
						<tr>
							<td><label>${message(code: 'question.title')}</label></td>
							<td><g:textField maxlength="50" name="title" value="${params.title}"/></td>
						</tr>
						<tr>
							<td><label>${message(code: 'question.text')}</label></td>
							<td><g:field maxlength="500" name="text" value="${params.text}"/></td>
						</tr>

						<g:hiddenField name="views" value="0" />
						<g:hiddenField name="user.id" value="${session.user.id}" />
					</table>
				</fieldset>

				<fieldset class="buttons">
					<g:submitButton name="create" value="${message(code: 'question.ask')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
