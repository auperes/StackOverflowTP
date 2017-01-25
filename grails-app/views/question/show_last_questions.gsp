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
					<h1>${message(code: 'user.myquestions')}</h1>

					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>

					<!-- Display the last questions of the site -->
				   <table>
						<tr>
							<td><label>${message(code: 'intervention.date')}</label></td>
							<td><label>${message(code: 'question.title')}</label></td>
						</tr>
						<g:each var="question" in="${Question.findAll("from Question order by creationDate", [max: 20])}">
							<tr>
								<td><label>${question.creationDate}</label></td>
								<td><a href="${createLink(uri: '/question/show')}/${question.id}">${question.title}</a></td>
							</tr>
						</g:each>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
