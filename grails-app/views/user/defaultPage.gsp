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
				<li><a data-tab='#tab1' class='navbar-item navbar-item-selected'><span id='tab1-name'>${message(code: 'user.myprofile').toUpperCase()}</span></a></li>
				<li><a data-tab='#tab2' class='navbar-item'><span id='tab2-name'>${message(code: 'user.myquestions').toUpperCase()}</span></a></li>
				<li><a data-tab='#tab3' class='navbar-item'><span id='tab3-name'>${message(code: 'user.myanswers').toUpperCase()}</span></a></li>
				<li><a data-tab='#tab4' class='navbar-item'><span id='tab2-name'>EDITER</span></a></li>
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
								<h1>${message(code: 'user.myprofile')}</h1>

								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>

								<!-- Display the information of the current user -->
								<table>
									<tr>
										<td><label>${message(code: 'user.lastname')}</label></td>
										<td>${user.lastname}</td>
									</tr>
									<tr>
										<td><label>${message(code: 'user.firstname')}</label></td>
										<td>${user.firstname}</td>
									</tr>
									<tr>
										<td><label>${message(code: 'user.role')}</label></td>
										<td>${user.role}</td>
									</tr>
									<tr>
										<td><label>${message(code: 'user.comments')}</label></td>
										<td>${user.comments.size()}</td>
									</tr>
									<tr>
										<td><label>${message(code: 'user.answers')}</label></td>
										<td>${user.answers.size()}</td>
									</tr>
									<tr>
										<td><label>${message(code: 'user.questions')}</label></td>
										<td>${user.questions.size()}</td>
									</tr>
									<tr>
										<td><label>${message(code: 'user.creationdate')}</label></td>
										<td>${user.registration}</td>
									</tr>
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
								<h1>${message(code: 'user.myquestions')}</h1>

								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>

								<!-- Display the questions of the current user -->
							   <table>
									<tr>
										<td><label>${message(code: 'intervention.date')}</label></td>
										<td><label>${message(code: 'question.title')}</label></td>
									</tr>
									<g:each var="question" in="${user.questions}">
										<tr>
											<td><label>${question.creationDate}</label></td>
											<td><a href="${createLink(uri: '/question/show')}/${question.id}">${question.title}</a></td>
										</tr>
									</g:each>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- tab 3 -->
				<div id='tab3' class='page hidden'>
					<div class="container">
						<div class="row">
							<div class="span">
								<h1>${message(code: 'user.myanswers')}</h1>

								<g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>

								<!-- Display the answers of the current user -->
							   <table>
									<tr>
										<td><label>${message(code: 'intervention.date')}</label></td>
										<td><label>${message(code: 'question.title')}</label></td>
									</tr>
									<g:each var="answer" in="${user.answers}">
										<tr>
											<td><label>${answer.creationDate}</label></td>
											<td><a href="${createLink(uri: '/answer/show')}/${answer.id}">${answer.question.title}</a></td>
										</tr>
									</g:each>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- tab 4 -->
				<div id='tab4' class='page hidden'>
					
				</div>
			</div>
		</div>

		<asset:javascript src="loadSubmenu.js"/>
	</body>
</html>
