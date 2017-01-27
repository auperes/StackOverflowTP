<!DOCTYPE html>
<html ondragstart='event.preventDefault();'>
	<head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.name')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="span">
					<h1>${message(code: 'user.profile')}</h1>

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
	</body>
</html>
