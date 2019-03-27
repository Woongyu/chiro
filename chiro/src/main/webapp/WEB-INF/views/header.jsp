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
			fn_openIndexPage();
		});
		
		$("a[name='icon_link']").on("click", function(e) {
			e.preventDefault();
			fn_iconLink();
		});
	});
	
	function fn_openIndexPage() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/index.do' />");
		comSubmit.submit();
	}
	
	function fn_iconLink() {
		alert("해당 기능은 준비중입니다.");
		return false;
	}
	</script>
</body>
</html>