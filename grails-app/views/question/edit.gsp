<!DOCTYPE html>
<html ondragstart='event.preventDefault();'>
	<head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.name')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	</head>

	<body>
		<a href="#edit-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="edit-question" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]"/></h1>
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
			<g:form resource="${this.question}" method="PUT">
				<g:hiddenField name="version" value="${this.question?.version}"/>
				<fieldset class="form">
					<f:all bean="question"/>
				</fieldset>
				<fieldset class="buttons">
					<input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
