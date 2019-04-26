<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script type="text/javascript">
$(document).ready(function() {
	if(!gfn_isAdmin(<%= sUserAuth %>)){
		gfn_authError();
	}
});
</script>
<title>회원목록</title>
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
						<h1>회원목록</h1>
					</header>

					<span class="image main">
						<img class="my_img" src="/images/user_list01.png" alt="" />
					</span>
					
					<div id="PAGE_CNT" style="float: right;"></div>
					
					<div class="my_info">
						<h2>카이로76 회원의 리스트를 확인합니다.</h2>
					</div>
					
					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt" style="text-align: center; white-space: nowrap;">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">나이</th>
									<th scope="col">생년월일</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">성별</th>
									<th scope="col">등록일자</th>
									<th scope="col">등록횟수</th>
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
					
					<!-- The Modal -->
					<div id="myModal" class="modal">
						<!-- Modal content -->
						<div class="modal-content">
							<div class="modal-header">
								<span class="close">&times;</span>
								<h3 style="margin-top: 0.8em;">회원상세정보</h3>
							</div>
							<div class="modal-body">
							
							<form method="post" id="frm" name="frm" autocomplete="off">
								<div class="row gtr-uniform">
									
								</div>
							</form>
							
							</div>
						</div>
					</div>
					
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
		$("#member").addClass('active');
		$("#side_userList").css({'font-weight':'bold', 'font-size':'1.2em'});
		
		// 시작
		fn_goUserListPage(1);
	});
	
	function fn_goUserListPage(pageNo) {
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/userListPage.do' />");
		comAjax.setCallback("fn_goUserListPageCallback"); 
		comAjax.addParam("PAGE_INDEX", (!gfn_isNull(pageNo) ? pageNo : 1));
		comAjax.addParam("PAGE_ROW", 15);
		comAjax.ajax();
	}
	
	function fn_goUserListPageCallback(data){
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
				eventName : "fn_goUserListPage"
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
			
			// CSS를 활용한 fadeIn 효과
			body.stop(true).css({'opacity':0}).animate({'opacity':1}, 500);
			body.append(str);
			
			// 페이징처리 후 동적으로 이벤트를 생성한다.
			$("a[name='USER_NAME']").on("click", function(e) {
				e.preventDefault();
				
				var sUserKey = $(this).parent().find("#USER_KEY").val();
				var sDelYn = $(this).parent().find("#DEL_YN").val();
				if(sDelYn == "Y"){
					gfn_alertPopup({message:"이미 삭제된 회원입니다."});
					return false;
				}
				
				fn_showUserDetail(sUserKey);
			});
		}
	}
	
	function fn_showUserDetail(sUserKey){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/userDetail.do' />");
		comAjax.setCallback("fn_showUserDetailCallback"); 
		comAjax.addParam("USER_KEY", sUserKey);
		comAjax.ajax();
	}
	
	function fn_showUserDetailCallback(data){
		var body = $("#frm>div");
		body.empty();
		
		var preDiv = "<div class='col-6 col-12-xsmall'>";
		var postDiv = "</div>";
		var str = "";
		var sGender = "";
		
		$.each(data.list, function(key, value){
			str+=
			preDiv + 
			"<input type='text' name='USER_NAME' id='USER_NAME' value="+value.USER_NAME+" placeholder='이름' maxlength='20' />" + 
			"<input type='hidden' id='USER_KEY' name='USER_KEY' value="+value.USER_KEY+">" +
			postDiv +
			preDiv + 
			"<input type='text' numberOnly name='USER_AGE' id='USER_AGE' value="+(!gfn_isNull(value.USER_AGE)?value.USER_AGE:"''")+" class='int' placeholder='나이' maxlength='3' />" + 
			postDiv +
			preDiv + 
			"<input type='text' name='BIRTH' id='BIRTH' value="+value.BIRTH+" class='int' placeholder='생년월일(예 : 1970-01-01)' />" + 
			postDiv +
			preDiv + 
			"<input type='email' name='USER_MAIL' id='USER_MAIL' value="+(!gfn_isNull(value.USER_MAIL)?value.USER_MAIL:"''")+" placeholder='이메일' />" + 
			postDiv +
			preDiv + 
			"<input type='text' numberOnly name='PHONE_NUMBER' id='PHONE_NUMBER' value="+(!gfn_isNull(value.PHONE_NUMBER)?value.PHONE_NUMBER:"''")+" class='int' placeholder='휴대전화' pattern='[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}' maxlength='11' />" + 
			postDiv +
			preDiv + 
			"<select name='GENDER' id='GENDER' value='M'>" +
			"<option value=''>- 성별 -</option>" +
			"<option value='M'>남성</option>" +
			"<option value='W'>여성</option>" +
			"</select>" +
			postDiv +
			preDiv + 
			"<input type='text' name='RGS_DT' id='RGS_DT' value="+value.RGS_DT+" class='int' placeholder='등록일자(예 : 1970-01-01)' />" + 
			postDiv +
			preDiv + 
			"<input type='text' numberOnly name='RGS_CNT' id='RGS_CNT' value="+value.RGS_CNT+" class='int' placeholder='등록횟수' maxlength='3' />" + 
			postDiv +
			"<div class='col-6 col-12-small'>" + 
			"<input type='checkbox' id='CHK01' name='CHK01' value="+value.CHK01+">" +
			"<label for='CHK01'>디스크 수술이나 그 외에 다른 진단을 받으신적 있습니까?</label>" + 
			postDiv +
			"<div class='col-6 col-12-small'>" + 
			"<input type='checkbox' id='CHK02' name='CHK02' value="+value.CHK02+">" +
			"<label for='CHK02'>도수(카이로프래틱) 치료를 받아보신적 있으십니까?</label>" + 
			postDiv +
			"<div class='col-6 col-12-small'>" + 
			"<input type='checkbox' id='CHK03' name='CHK03' value="+value.CHK03+">" +
			"<label for='CHK03'>신체중에 근위축이나 마비가 오는 부위가 있습니까?</label>" + 
			postDiv +
			"<div class='col-6 col-12-small'>" + 
			"<input type='checkbox' id='CHK04' name='CHK04' value="+value.CHK04+">" +
			"<label for='CHK04'>병력, 수술(성형포함), 복용제가 있으십니까?</label>" + 
			postDiv +
			"<div class='col-12'>" + 
			"<textarea name='OUTL_CTT' id='OUTL_CTT' placeholder='비고' rows='6' >"+(!gfn_isNull(value.OUTL_CTT)?value.OUTL_CTT:'')+"</textarea>" + 
			postDiv +
			"<div class='col-12'>" + 
			"<ul class='actions'>" +
			"<li><input type='submit' id='btnModify' value='수정하기' class='button primary' /></li>" +
			"<li><input type='submit' id='btnDelete' value='삭제하기' class='button' /></li>" +
			"</ul>" +
			postDiv;
			
			sGender = (!gfn_isNull(value.GENDER) ? value.GENDER : "");
		});
		
		body.append(str);
		var comModal = new ComModal();
		comModal.block();
		
		// 달력 생성
	    $("input[name='BIRTH']").calendar();
	    $("input[name='RGS_DT']").calendar();
	    
		// 성별
		$("select[name='GENDER']").val(sGender).prop("selected", true);
		
		// 체크박스 로직
		$("input:checkbox").each(function() {
			if(this.value == "1"){
				this.checked = true;
			}
		});
		
		$("input:text[numberOnly]").on("focus", function() {
		    var x = $(this).val();
		    x = gfn_removeCommas(x);
		    $(this).val(x);
		}).on("focusout", function() {
		    var x = $(this).val();
		    if(x && x.length > 0) {
		        if(!$.isNumeric(x)) {
		            x = x.replace(/[^0-9]/g,"");
		        }
		        
		        switch ($(this).attr('name')) {
				case "USER_AGE":
				case "RGS_CNT":
					x = gfn_addCommas(x);
					break;
				case "PHONE_NUMBER":
					x = gfn_addMinus(x);
					break;
				default:
					break;
				}
		        
		        $(this).val(x);
		    }
		}).on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$("#btnModify").on("click", function(e) {
			e.preventDefault();
			
			var sName = $("input[name='USER_NAME']").val();
			if(gfn_isNull(sName)){
				gfn_alertPopup({message:"이름은 필수입력 사항입니다."});
				return false;
			}else{
				var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
				if(sName.match(regExp) == null) {
					gfn_alertPopup({message:"올바르지 않은 이름입니다."});
					return false;
				}
			}
			
			var sDate = $("input[name='BIRTH']").val();
			if(!gfn_isNull(sDate)){
				if(sDate.length != 10){
					gfn_alertPopup({message:"올바르지 않은 생년월일입니다."});
					return false;
				}else{
					sDate = $("input[name='RGS_DT']").val();
					if(!gfn_isNull(sDate)){
						if(sDate.length != 10){
							gfn_alertPopup({message:"올바르지 않은 등록일자입니다."});
							return false;
						}
					}
				}
			}
			
			var sEmail = $("input[name='USER_MAIL']").val();
			if(!gfn_isNull(sEmail)){
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(sEmail.match(regExp) == null) {
					gfn_alertPopup({message:"올바르지 않은 이메일입니다."});
					return false;
				}
			}
			
			// 체크박스의 값을 변경한다.
			if($('input:checkbox').is(":checked")){
				$('input:checkbox').attr('value', "1");
			}
			
			// 수정
			fn_updUser();
		});
		
		$("#btnDelete").on("click", function(e) {
			e.preventDefault();
		
			if(confirm("정말 삭제하시겠습니까?")){
				// 삭제
				fn_delUser();
			}else{
				return false;
			}
		});
	}
	
	function fn_updUser(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/updUser.do' />");
		comAjax.setCallback("fn_updUserCallback");
		comAjax.ajax();
	}
	
	function fn_updUserCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"수정이 완료되었습니다."
					, fade:250, duration:500});
				
				var myTimer = setTimeout(function() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='userList.do' />");
					comSubmit.submit();
					
					clearTimeout(myTimer);
				}, 1000);
			}else{
				gfn_alertPopup({message:"일시적인 오류가 발생하였습니다."});
				return false;
			}
		}else{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/error.do' />");
			comSubmit.submit();
		}
	}
	
	function fn_delUser(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/delUser.do' />");
		comAjax.setCallback("fn_delUserCallback");
		comAjax.ajax();
	}
	
	function fn_delUserCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"삭제가 완료되었습니다."
					, fade:250, duration:500});
				
				var myTimer = setTimeout(function() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='userList.do' />");
					comSubmit.submit();
				}, 1000);
			}else{
				gfn_alertPopup({message:"일시적인 오류가 발생하였습니다."});
				return false;
			}
		}else{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/error.do' />");
			comSubmit.submit();
		}
	}
	</script>
	
</body>
</html>