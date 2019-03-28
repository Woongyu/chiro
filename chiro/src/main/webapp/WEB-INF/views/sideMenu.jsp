<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>사이드메뉴</title>
<style type="text/css">
.effect {
	width: 150px;
	height: 150px;
	margin-bottom: 25px;
}
.effect img {
	width: 100%;
    border-radius: 50%;
}
</style>
</head>
<body>
	<!-- Sidebar -->
	<div class="inner">

		<!-- Search -->
		<section id="search" class="alt">
			<form method="post" action="#">
				<input type="text" name="query" id="query" placeholder="Search" />
			</form>
		</section>
		
		<!-- Menu -->
		<nav id="menu">
		
			<!-- Image -->
			<div class="effect">
				<img src="/images/icon_chiro.jpeg" />
			</div>
			
			<header class="major">
				<h2>메뉴</h2>
			</header>
			<ul>
				<li><a href="#this" id="side_main">메인</a></li>
				<li><a href="#this" id="side_join">등록하기</a></li>
				<li><a href="elements.html">Elements</a></li>
				<li><span class="opener">Submenu</span>
					<ul>
						<li><a href="#">Lorem Dolor</a></li>
						<li><a href="#">Ipsum Adipiscing</a></li>
						<li><a href="#">Tempus Magna</a></li>
						<li><a href="#">Feugiat Veroeros</a></li>
					</ul></li>
				<li><a href="#">Etiam Dolore</a></li>
				<li><a href="#">Adipiscing</a></li>
				<li><span class="opener">Another Submenu</span>
					<ul>
						<li><a href="#">Lorem Dolor</a></li>
						<li><a href="#">Ipsum Adipiscing</a></li>
						<li><a href="#">Tempus Magna</a></li>
						<li><a href="#">Feugiat Veroeros</a></li>
					</ul></li>
				<li><a href="#">Maximus Erat</a></li>
				<li><a href="#">Sapien Mauris</a></li>
				<li><a href="#">Amet Lacinia</a></li>
			</ul>
		</nav>

		<!-- Section -->
		<section>
			<header class="major">
				<h2>오시는길</h2>
			</header>
			<p>약물이나 수술 없이 요통, 두통, 목, 어깨의 통증을 근본적으로 치유하는 임상 카이로프랙틱학의 정수로 여러분을
				모십니다.</p>
			<ul class="contact">
				<li class="fa-home">
					<a href="https://chiro76.modoo.at"
					target="_blank">카이로76 [국제카이로치유연구소]</a><br />
					서울특별시 마포구 도화동 4-48 2층<br />
					공덕 이마트 뒷편(공덕역 10번 출구) 오르막 30m 에이스부동산 2층에 위치하고 있습니다.
				</li>
				<li class="fa-phone"><a href="tel:0507-1454-4391" target="_blank">0507-1454-4391</a><br />
				<a href="tel:010-3917-0805" target="_blank">010-3917-0805</a>
				</li>
				<li class="fa-heart">
					- 평일 10:00 ~ 19:00<br />
					예약으로만 운영되며 전화, 문자 또는 온라인예약이 가능합니다.<br />
					- 일요일 15:00 ~ 18:00<br />
					일요일은 휴무이며 응급환자만 받습니다.
				</li>
			</ul>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Copyright <a href="https://open.kakao.com/me/schna"
					target="_blank">WoonGyu Choi</a> All Rights Reserved.
			</p>
		</footer>

	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#side_main").on("click", function(e) {
				e.preventDefault();
				fn_openMainPage();
			});
			
			$("#side_join").on("click", function(e) {
				e.preventDefault();
				fn_openJoinPage();
			});
		});
		
		function fn_openMainPage() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main.do' />");
			comSubmit.submit();
		}
		
		function fn_openJoinPage() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/join.do' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>