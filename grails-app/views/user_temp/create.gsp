<!DOCTYPE html>
<html>
    <head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.title')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    </head>

    <body>
		<div class="container">
			<div class="row">
				<div class="span">
					<h1>${message(code: 'user.signup')}</h1>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<!-- Errors -->
					<g:hasErrors bean="${this.user_temp}">
						<ul class="errors" role="alert">
							<g:eachError bean="${this.user_temp}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>

					<!-- User creation form -->
					<g:form action="save">
						<table id="form">
							<tr>
								<td><label>${message(code: 'user.username')}</label><td/>
								<td><input type='text' name='username'/><td/>
							</tr>
							<tr>
								<td><label>${message(code: 'user.password')}</label><td/>
								<td><input type='password' name='password'/><td/>
							</tr>
						</table>

						<!-- Submit button -->
						<fieldset class="buttons">
							<g:submitButton name="auth" class="save" value="${message(code: 'user.signup')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
    </body>
</html>
