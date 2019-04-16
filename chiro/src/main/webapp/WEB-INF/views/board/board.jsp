<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>게시판</title>
<style type="text/css">
.image.main img {
    box-shadow: 10px 10px 20px -5px rgba(0, 0, 0, 0.8);
}
.notice {
	background: #f7e0a3;
	background: -webkit-linear-gradient(to right, #fff, #f7e0a3);
	background: linear-gradient(to right, #fff, #f7e0a3);
	font-weight: bold;
}
.title {
	text-align: left;
    padding-left: 1.0em;
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
						<h1 id="board_h1"></h1>
					</header>
					
					<span class="image main" id="image main"></span>
					
					<div id="PAGE_CNT" style="float: right;"></div>
					
					<div class="my_info">
						<h2 id="board_h2"></h2>
					</div>
					
					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt" style="text-align: center; white-space: nowrap;">
							<thead>
								<tr>
									<th scope="col" width="10%">글번호</th>
									<th scope="col" width="*">제목</th>
									<th scope="col" width="10%">글쓴이</th>
									<th scope="col" width="15%">등록일</th>
									<th scope="col" width="10%">조회</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						
						<div id="PAGE_NAVI"></div>
						<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
						
						<div class="col-12">
							<ul class="actions" style="float: right;">
								<li><a href="#this" class="button big" id="btnWrite">글쓰기</a></li>
							</ul>
						</div>
						
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
		
		document.getElementById('image main').appendChild(img);
		
		$("#btnWrite").on("click", function(e) {
			e.preventDefault();
			fn_goWritePage(sCommand);
		});
		
		// 시작
		fn_goBoardListPage(1);
	});
	
	function fn_goBoardListPage(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/boardListPage.do' />");
		comAjax.setCallback("fn_goBoardListPageCallback"); 
		comAjax.addParam("BOARD_DVSN", sCommand);
		comAjax.addParam("PAGE_INDEX", (!gfn_isNull(pageNo) ? pageNo : 1));
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	
	function fn_goBoardListPageCallback(data){
		var total = data.TOTAL;
		var rnum = data.RNUM;
		
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
				eventName : "fn_goBoardListPage"
			};
			
			gfn_renderPaging(params);
			
			var str = "";
			$.each(data.list, function(key, value){
				if(value.DEL_YN == "N"){
					if(value.LEV == "1"){
						str +=
						"<tr class='notice'>" + 
						"<td><img src='https://img.icons8.com/material-two-tone/24/000000/christmas-star.png'></td>" +
						"<td class='title'>" + 
						"<a href='#this' name='title'>" + value.TITLE + "</a>" + 
						"<input type='hidden' id='BOARD_KEY' name='BOARD_KEY' value=" + value.BOARD_KEY + ">" +
						"<input type='hidden' id='DEL_YN' name='DEL_YN' value=" + value.DEL_YN + ">" +
						"</td>" +
						"<td>" + value.NAME + "</td>" + 
						"<td>" + value.PC_DT + "</td>" + 
						"<td>" + value.HIT_CNT + "</td>" + 
						"</tr>";
					}else if(value.LEV == "2"){
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
	</script>
	
</body>
</html>