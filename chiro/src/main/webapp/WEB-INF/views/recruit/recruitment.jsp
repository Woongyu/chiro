<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>기초반 연수생 모집안내</title>
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
							<img src='/images/icons8-client-management-48.png' />
							기초반 연수생 모집안내
						</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/recruit_recruitment01.jpeg" alt="" />
					</span>
					
					<h2 style="color: #e91e63;">카이로프랙틱 교육안내</h2>
					<div class="box">
						<blockquote>약물이나 수술 없이 요통, 두통, 목, 어깨의 만성통증을
						근본적으로 치유하는 임상 카이로프랙틱학의 정수로 여러분을 모십니다.<br />
						강의와 임상실습 통해 기초 카이로프랙틱을 누구나 따라할 수 있도록 쉽게 교육하며,
						우리가 알지 못했던 인체의 균형과 치유법을 배우게 됩니다.<br />
						나 자신과 내 가족의 건강을 지켜 줄 수 있을 뿐만 아니라
						향후 무한한 비전이 있는 카이로프랙틱의 세계로 여러분을 초대합니다.</blockquote>
					</div>
					
					<h2 style="color: #009688;">"약물이나 수술 없는 임상 카이로프랙틱학의 정수로 여러분을 모십니다."</h2>
					<div class="box">
						<blockquote>카이로프랙틱협회 강사진의 풍부한 경험에서 나오는 짜임새 있는 강의를 통해
						자녀와 가족들의 건강을 돌아볼 수 있게 되며, 다양한 임상실습으로 보다 전문인으로
						거듭날 수 있도록 체계적인 프로그램이 준비되어 있습니다.<br />
						<br />
						<h3>카이로프랙틱학으로 지금 도전하세요!</h3></blockquote>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/recruit_recruitment02.jpeg" alt="" />
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
		$("#recruit").addClass('active');
		$("#side_recruitment").css({'font-weight':'bold', 'font-size':'1.2em'});
	});
	</script>
	
</body>
</html>