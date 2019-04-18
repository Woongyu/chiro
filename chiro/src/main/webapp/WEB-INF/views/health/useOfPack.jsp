<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>냉온찜질의 올바른 사용법</title>
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
							냉온찜질의 올바른 사용법
							<img src='/images/icons8-ice-king-48.png' />
						</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/health_use-of-pack02.jpg" alt="" />
					</span>
					
					<h2>온찜질의 올바른 이해</h2>
					<div class="box">
						<p>온찜질(Hot pack)은 혈관을 확장시고 혈류량를 증가시켜
						손상된 조직을 빠르게 재생시키고 대사작용을 활성화하기 때문에,
						주로 근육이완이나 환부에 효과적이며 만성적인 질환에 사용됩니다.</p>
					</div>
					
					<h2>냉찜질의 정확한 사용법</h2>
					<div class="box">
						<p>냉찜질은 발목을 접질리거나 허리통증 등 관절의 급성질환에 주로 사용됩니다. 
						뼈를 둘러싼 인대와 근육을 빠르게 수축시켜(늘어난 인대를 복구시키므로!)
						염증으로 생기는 2차감염을 막아주고, 제열효과와 붓기를 빼주어 통증을 완화시켜줍니다.
						그뿐 아니라 목, 허리, 무릎, 발목에 자칫 가해질 수 있는 신경압박으로 부터도
						보호할수 있게 됩니다. 단, 늘어난 인대는 48시간 안에 응급처리 되어야만
						복구되므로 신속한 대처가 필요합니다.</p>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/health_use-of-pack03.jpg" alt="" />
					</span>
					
					<h2>냉찜질의 장점 요약</h2>
					<div class="box">
						<p>1. 붓기를 가라 앉히고<br />
						2. 늘어난 인대를 복구 시키며<br />
						3. 혈류저하로 염증을 막아주고(소염효과)<br />
						4. 열을 낮춰주며(제열효과)<br />
						5. 통증을 완화시켜줍니다.(진통효과)</p>
					</div>
					
					<h2>이것만은 꼭 기억하세요!</h2>
					<div class="box">
						<p>※ 통증발생 후 48시간 안에 얼음팩(아이싱)을 해주어야 합니다.<br />
						※ 환부에 직접 대지마시고 얼음팩을 얇은 수건으로 감싸야 합니다.(피부괴사방지)<br />
						※ 10~20분을 넘지 않도록 하며(동상방지), 통증이 사라질때까지 꾸준히 대주세요.</p>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/health_use-of-pack01.jpeg" alt="" />
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
		$("#side_useOfPack").css({'font-weight':'bold', 'font-size':'1.2em'});
	});
	</script>
	
</body>
</html>