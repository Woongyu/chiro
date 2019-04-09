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
								
							</tbody>
						</table>
						
						<div id="PAGE_NAVI"></div>
						<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
						
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
		
		// 시작
		fn_openListPage(1);
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
	
	function fn_openListPage(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/listPage.do' />");
		comAjax.setCallback("fn_openListPageCallback"); 
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	
	function fn_openListPageCallback(data){
		var total = data.TOTAL;
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
				eventName : "fn_openListPage"
			};
			
			gfn_renderPaging(params);
			
			var str = "";
			$.each(data.list, function(key, value){
				if(value.DEL_YN == "N"){
					str +=
					"<tr>" + 
						"<td>" + value.USER_IDX + "</td>" + 
						"<td class='USER_NAME'>" +
						"<a href='#this' name='USER_NAME'>" + value.USER_NAME + "</a>" +
						"<input type='hidden' id='USER_KEY' name='USER_KEY' value=" + value.USER_KEY + ">" + 
						"<input type='hidden' id='DEL_YN' name='DEL_YN' value=" + value.DEL_YN + ">" + 
						"</td>" +
						"<td>" + value.USER_AGE + "</td>" + 
						"<td>" + value.BIRTH + "</td>" + 
						"<td>" + value.USER_MAIL + "</td>" + 
						"<td>" + value.PHONE_NUMBER + "</td>" + 
						"<td>" + value.GENDER + "</td>" + 
						"<td>" + value.RGS_DT + "</td>" + 
						"<td>" + value.RGS_CNT + "</td>" + 
						"<td>" + value.PC_TS + "</td>" + 
					"</tr>";
				}else{
					str +=
					"<tr style='text-decoration: line-through;'>" + 
						"<td>" + value.USER_IDX + "</td>" + 
						"<td>" + value.USER_NAME + "</td>" + 
						"<input type='hidden' id='USER_KEY' name='USER_KEY' value=" + value.USER_KEY + ">" + 
						"<input type='hidden' id='DEL_YN' name='DEL_YN' value=" + value.DEL_YN + ">" + 
						"<td>" + value.USER_AGE + "</td>" + 
						"<td>" + value.BIRTH + "</td>" + 
						"<td>" + value.USER_MAIL + "</td>" + 
						"<td>" + value.PHONE_NUMBER + "</td>" + 
						"<td>" + value.GENDER + "</td>" + 
						"<td>" + value.RGS_DT + "</td>" + 
						"<td>" + value.RGS_CNT + "</td>" + 
						"<td>" + value.PC_TS + "</td>" + 
					"</tr>";
				}
			});
			
			body.append(str);
			
			// 페이징처리 후 동적으로 이벤트를 생성한다.
			$("a[name='USER_NAME']").on("click", function(e) {
				e.preventDefault();
				var sUserKey = $(this).parent().find("#USER_KEY").val();
				var sDelYn = $(this).parent().find("#DEL_YN").val();
				if(sDelYn == "Y"){
					alert("이미 삭제된 회원입니다.");
					return false;
				}
				
				fn_openMemberDetail(sUserKey);
			});
		}
	}
	</script>
	
</body>
</html>