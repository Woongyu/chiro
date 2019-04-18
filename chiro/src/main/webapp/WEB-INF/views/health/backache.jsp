<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>장요근과 허리통증</title>
</head>
<body class="is-preload">
	
	<!-- Wrapper -->
	<div id="wrapper">
		
		<!-- Main -->
		<div id="main">
			<div class="inner">
				
				<!-- Header -->
				<jsp:include page="../frame/header.jsp" />
				
				<!-- Content -->
				<section>
					<header class="main">
						<h1>
							장요근과 허리통증
							<img src='/images/icons8-slouch-filled-48.png' />
						</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/health_backache01.png" alt="" />
					</span>
					
					<h2>허리를 펼 수 없다면?</h2>
					<div class="box">
						<p>만약 앉았다가 일어나면서 허리가 아프다거나 무겁다면 장요근을 의심해봐야 합니다!<br />
						<br />
						장요근은 장골근과 소요근과 대요근의 통칭으로, 오랜시간 앉아있거나 쭈그리고 앉을 경우
						짧아진 근육이 다시 빠르게 복귀(이완)되지 않거나, 짧아진 근육이 요추(허리뼈)를 잡아당김으로
						허리를 무겁게 하거나 밤에 다리를 뻗고 주무실 때 극심한 통증을 주기도 합니다.</p>
					</div>
					
					<h2>명절증후군으로 불리는 통증</h2>
					<div class="box">
						<h3 style="color: #009688;">"카이로76을 찾아주시는 모든 분에게,<br />
						집에서 간단히 하실 수 있는 운동과
						교정법을 친절하고 자세하게 가르쳐 드리고 있습니다."</h3>
						<p>간단한 예로, 명절에 어머님들이 오랜시간 바닥에서 전을 붙이고 일어나면서
						통증을 호소하시게 되어 '명절증후군' 이라고도 불리기도 합니다.
						증상에 비해 치료는 간단할 수 있어 섣불리 약이나 주사치료를 받으시기 보다,
						가까운 교정센터에 내방하시어 점검 받아보시는 것이 좋습니다.<br/>
						<br />
						오랜시간 의자에 앉아서 일하는 직업이나 근육이 수축될 수 있는 상황에
						오래 노출되어 있던 분들은, 오래두면 디스크의 원인이 될 수도 있는 만큼
						의심을 해보시고 점검 해보시길 바랍니다.</p>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/health_backache02.jpeg" alt="" />
					</span>
					
					<hr class="major" />
					
				</section>
			</div>
		</div>
		
		<!-- Sidebar -->
		<div id="sidebar">
			<jsp:include page="../frame/sideMenu.jsp" />
		</div>
		
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#health").addClass('active');
		$("#side_backache").css({'font-weight':'bold', 'font-size':'1.2em'});
	});
	</script>
	
</body>
</html>