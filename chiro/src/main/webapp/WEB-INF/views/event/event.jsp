<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>이벤트</title>
<style type="text/css">
.box h2 {
	color: #E91E63;
	text-align: center;
}
.my_comment {
	opacity: 0.75;
	border-radius: 0.5em;
	background: #C6FFDD;
	background: -webkit-linear-gradient(to right, #f7797d, #FBD786, #C6FFDD);
	background: linear-gradient(to right, #f7797d, #FBD786, #C6FFDD);
}
</style>
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
							<img src='/images/icons8-loyalty-card-48.png' />
							쿠폰 & 이벤트
						</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/event_event01.png" alt="" />
					</span>
					
					<div class="col-12">
						<h5 class="my_comment">&nbsp;</h5>
					</div>
					
					<div class="posts">
						<article>
							<div class="box">
								<a href="#" class="image"><img src="/images/event_event02.jpeg" alt="" /></a>
								<h2>20% Off<br />
								10 Session Membership</h2>
								<blockquote>쿠폰은 모바일에서 사용할 수 있습니다.<br />
								보호자 동반시 무료상담 및 상태 점검을 해드립니다.<br />
								다른 이벤트와 중복으로 할인되지 않습니다.</blockquote>
							</div>
						</article>
						<article>
							<div class="box">
								<a href="#" class="image"><img src="/images/event_event03.png" alt="" /></a>
								<h2>30% Off<br />
								카이로76 페이지에 친구추가 및<br />
								댓글을 올려주시면 1회 할인!</h2>
								<blockquote>쿠폰은 모바일에서 사용할 수 있습니다.<br />
								카이로76에서 교정 경험을 받아보신분들 중에서,<br />
								페이지에 친구추가를 하시고 후기를 적어주신 분에 1회 적용됩니다.</blockquote>
							</div>
						</article>
					</div>
					
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
	});
	</script>
	
</body>
</html>