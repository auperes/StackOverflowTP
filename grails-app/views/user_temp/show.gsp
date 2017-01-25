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
					<h1>${message(code: 'user.myprofile')}</h1>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<!-- Display the information of the current user -->
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
				</div>
			</div>
		</div>
	</body>
</html>
