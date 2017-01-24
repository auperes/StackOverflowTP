<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user_temp.label', default: 'User_temp')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>

    <body>
        <a href="#create-user_temp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div class="container">
            <div class="row">
                <div class="span">
					<h1><g:message code="user.creation"/></h1>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<g:hasErrors bean="${this.user}">
						<ul class="errors" role="alert">
							<g:eachError bean="${this.user}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>

					<g:form action="save">
						<fieldset class="form">
							<table id="userForm">
								<tr>
									<td><label>${message(code: 'user.username')}</label></td>
									<td><g:textField maxlength="15" name="username" value="${params.username}"/></td>
								</tr>
								<tr>
									<td><label>${message(code: 'user.password')}</label></td>
									<td><g:field maxlength="20" type="password" name="password" /></td>
								</tr>
								<tr>
									<td><label>${message(code: 'user.confirmPassword')}</label></td>
									<td><g:field maxlength="20" type="password" name="confirmPassword" /></td>
								</tr>
							</table>
						</fieldset>

						<fieldset class="buttons">
							<g:submitButton name="create" value="${message(code: 'user.signup')}" />
						</fieldset>
					</g:form>
				</div>
            </div>
        </div>
    </body>
</html>
