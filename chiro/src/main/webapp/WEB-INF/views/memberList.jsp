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
									<th scope="col">순번</th>
									<th scope="col">이름</th>
									<th scope="col">나이</th>
									<th scope="col">생년월일</th>
									<th scope="col">E-MAIL</th>
									<th scope="col">휴대전화</th>
									<th scope="col">성별</th>
									<th scope="col">등록일자</th>
									<th scope="col">전체횟수</th>
									<th scope="col">최근수정일자</th>
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
														<input type="hidden" id="USER_ID" name="USER_ID" value="${row.USER_ID}">
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
			
			var user_id = $(this).parent().find("#USER_ID").val();
			var w = 500
				, h = 600
				, l = (screen.availWidth - w) / 2
				, t = (screen.availHeight - h) / 2;
			
			e.preventDefault();
			window.open("/detail2.do?user_id="+user_id
					,"_blank","width= "+ w + ",height=" + h + ",left=" + l + ",top=" + t
					+ ", scrollbars = no, location = no, toolbar = no, menubar = no, status = no");
			 return false;
		});
	});
	</script>
	
</body>
</html>