<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HTBStore</title>
<tiles:insertAttribute name="head" />
</head>
<body>

	<div class="container">
		<header class="row">
			<h1>HTBStore</h1>

		</header>
		<nav class="row">
			<tiles:insertAttribute name="menu" />
		</nav>
		<div class="row">
			<article class="col-sm-9">
				<tiles:insertAttribute name="body"/>
				
			</article>
			<aside class="col-sm-3">
				<tiles:insertAttribute name="aside" />

			</aside>
		</div>
		<footer>
			<p class="text-center">&copy;2020 by Huynh The Bao</p>
		</footer>
	</div>

</body>
</html>