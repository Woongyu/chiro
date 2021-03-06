<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
#login > * {
	float: right;
	font-style: italic;
}
#USER_NAME {
	margin-top: 1.0em;
}
#btnLogin {
	margin-bottom: 1.0em;
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
			
			<div id="login" style="padding-bottom: 1.5em;">
				<c:if test="${empty sessionScope.loginInfo.USER_KEY}">
					<a href="#this" id="side_login">로그인</a>
				</c:if>
				<c:if test="${not empty sessionScope.loginInfo.USER_KEY}">
					<strong>'${sessionScope.loginInfo.USER_NAME}' 님 환영합니다.</strong><br />
					<a href="#this" id="side_logout">로그아웃</a>
				</c:if>
			</div>
			
			<header class="major">
				<h2>메뉴</h2>
			</header>
			<ul>
				<li><a href="#this" id="side_main">메인</a></li>
				<li><a href="#this" id="side_notice">공지사항</a></li>
				<li><span id="member" class="opener">회원관리</span>
					<ul>
						<li><a href="#this" id="side_join">회원등록</a></li>
						<li><a href="#this" id="side_userList">회원목록</a></li>
						<li><a href="#this">추가횟수구매</a></li>
						<li><a href="#this">계정부여</a></li>
					</ul>
				</li>
				<li><span class="opener">예약관리</span>
					<ul>
						<li><a href="#">예약등록</a></li>
						<li><a href="#">예약조회</a></li>
					</ul>
				</li>
				<li><a href="#this" id="side_customer">고객 게시판</a></li>
				<li><span id="health" class="opener">건강상식</span>
					<ul>
						<li><a href="#this" id="side_useOfPack">냉온찜질의 올바른 사용법</a></li>
						<li><a href="#this" id="side_shoulderPain">어깨통증과 바른자세</a></li>
						<li><a href="#this" id="side_backache">장요근과 허리통증</a></li>
					</ul>
				</li>
				<li><span id="recruit" class="opener">카이로 프로그램</span>
					<ul>
						<li><a href="#this" id="side_recruitment">기초반 연수생 모집안내</a></li>
						<li><a href="#this" id="side_program">교육 및 과정</a></li>
					</ul>
				</li>
				<li><a href="#this" id="side_event">이벤트</a></li>
			</ul>
			
			<!-- The Modal -->
			<div id="myLogin" class="modal">
				<!-- Modal content -->
				<div class="modal-content" style="max-width: 350px;">
					<div class="modal-header">
						<span class="close" id="loginClose">&times;</span>
						<h3 style="margin-top: 0.8em;">로그인을 하세요.</h3>
					</div>
					<div class="modal-body">
						<div class="row gtr-uniform">
							<div class="col-12">
								<input type="text" id="USER_NAME" name="USER_NAME" placeholder="이름" maxlength="20" />
							</div>
							<div class="col-12">
								<input type="password" id="USER_PWD" name="USER_PWD" placeholder="비밀번호" maxlength="30" />
							</div>
							<div class="col-12-xsmall">
								<a href="#this" id="btnLogin" class="button primary" style="background-color: #4caf50;">로그인</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
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
			
			if(!gfn_isAdmin(<%= sUserAuth %>)){
				gfn_authAlert();
				return false;
			}
			
			fn_goJoin();
		});
		
		$("#side_userList").on("click", function(e) {
			e.preventDefault();
			
			if(!gfn_isAdmin(<%= sUserAuth %>)){
				gfn_authAlert();
				return false;
			}
			
			fn_goUserList();
		});
		
		$("#side_notice").on("click", function(e) {
			e.preventDefault();
			fn_goNotice();
		});
		
		$("#side_customer").on("click", function(e) {
			e.preventDefault();
			fn_goCustomer();
		});
		
		$("#side_useOfPack").on("click", function(e) {
			e.preventDefault();
			fn_goUseOfPack();
		});
		
		$("#side_shoulderPain").on("click", function(e) {
			e.preventDefault();
			fn_goShoulderPain();
		});
		
		$("#side_backache").on("click", function(e) {
			e.preventDefault();
			fn_goBackache();
		});
		
		$("#side_recruitment").on("click", function(e) {
			e.preventDefault();
			fn_goRecruitment();
		});
		
		$("#side_program").on("click", function(e) {
			e.preventDefault();
			fn_goProgram();
		});
		
		$("#side_event").on("click", function(e) {
			e.preventDefault();
			fn_goEvent();
		});
		
		$("#side_login").on("click", function(e) { // 로그인
			e.preventDefault();
			
			// 초기화
			$("#USER_NAME").val("");
			$("#USER_PWD").val("");
			
			var comModal = new ComModal({modal: "myLogin", close: "loginClose"});
			comModal.block();
		});
		
		$("#side_logout").on("click", function(e) { // 로그아웃
			e.preventDefault();
			fn_goLogout();
		});
		
		$("#btnLogin").on("click", function(e) {
			e.preventDefault();
			
			var id = $("#USER_NAME").val();
			var pwd = $("#USER_PWD").val();
			if(gfn_isNull(id)){
				gfn_alertPopup({message:"아이디를 입력하세요."});
				return false;
			}
			
			if(gfn_isNull(pwd)){
				gfn_alertPopup({message:"비밀번호를 입력하세요."});
				return false;
			}
			
			fn_goLogin({id: id, pwd: pwd});
		});
	});
	
	function fn_goLogin(params){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/login.do' />");
		comAjax.addParam("USER_NAME", params.id);
		comAjax.addParam("USER_PWD", params.pwd);
		comAjax.setCallback("fn_goLoginCallback");
		comAjax.ajax();
	}
	
	function fn_goLoginCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"로그인 되었습니다."
					, fade:250, duration:500});
				
				var myTimer = setTimeout(function() {
					location.reload();
				}, 1000);
			}else{
				gfn_alertPopup({message:"로그인이 올바르지 않습니다."});
				return false;
			}
		}else{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/error.do' />");
			comSubmit.submit();
		}
	}
	
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
		comSubmit.addParam("COMMAND", "notice");
		comSubmit.submit();
	}
	
	function fn_goCustomer() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board.do' />");
		comSubmit.addParam("COMMAND", "customer");
		comSubmit.submit();
	}
	
	function fn_goUseOfPack() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/useOfPack.do' />");
		comSubmit.submit();
	}
	
	function fn_goShoulderPain() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shoulderPain.do' />");
		comSubmit.submit();
	}
	
	function fn_goBackache() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/backache.do' />");
		comSubmit.submit();
	}
	
	function fn_goRecruitment() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/recruitment.do' />");
		comSubmit.submit();
	}
	
	function fn_goProgram() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/program.do' />");
		comSubmit.submit();
	}
	
	function fn_goEvent() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/event.do' />");
		comSubmit.submit();
	}
	
	function fn_goLogout() {
		gfn_alertPopup({message:"로그아웃을 시도합니다."
			, fade:250, duration:500});
		
		var myTimer = setTimeout(function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/logout.do' />");
			comSubmit.submit();
		}, 1000);
	}
	</script>
</body>
</html>