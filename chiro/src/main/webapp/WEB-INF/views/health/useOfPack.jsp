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
						<h1>냉온찜질의 올바른 사용법</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/health_pic02.jpg" alt="" />
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
						<img class="my_img" src="/images/health_pic03.jpg" alt="" />
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
	var sCommand = '${COMMAND}';
	var img = document.createElement('img');
	$(document).ready(function() {
		$("#health").addClass('active');
		$("#side_useOfPack").css({'font-weight':'bold', 'font-size':'1.2em'});
		
		switch (sCommand) {
		case "notice": // 공지사항
			$("#board_h1").append("공지사항");
			$("#board_h2").append("카이로76의 소식을 들려드립니다.");
			img.src = '/images/board_pic01.png';
			break;
			
		case "customer": // 고객 게시판
			$("#board_h1").append("고객 게시판");
			$("#board_h2").append("문의사항을 자유롭게 남겨주세요.");
			img.src = '/images/board_pic02.png';
			break;

		default:
			break;
		}
		
		$("#btnWrite").on("click", function(e) {
			e.preventDefault();
			fn_goWritePage(sCommand);
		});
		
		$("#BOARD_LIKE").keypress(function(e) { 
		    if(e.keyCode == 13){
		    	fn_goBoardLike($("#BOARD_LIKE").val());
		    }
		});
		
		// 시작
		fn_goBoardListPage(1);
	});
	
	function fn_goBoardListPage(pageNo, sBoardLike) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/boardListPage.do' />");
		comAjax.setCallback("fn_goBoardListPageCallback"); 
		comAjax.addParam("BOARD_DVSN", sCommand);
		comAjax.addParam("PAGE_INDEX", (!gfn_isNull(pageNo) ? pageNo : 1));
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.addParam("BOARD_LIKE", sBoardLike);
		comAjax.ajax();
	}
	
	function fn_goBoardListPageCallback(data) {
		var total = data.TOTAL;
		var rnum = data.RNUM;
		var sBoardLike = data.BOARD_LIKE;
		
		// 조회건수
		$("#PAGE_CNT").empty();
		$("#PAGE_CNT").append("<p><b style='color: #2196f3;'>조회 : "+rnum+"건 / 전체 : "+total+"건</b></p>");
		
		var body = $("table>tbody");
		body.empty();
		
		if(total == 0){
			var str =
			"<tr>" + 
			"<td colspan='9'>조회된 결과가 없습니다.</td>" + 
			"</tr>";
			
			body.append(str);
		}else{
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_goBoardListPage",
				searchLike : sBoardLike
			};
			
			gfn_renderPaging(params);
			
			var str = "";
			$.each(data.list, function(key, value){
				
				if(value.DEL_YN == "N"){
					if(value.LEV == "1"){
						str +=
						"<tr class='notice'>" + 
						"<td><img src='/images/christmas-star.png' /></td>" +
						"<td class='title'>" + 
						"<a href='#this' name='title'>" + value.TITLE + "</a>" + 
						"<input type='hidden' id='BOARD_KEY' name='BOARD_KEY' value=" + value.BOARD_KEY + ">" +
						"<input type='hidden' id='DEL_YN' name='DEL_YN' value=" + value.DEL_YN + ">" +
						"</td>" +
						"<td>" + value.NAME + "</td>" + 
						"<td>" + value.PC_DT + "</td>" + 
						"<td>" + value.HIT_CNT + "</td>" + 
						"</tr>";
					}else{
						str +=
						"<tr>" +
						"<td>" + value.BOARD_IDX + "</td>" + 
						"<td class='title'>" + 
						"<a href='#this' name='title'>" + value.TITLE + "</a>" + 
						"<input type='hidden' id='BOARD_KEY' name='BOARD_KEY' value=" + value.BOARD_KEY + ">" +
						"<input type='hidden' id='DEL_YN' name='DEL_YN' value=" + value.DEL_YN + ">" +
						"</td>" +
						"<td>" + value.NAME + "</td>" + 
						"<td>" + value.PC_DT + "</td>" + 
						"<td>" + value.HIT_CNT + "</td>" + 
						"</tr>";
					}
				}else{
					str +=
					"<tr style='text-decoration: line-through;'>" + 
					"<td>" + value.BOARD_IDX + "</td>" + 
					"<td class='title'>" + value.TITLE + "</td>" + 
					"<td>" + value.NAME + "</td>" + 
					"<td>" + value.PC_DT + "</td>" + 
					"<td>" + value.HIT_CNT + "</td>" + 
					"</tr>";
				}
			});
			
			// CSS를 활용한 fadeIn 효과
			body.stop(true).css({'opacity':0}).animate({'opacity':1}, 500);
			body.append(str);
			
			// 하이라이트
			if(!gfn_isNull(sBoardLike)){
				$('.table-wrapper').removeHighlight().highlight(sBoardLike);
			}else{
				$('.table-wrapper').removeHighlight();
			}
			
			// 페이징처리 후 동적으로 이벤트를 생성한다.
			$("a[name='title']").on("click", function(e) {
				e.preventDefault();
				var sBoardKey = $(this).parent().find("#BOARD_KEY").val();
				var sDelYn = $(this).parent().find("#DEL_YN").val();
				if(sDelYn == "Y"){
					gfn_alertPopup({message:"이미 삭제된 글입니다."});
					return false;
				}
				
				fn_goBoardDetail(sCommand, sBoardKey);
			});
		}
	}
	
	function fn_goBoardDetail(sCommand, sBoardKey){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='post.do' />");
		comSubmit.addParam("COMMAND", sCommand);
		comSubmit.addParam("BOARD_KEY", sBoardKey);
		comSubmit.submit();
	}
	
	function fn_goWritePage(sCommand) {
		// TODO 관리자 로그인 체크
		var comSubmit = new ComSubmit();
		comSubmit.addParam("COMMAND", sCommand);
		comSubmit.setUrl("<c:url value='/write.do' />");
		comSubmit.submit();
	}
	
	function fn_goBoardLike(sBoardLike) {
		if(!gfn_isNull(sBoardLike)){
			if(sBoardLike.length < 2){
				gfn_alertPopup({message:"두 단어 이상 입력하세요."});
				return false;
			}
		}
		
		fn_goBoardListPage(1, sBoardLike);
	}
	</script>
	
</body>
</html>