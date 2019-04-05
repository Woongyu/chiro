<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>회원목록</title>
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
						<h1>회원목록</h1>
					</header>

					<span class="image main">
						<img src="/images/member_list01.png" alt="" style="box-shadow: 10px 10px 20px -5px rgba(0, 0, 0, 0.8);" />
					</span>
					
					<br />
					<h2>카이로76 회원의 상세 리스트를 확인합니다.</h2>
					<br />
					
					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt" style="text-align: center">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">나이</th>
									<th scope="col">생일</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">성별</th>
									<th scope="col">등록일자</th>
									<th scope="col">전체횟수</th>
									<th scope="col">갱신일자</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(list) > 0}">
										<c:forEach items="${list}" var="row">
											<c:if test="${row.DEL_YN eq 'N'}">
												<tr>
													<td>${row.USER_IDX}</td>
													<td class="user_name">
														<a href="#this" name="user_name">
															${row.USER_NAME}
														</a>
														<input type="hidden" id="USER_KEY" name="USER_KEY" value="${row.USER_KEY}">
														<input type="hidden" id="DEL_YN" name="DEL_YN" value="${row.DEL_YN}">
													</td>
													<td>${row.USER_AGE}</td>
													<td>${row.BIRTH}</td>
													<td>${row.E_MAIL}</td>
													<td>${row.PHONE_NUMBER}</td>
													<td>${row.GENDER}</td>
													<td>${row.REGISTRATION_DATE}</td>
													<td>${row.COUNTING}</td>
													<td>${row.PC_TS}</td>
												</tr>
											</c:if>
											<c:if test="${row.DEL_YN ne 'N'}">
												<tr style="text-decoration: line-through;">
													<td>${row.USER_IDX}</td>
													<td>${row.USER_NAME}</td>
													<td>${row.USER_AGE}</td>
													<td>${row.BIRTH}</td>
													<td>${row.E_MAIL}</td>
													<td>${row.PHONE_NUMBER}</td>
													<td>${row.GENDER}</td>
													<td>${row.REGISTRATION_DATE}</td>
													<td>${row.COUNTING}</td>
													<td>${row.PC_TS}</td>
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
	$(document).ready(function() {
		$("a[name='user_name']").on("click", function(e) {
			e.preventDefault();
			var sUserKey = $(this).parent().find("#USER_KEY").val();
			var sDelYn = $(this).parent().find("#DEL_YN").val();
			if(sDelYn == "Y"){
				alert("이미 삭제된 회원입니다.");
				return false;
			}
			
			fn_openMemberDetail(sUserKey);
		});
	});
	
	function fn_openMemberDetail(sUserKey){
		var comSubmit = new ComSubmit();
		comSubmit.addParam("USER_KEY", sUserKey);
		comSubmit.setUrl("<c:url value='detail.do' />");
		comSubmit.setCallback("fn_openMemberDetailCallback");
		comSubmit.openPopup("500", "600");
	}
	
	function fn_openMemberDetailCallback(){
		
		// 팝업 호출 후 제거
		$("#commonForm").empty();
	}
	</script>
	
</body>
</html>