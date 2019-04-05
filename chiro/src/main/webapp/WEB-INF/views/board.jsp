<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>공지사항</title>
<style type="text/css">
.image.main img {
    box-shadow: 10px 10px 20px -5px rgba(0, 0, 0, 0.8);
}
.notice {
	background: #ee9ca7;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to left, #ffdde1, #ee9ca7);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to left, #ffdde1, #ee9ca7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	font-weight: bold;
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
				<jsp:include page="header.jsp" />
				
				<!-- Content -->
				<section>
					<header class="main">
						<h1 id="board_h1"></h1>
					</header>

					<span class="image main" id="image main"></span>
					
					<br />
					<h2 id="board_h2"></h2>
					<br />
					
					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt" style="text-align: center">
							<thead>
								<tr>
									<th scope="col" width="10%">번호</th>
									<th scope="col" width="*">제목</th>
									<th scope="col" width="10%">글쓴이</th>
									<th scope="col" width="15%">날짜</th>
									<th scope="col" width="10%">조회</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list}" var="row">
											<c:if test="${row.DEL_YN eq 'N'}">
												<c:if test="${row.LEV eq '1'}">
												<tr class="notice">
														<td><img src="https://img.icons8.com/material-two-tone/24/000000/christmas-star.png"></td>
														<td class="title">
															<a href="#this" name="title">
																${row.TITLE}
															</a>
															<input type="hidden" id="IDX" name="IDX" value="${row.IDX}">
															<input type="hidden" id="DEL_YN" name="DEL_YN" value="${row.DEL_YN}">
														</td>
														<td>${row.NAME}</td>
														<td>${row.PC_DT}</td>
														<td>${row.HIT_CNT}</td>
													</tr>
												</c:if>
												<c:if test="${row.LEV eq '2'}">
												<tr>
														<td>${row.IDX}</td>
														<td class="title">
															<a href="#this" name="title">
																${row.TITLE}
															</a>
															<input type="hidden" id="IDX" name="IDX" value="${row.IDX}">
															<input type="hidden" id="DEL_YN" name="DEL_YN" value="${row.DEL_YN}">
														</td>
														<td>${row.NAME}</td>
														<td>${row.PC_DT}</td>
														<td>${row.HIT_CNT}</td>
													</tr>
												</c:if>
											</c:if>
											<c:if test="${row.DEL_YN ne 'N'}">
												<tr style="text-decoration: line-through;">
													<td>${row.IDX}</td>
													<td>${row.TITLE}</td>
													<td>${row.NAME}</td>
													<td>${row.PC_DT}</td>
													<td>${row.HIT_CNT}</td>
												</tr>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
						<div class="col-12">
							<ul class="actions" style="float: right;">
								<li><a href="#this" class="button big" id="write">글쓰기</a></li>
							</ul>
						</div>
						
					</div>
					
					<hr class="major" />
					
				</section>
			</div>
		</div>
		
		<!-- Sidebar -->
		<div id="sidebar">
			<jsp:include page="sideMenu.jsp" />
		</div>
		
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	var sCommand = '${command}';
	var img = document.createElement('img');
	
	$(function() {
		if(sCommand == "notice"){
			$("#board_h1").append("공지사항");
			$("#board_h2").append("카이로76의 소식을 들려드립니다.");
			img.src = '/images/board_notice01.png';
		}else if(sCommand == "board"){
			
		}
		
		document.getElementById('image main').appendChild(img);
		
		$("#write").on("click", function(e) {
			e.preventDefault();
			fn_openWritePage(sCommand);
		});
		
		$("a[name='title']").on("click", function(e) {
			e.preventDefault();
			var sIdx = $(this).parent().find("#IDX").val();
			var sDelYn = $(this).parent().find("#DEL_YN").val();
			if(sDelYn == "Y"){
				alert("이미 삭제된 글입니다.");
				return false;
			}
			
			fn_openBoardDetail(sCommand, sIdx);
		});
	});
	
	function fn_openBoardDetail(sCommand, sIdx){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='post.do' />");
		comSubmit.addParam("command", sCommand);
		comSubmit.addParam("IDX", sIdx);
		comSubmit.setCallback("fn_openBoardDetailCallback");
		comSubmit.submit();
	}
	
	function fn_openBoardDetailCallback(){
		
		// 팝업 호출 후 제거
		$("#commonForm").empty();
	}
	
	function fn_openWritePage(sCommand) {
		// TO-DO 관리자 로그인 체크
		var comSubmit = new ComSubmit();
		comSubmit.addParam("command", sCommand);
		comSubmit.setUrl("<c:url value='/write.do' />");
		comSubmit.submit();
	}
	</script>
	
</body>
</html>