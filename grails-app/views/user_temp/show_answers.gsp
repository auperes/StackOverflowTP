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
						<g:each var="answer" in="${user_temp.answers}">
							<tr>
								<td><label>${answer.creationDate}</label></td>
								<td><a href="${createLink(uri: '/answer/show')}/${answer.id}">${answer.question.title}</a></td>
							</tr>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
