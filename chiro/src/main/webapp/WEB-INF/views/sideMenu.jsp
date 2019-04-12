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
				<img src="/images/icon_chiro.jpeg" onclick="fn_goMain();" style="cursor: pointer;"/>
			</div>
			
			<header class="major">
				<h2>메뉴</h2>
			</header>
			<ul>
				<li><a href="#this" id="side_main">메인</a></li>
				<li><a href="#thid" id="side_notice">공지사항</a></li>
				<li><span class="opener">회원관리</span>
					<ul>
						<li><a href="#this" id="side_join">회원등록</a></li>
						<li><a href="#this" id="side_userList">회원목록</a></li>
					</ul>
				</li>
				<li><span class="opener">예약관리</span>
					<ul>
						<li><a href="#">예약등록</a></li>
						<li><a href="#">예약조회</a></li>
					</ul>
				</li>
				<li><a href="#this">고객 게시판</a></li>
				<li><span class="opener">건강상식</span>
					<ul>
						<li><a href="#">냉온찜질의 올바른 사용법</a></li>
						<li><a href="#">어깨통증과 바른자세</a></li>
						<li><a href="#">장요근과 허리통증</a></li>
					</ul>
				</li>
				<li><span class="opener">카이로 프로그램</span>
					<ul>
						<li><a href="#">기초반 연수생 모집안내</a></li>
						<li><a href="#">교육 및 과정</a></li>
					</ul>
				</li>
				<li><a href="#this">이벤트</a></li>
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
				<li class="fa-phone">
					<a href="tel:0507-1454-4391" target="_blank">0507-1454-4391</a><br />
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
	
	<!-- Scripts -->
	<script src="<c:url value='/js/main.js'/>" charset="utf-8"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#side_main").on("click", function(e) {
			e.preventDefault();
			fn_goMain();
		});
		
		$("#side_join").on("click", function(e) {
			e.preventDefault();
			fn_goJoin();
		});
		
		$("#side_userList").on("click", function(e) {
			e.preventDefault();
			fn_goUserList();
		});
		
		$("#side_notice").on("click", function(e) {
			e.preventDefault();
			fn_goNotice();
		});
	});
	
	function fn_goMain() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main.do' />");
		comSubmit.submit();
	}
	
	function fn_goJoin() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/join.do' />");
		comSubmit.submit();
	}
	
	function fn_goUserList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/userList.do' />");
		comSubmit.submit();
	}
	
	function fn_goNotice() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board.do' />");
		comSubmit.addParam("command", "notice");
		comSubmit.submit();
	}
	</script>
</body>
</html>