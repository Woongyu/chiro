<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>헤더</title>
</head>
<body>
	<header id="header">
		<a href="#this" id="head_main" class="logo"><strong>Chiro76</strong> 국제 카이로
			치유 연구소</a>
		<ul class="icons">
			<li><a href="#" name="icon_link" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" name="icon_link" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" name="icon_link" class="icon fa-snapchat-ghost"><span
					class="label">Snapchat</span></a></li>
			<li><a href="#" name="icon_link" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" name="icon_link" class="icon fa-medium"><span class="label">Medium</span></a></li>
		</ul>
	</header>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#head_main").on("click", function(e) {
			e.preventDefault();
			fn_openMainPage();
		});
		
		$("a[name='icon_link']").on("click", function(e) {
			e.preventDefault();
			gfn_readyAlert();
		});
	});
	
	function fn_openMainPage() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main.do' />");
		comSubmit.submit();
	}
	</script>
</body>
</html>