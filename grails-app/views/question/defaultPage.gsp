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
				<li><a data-tab='#tab1' class='navbar-item navbar-item-selected'><span id='tab1-name'>${message(code: 'question.last_1').toUpperCase()}</span></a></li>
				<li><a data-tab='#tab2' class='navbar-item'><span id='tab2-name'>${message(code: 'question.popular_1').toUpperCase()}</span></a></li>
				<g:if test="${session.user}">
					<li><a data-tab='#tab3' class='navbar-item'><span id='tab3-name'>${message(code: 'question.create_1').toUpperCase()}</span></a></li>
				</g:if>
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
								<h1>${message(code: 'question.last_2')}</h1>

								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>

								<!-- Display the questions of the current user -->
							   <table>
								   	<tr>
										<td><label>${message(code: 'question.creationDate')}</label></td>
										<td><label>${message(code: 'question.title')}</label></td>
										<td><label>${message(code: 'question.numberofanswers')}</label></td>
										<td><label>${message(code: 'question.numberofviews')}</label></td>
										<td><label>${message(code: 'question.user')}</label></td>
									</tr>
									<g:each var="question" in="${questionList}">
										<tr>
											<td>${question.creationDate}</td>
											<td><a href="${createLink(uri: '/question/show')}/${question.id}">${question.title}</a></td>
											<td>${question.answers.size()}</td>
											<td>${question.views}</td>
											<td><a href="${createLink(uri: '/user/show')}/${question.user.id}">${question.user.username}</a></td>
										</tr>
									</g:each>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- tab 2 -->
				<div id='tab2' class='page hidden'>
					<div class="container">
						<div class="row">
							<div class="span">
								<h1>${message(code: 'question.popular_2')}</h1>

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


							</div>
						</div>
					</div>
				</div>

				<!-- tab 3 -->
				<g:if test="${session.user}">
					<div id='tab3' class='page hidden'>
						<div class="container">
							<div class="row">
								<div class="span">
									<h1>${message(code: 'question.create_2')}</h1>

									<g:if test="${flash.message}">
										<div class="message" role="status">${flash.message}</div>
									</g:if>

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
				</g:if>
			</div>
		</div>

		<asset:javascript src="loadSubmenu.js"/>
	</body>
</html>
