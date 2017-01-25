<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${message(code: 'site.title')}</title>
		<asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
	</head>

	<body>
		<!-- CONTENU DE LA PAGE -->
		<div id="content" role="main">
			<section class="row colset-2-its">
				<h1>${message(code: 'home.welcome')} MyStackOverFlow</h1>

				<p>${message(code: 'site.description')}</p>
			</section>
		</div>
	</body>
</html>
