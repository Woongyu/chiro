<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>교육 및 과정</title>
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
							<img src='/images/icons8-mortarboard-48.png' />
							카이로 교육 및 과정
						</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/recruit_program01.png" alt="" />
					</span>
					
					<h2 style="color: #e91e63;">연수생 교육 프로그램</h2>
					<div class="box">
						<blockquote>국민건강증진을 위한 카이로프랙틱의 저변확대를 위하여
						기초적인 전문지식 없이도 누구나 배울 수 있는 교육 프로그램을 운영하고 있습니다.<br />
						이론과 실습을 병행하여 쉽고 빠르게 배울 수 있도록 진행되며,
						추후 전문적인 진로나 학위로도 고려하실 수 있도록 도와드립니다.</blockquote>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/recruit_program02.png" alt="" />
					</span>
					
					<h2>교육과정</h2>
					<div class="box">
						<blockquote>기초반 초급 연수자 과정<br />
						중급반 고위 연수자 과정<br />
						고급반 최고위 지도자 연수 과정</blockquote>
					</div>
					
					<h2>교육기간</h2>
					<div class="box">
						<blockquote>부위별 이해와 수기교정 12주<br />
						Technique별 과정 12주<br />
						최고위 과정 4주</blockquote>
					</div>
					
					<h2>교육내용</h2>
					<div class="box">
						<blockquote>척추 근골격계 통증과 교정법<br />
						척추 디스크질환에 대한 정확한 지식과 교정방법<br />
						척추 측만증에 대한 이해와 교정방법<br />
						골반변형에 의한 통증, 증상이해와 교정방법<br />
						오십견등 각종 근골격계 통증질환의 이해<br />
						그 외 척추전반에 관련된 통증에 이해와 교정방법</blockquote>
					</div>
					
					<h2>교육과목</h2>
					<div class="box">
						<blockquote>Diversified Technique<br />
						Gonstead Technique<br />
						Thompson Technique<br />
						Sacral Occipital Technique<br />
						Cox Flexion & Distraction Technique<br />
						Activator Methods-Chiropractic Technique<br />
						Cranio Sacral Technique(Therapy)</blockquote>
					</div>
					
					<h2>교육대상</h2>
					<div class="box">
						<blockquote>현재 물리치료사나 지망생(도수치료사로 취업 가능) 체육지도자<br />
						응급 구조사, 학부모(만성적인 질병을 가진 학생의 부모)<br />
						병환에 있는 가족을 모시고 계신 분<br />
						대체의학 종사자<br />
						대체의학에 관심 있는 일반인 대상<br />
						<strong>(단, 치료에 대한 책임감과 사명감으로 임하실 분만 모십니다.)</strong></blockquote>
					</div>
					
					<h2>교육특전</h2>
					<div class="box">
						<blockquote>전 과정 수료시 각 소속된 협회 자격(인정)증 및 수료증 수여<br />
						현재 미국, 호주, 일본의 자연치유 대학과 학점 교류 협정<br />
						전문자격 취득, 학사, 석사, 박사 학위 취득가능</blockquote>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/recruit_program03.jpg" alt="" />
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
		$("#side_program").css({'font-weight':'bold', 'font-size':'1.2em'});
	});
	</script>
	
</body>
</html>