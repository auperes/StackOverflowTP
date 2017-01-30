<!DOCTYPE html>

<html ondragstart='event.preventDefault();'>
	<head>
		<meta name="layout" content="main"/>
		<asset:stylesheet src="style.css"/>
	</head>

	<body>
		<!-- NAVBAR -->
		<div id='navbar-container'>
			<ul id='navbar'>
				<li><a data-tab='#tab1' class='navbar-item navbar-item-selected'><span id='tab1-name'>CREATE</span></a></li>
				<li><a data-tab='#tab2' class='navbar-item'><span id='tab2-name'>UPDATE</span></a></li>
				<li><a data-tab='#tab3' class='navbar-item'><span id='tab3-name'>SHOW</span></a></li>
				<li><a data-tab='#tab4' class='navbar-item'><span id='tab4-name'>EDIT</span></a></li>
			</ul>
		</div>

		<!-- MAIN VIEW -->
		<div id='mainview'>
			<div id='mainview-content'>
				<!-- tab 1 -->
				<div id='tab1' class='page'>
					<div class="container">
						<div class="row">
							<div class="span">
								<h1>${message(code: 'question.new')}</h1>

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

								<!-- Question creation form -->
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

											<g:hiddenField name="views" value="0"/>
											<g:hiddenField name="user.id" value="${session.user.id}"/>
										</table>
									</fieldset>

									<fieldset class="buttons">
										<g:submitButton name="create" value="${message(code: 'question.ask')}"/>
									</fieldset>
								</g:form>
							</div>
						</div>
					</div>
				</div>

				<!-- tab 2 -->
				<div id='tab2' class='page hidden'>
					<div class="container">
						<div class="row">
							<div class="span">
								<h1>${message(code: 'question.update')}</h1>

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
						</div>
					</div>
				</div>

				<!-- tab 3 -->
				<div id='tab3' class='page hidden'>
					<div class="container">
						<div class="row">
							<div class="span">
								<h1>${message(code: 'question.show')}</h1>

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
	
								<div class="pagination">
									<g:paginate total="${questionCount ?: 0}"/>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- tab 4 -->
				<div id='tab4' class='page hidden'>
					<div class="container">
						<div class="row">
							<div class="span">
								<h1>${message(code: 'question.edit')}</h1>

								<f:display bean="question"/>

								<g:form resource="${this.question}" method="DELETE">
									<fieldset class="buttons">
										<g:link class="edit" action="edit" resource="${this.question}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
										<input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
									</fieldset>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<asset:javascript src="loadSubmenu.js"/>
	</body>
</html>
