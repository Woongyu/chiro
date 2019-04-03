<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>Page Error</title>
<style type="text/css">
body {
	background-image: url('/images/error-pages.jpg');
}
p {
	font-size: 16px;
	color: white;
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
			<div class="inner">
				
				<section>
					<header class="main">
						<h1>Error Page</h1>
					</header>
					
					<div class="box">
						<p><c:out value="${exception.getMessage()}" /></p>
						<p><c:out value="${exception.getStackTrace()}" /></p>
					</div>
				</section>
				
			</div>
		</div>
	
	</div>
</body>
</html>