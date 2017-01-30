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
				<!-- errors -->
				<g:hasErrors bean="${this.question}">
					<ul class="errors" role="alert">
						<g:eachError bean="${this.question}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>

				<!-- tab 1 -->
				<div id='tab1' class='page'>
					<div id="create-answer" class="content scaffold-create" role="main">
						<h1><g:message code="default.create.label" args="[entityName]"/></h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>

						<g:hasErrors bean="${this.answer}">
							<ul class="errors" role="alert">
								<g:eachError bean="${this.answer}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
						</g:hasErrors>

						<g:form action="save">
							<fieldset class="form">
								<f:all bean="answer"/>
							</fieldset>
							<fieldset class="buttons">
								<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/>
							</fieldset>
						</g:form>
					</div>
				</div>

				<!-- tab 2 -->
				<div id='tab2' class='page hidden'>
					<div id="edit-answer" class="content scaffold-edit" role="main">
						<h1><g:message code="default.edit.label" args="[entityName]"/></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<g:hasErrors bean="${this.answer}">
						<ul class="errors" role="alert">
							<g:eachError bean="${this.answer}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
						</g:hasErrors>
						<g:form resource="${this.answer}" method="PUT">
							<g:hiddenField name="version" value="${this.answer?.version}"/>
							<fieldset class="form">
								<f:all bean="answer"/>
							</fieldset>
							<fieldset class="buttons">
								<input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
							</fieldset>
						</g:form>
					</div>
				</div>

				<!-- tab 3 -->
				<div id='tab3' class='page hidden'>
					<div id="list-answer" class="content scaffold-list" role="main">
						<h1><g:message code="default.list.label" args="[entityName]"/></h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
						<f:table collection="${answerList}"/>

						<div class="pagination">
							<g:paginate total="${answerCount ?: 0}"/>
						</div>
					</div>
				</div>

				<!-- tab 4 -->
				<div id='tab4' class='page hidden'>
					<div id="show-answer" class="content scaffold-show" role="main">
						<h1><g:message code="default.show.label" args="[entityName]"/></h1>
						<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						<f:display bean="answer"/>
						<g:form resource="${this.answer}" method="DELETE">
							<fieldset class="buttons">
								<g:link class="edit" action="edit" resource="${this.answer}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
								<input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>

		<asset:javascript src="loadSubmenu.js"/>
	</body>
</html>
