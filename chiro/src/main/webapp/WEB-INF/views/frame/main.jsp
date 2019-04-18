<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 슬라이드 이미지
	ArrayList<String> arrPicList = new ArrayList<String>();
	arrPicList.add("modoo_pic01.jpeg");
	arrPicList.add("modoo_pic02.jpeg");
	arrPicList.add("modoo_pic03.jpeg");
	arrPicList.add("modoo_pic04.jpeg");
	arrPicList.add("modoo_pic05.jpeg");
	arrPicList.add("modoo_pic06.jpeg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="<c:url value='http://code.jquery.com/jquery-latest.min.js'/>" charset="utf-8"></script>
<script src="<c:url value='/js/carousel.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/carousel.css'/>"/>
<script src="<c:url value='http://maps.googleapis.com/maps/api/js?sensor=false'/>" charset="utf-8"></script>
<script type="text/javascript">
// GoogoleMap Asynchronously Loading the API
function initialize() {
	var lo = "37.541448";
	var ro = "126.953565";
	var mapLocation = new google.maps.LatLng(lo, ro); // 지도에서 가운데로 위치할 위도와 경도
	var markLocation = new google.maps.LatLng(lo, ro); // 마커가 위치할 위도와 경도
	var mapOptions = {
 		center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
		zoom: 18, // 지도 zoom단계
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
    
	// id: map-canvas, body에 있는 div태그의 id와 같아야 함
	var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	var size_x = 60; // 마커로 사용할 이미지의 가로 크기
	var size_y = 60; // 마커로 사용할 이미지의 세로 크기
	
	// 마커로 사용할 이미지 주소
	var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
		new google.maps.Size(size_x, size_y),
		'',
		'',
		new google.maps.Size(size_x, size_y));
	
	var marker;
	var content = "카이로76 [국제카이로치유연구소]"; // 말풍선 안에 들어갈 내용
	marker = new google.maps.Marker({
		position: markLocation, // 마커가 위치할 위도와 경도(변수)
		map: map,
		icon: image, // 마커로 사용할 이미지(변수)
		// info: '말풍선 안에 들어갈 내용',
		title: content // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
	});
	
	// 마커를 클릭했을 때의 이벤트(말풍선).
	var infowindow = new google.maps.InfoWindow({ content: content});
	google.maps.event.addListener(marker, "click", function() {
		infowindow.open(map,marker);
	});
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
<title>메인</title>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<jsp:include page="header.jsp" />
				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								Hi, Welcome to<br /> Chiropractic.
							</h1>
							<h2>"카이로76은 카이로프랙틱을 통해 근본적인 방법으로 통증에서 벗어나실 수 있도록 도움을 드립니다."</h2>
						</header>
						<p>카이로프랙틱은 미국에서 약 100년 전에 체계화된 기초 치유요법으로, 미국 외 많은 나라에서 제3 의학으로
							각광받는 진료 학문입니다. 미국에서는 이미 오래 전부터 1차 진료기관으로 상용화된 의술입니다. 현대인의 70% 이상이
							컴퓨터와 휴대폰 디바이스로 인해 척추에 심각한 문제를 가지고 있으며 대부분의 성장기 아이들 또한 측만증으로 인한
							피로함, 만성 소화불량, 두통 등 성장에 문제를 안고 있습니다. 하지만 점점 심각해지는 이러한 문제에 대한 근본적인
							치료를 접근 조차 못하고 있으므로 가장 안전하고 효과적으로 통증을 완화시키고 스스로 몸에 균형을 바로잡을 수 있는
							카이로프랙틱을 적극적으로 권하는 추세입니다. 카이로76은 카이로프랙틱을 통해 친절하고 시원하게, 그리고 보다 근본적인
							방법으로 통증에서 벗어나실 수 있도록 도움을 드립니다.</p>
						<ul class="actions">
							<li><a href="#this" class="button big" id="btnJoin">회원등록</a></li>
						</ul>
					</div>
					<span class="image object">
						<img src="/images/main_chiro01.jpg" alt="" />
					</span>
				</section>
				
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								기초반 연수생<br />
								모집안내
								<img src='/images/icons8-training-48.png' />
							</h1>
							<h2>"약물이나 수술 없는 임상 카이로프랙틱학의 정수로 여러분을 모십니다."</h2>
						</header>
						<p>약물이나 수술 없이 요통, 두통, 목, 어깨의 만성통증을 근본적으로 치유하는 임상 카이로프랙틱학의 정수로 여러분을 모십니다. 
						강의와 임상실습 통해 기초 카이로프랙틱을 누구나 따라할 수 있도록 쉽게 교육하며 우리가 알지 못했던 인체의 균형과 치유법을 배우게 됩니다. 
						나 자신과 내 가족의 건강을 지켜 줄 수 있을 뿐만 아니라 향후 무한한 비전이 있는 카이로프랙틱의 세계로 여러분을 초대합니다.</p>
						<ul class="actions">
							<li><a href="#this" class="button big" id="btnRecruit">둘러보기</a></li>
						</ul>
					</div>
					<span class="image object">
						<img src="/images/main_chiro02.jpg" alt="" />
					</span>
				</section>
				
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								<img src='/images/icons8-room-48.png' />
								카이로76 공덕센터 내부전경
							</h1>
						</header>
						<div id="carousel_section">
							<ul id="picList">
								<c:set var="arrPicList" value="<%= arrPicList %>" />
								<c:forEach items="${arrPicList}" var="pic">
									<li> <img src="/images/${pic}"> </li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</section>
				
				<section id="banner">
					<div class="content">
						<header>
							<h1>
								<img src='/images/icons8-place-marker-48.png' />
								카이로76 위치(공덕역 10번 출구)
							</h1>
						</header>
						<div id="map-canvas" style="width: 100%; height: 400px"></div>
					</div>
				</section>
				
				<div class="content">
					<blockquote style="background-color: black; color: white;">
					국제카이로치유연구소<br />
					서울시 마포구 도화동 4-48 2층 / 사업자등록번호 : 184-67-00219 / 전화번호 : 0507-1454-4391 / 기타 : 예약필수<br />
					예금주 : 류제형 / 입금은행 : 카카오뱅크 / 계좌번호 : 3333-07-1118500
					</blockquote>
				</div>
				
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<jsp:include page="sideMenu.jsp" />
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btnJoin").on("click", function(e) {
			e.preventDefault();
			fn_goJoin();
		});
		
		$("#btnRecruit").on("click", function(e) {
			e.preventDefault();
			fn_goRecruitment();
		});
	});
	
	function fn_goJoin() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/join.do' />");
		comSubmit.submit();
	}
	</script>
	
</body>
</html>