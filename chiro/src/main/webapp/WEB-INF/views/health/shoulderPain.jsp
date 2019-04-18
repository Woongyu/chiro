<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>어깨통증과 바른자세</title>
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
							<img src='/images/icons8-attitude-48.png' />
							어깨통증과 바른자세
						</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/health_shoulder-pain01.jpeg" alt="" />
					</span>
					
					<h2>어깨통증의 원인</h2>
					<div class="box">
						<p>머리의 무게는 성인의 경우 대략 4.5kg ~ 5kg 정도 됩니다.
						그리고 이 무게는 아래의 경추가 떠받치고 있습니다.
						머리의 무게중심이 앞으로 쏠리게되면 체감되는 하중은 배가 되므로,
						목과 어깨근육에 부담을 끼치게 됩니다.</p>
					</div>
					
					<h2>거북목이 끼치는 영향과 연쇄적 반응</h2>
					<div class="box">
						<p>1. 앞으로 쏠리는 머리의 무게중심을 붙잡기 위해 어깨 뒤 승모근이 끌려 올라오게 되고, 이 과정에서 목이 굳고 어깨가 뭉치고 담이 오게 됩니다.<br />
						2. 머리 뒤 후두골이 1번 경추에 눌리게 됨에 따라 뒷골이 자주붓고 편두통을 초래하며, 머리가 무겁고 눈이 침침함을 느끼게 됩니다.<br />
						3. 경추와 상부흉추의 돌기가 유난히 뒤로 튀어나오며 살두덩이 같이 부종이 생기고 척추변위로 손 끝이 저려오는 증상을 초래합니다.<br />
						4. 점점 흉추가 뒤로 밀림에 따라 등이 굽어가고, 소화계 호흡계통의 문제를 초래할뿐 아니라 순환계통 전반에도 문제가 생깁니다.<br />
						5. 또한 허리도 뒤로 밀리게 되고 그에 따라 요통이 올 수도 있습니다.</p>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/health_shoulder-pain02.jpeg" alt="" />
					</span>
					
					<h2>어깨를 펴고 자세를 바르게 해야하는 이유!</h2>
					<div class="box">
						<h3 style="color: #009688;">"어깨가 말려있는 자세가 어깨통증의 근본적인 원인이다."</h3>
						<p>다시 정리하자면, 머리가 앞으로 쏠리는 자세가 오래되면
						어깨가 좁아지고 굽으면서, 아울러 등도 허리도 후방되고 통증을 유발하게 됩니다.
						또한 골반도 주저앉게 되고 다리가 벌어지는 연쇄적인 반응이 진행됩니다.<br />
						<br />
						위의 그림처럼 같이 목과 어깨, 등, 허리, 골반은 서로 상관관계를 가지고 있습니다.
						그러므로 어깨를 펴고 턱을 잡아당겨 앉는 바른자세와 습관이,
						어깨통증은 물론 등과 허리, 골반에 까지 연쇄적인 영향을 끼치게 되는 것 입니다.<br />
						<br />
						바른자세로 앉는다 하여 과도하게 허리를 밀고 앉으면 전방전위증과 같이 위험한 상황이 발생할 수 있으므로,
						허리만 펴고 앉는 습관보단 양 어깨를 펴고 바르게 앉는 것을 적극 추천드립니다.</p>
					</div>
					
					<span class="image main">
						<img class="my_img" src="/images/health_shoulder-pain03.jpeg" alt="" />
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
		$("#side_shoulderPain").css({'font-weight':'bold', 'font-size':'1.2em'});
	});
	</script>
	
</body>
</html>