<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>회원등록</title>
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
						<h1>회원등록</h1>
					</header>
					
					<span class="image main">
						<img src="/images/join_chiro01.jpg" alt="" style="box-shadow: 10px 10px 20px -5px rgba(0, 0, 0, 0.8);" />
					</span>
					
					<!-- Form -->
					<div class="my_info">
						<h2>가입정보를 입력하세요.</h2>
					</div>
					
					<form method="post" id="frm" name="frm" method="post" autocomplete="off">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" name="USER_NAME" id="USER_NAME" value="${user.USER_NAME}" placeholder="이름" maxlength="100" />
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${user.USER_KEY}">
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" numberOnly name="USER_AGE" id="USER_AGE" value="${user.USER_AGE}" class="int" placeholder="나이" maxlength="11" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="BIRTH" id="BIRTH" value="${user.BIRTH}" class="int" placeholder="생년월일(예 : 1970-01-01)" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="email" name="USER_MAIL" id="USER_MAIL" value="${user.USER_MAIL}" placeholder="이메일" maxlength="100" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" numberOnly name="PHONE_NUMBER" id="PHONE_NUMBER" value="${user.PHONE_NUMBER}" class="int" placeholder="휴대전화" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="11" />
							</div>
							<div class="col-6 col-12-xsmall">
								<select name="GENDER" id="GENDER">
									<option value="">- 성별 -</option>
									<option value="M">남성</option>
									<option value="W">여성</option>
								</select>
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="RGS_DT" id="RGS_DT" value="${user.RGS_DT}" class="int" placeholder="등록일자(예 : 1970-01-01)" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" numberOnly name="RGS_CNT" id="RGS_CNT" value="${user.RGS_CNT}" class="int" placeholder="등록횟수" maxlength="11" />
							</div>
							
							<!-- Break -->
							<div class="col-6 col-12-small">
								<input type="checkbox" id="CHK01" name="CHK01" value="1">
								<label for="CHK01">디스크 수술이나 그 외에 다른 진단을 받으신적 있습니까?</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" id="CHK02" name="CHK02" value="1">
								<label for="CHK02">이전에 도수(카이로프래틱) 치료를 받아보신적 있으십니까?</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" id="CHK03" name="CHK03" value="1">
								<label for="CHK03">신체중에 근위축이나 마비가 오는 부위가 있습니까?</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" id="CHK04" name="CHK04" value="1">
								<label for="CHK04">병력, 수술(성형포함), 복용제가 있으십니까?</label>
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<textarea name="OUTL_CTT" id="OUTL_CTT" placeholder="비고" rows="6" maxlength="3000" >${user.OUTL_CTT}</textarea>
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" id="btnSubmit" value="등록하기" class="button primary" /></li>
									<li><input type="reset" value="초기화" /></li>
								</ul>
							</div>
						</div>
					</form>
					
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
	$(function(){
		
		 // 달력 생성
	    $("#BIRTH").calendar();
	    $("#RGS_DT").calendar();
	    
		// USER_KEY CHECK
		if(!gfn_isNull('${user.USER_KEY}')){
			$("H1").append("(UPDATE)"); // header
			$("#submit").val("MODIFY"); // 입력 --> 수정
			
			// 성별
		    var sGender = '${user.GENDER}';
		    sGender = (sGender == "남성" ? "M" : (!gfn_isNull(sGender) ? "W" : ""));
			$("#GENDER").val(sGender).prop("selected", true);
			
			// 체크박스
			if('${user.CHK01}' == '1'){
				$("#CHK01").prop("checked", true);
			}
			if('${user.CHK02}' == '1'){
				$("#CHK02").prop("checked", true);
			}
			if('${user.CHK03}' == '1'){
				$("#CHK03").prop("checked", true);
			}
			if('${user.CHK04}' == '1'){
				$("#CHK04").prop("checked", true);
			}
		}else{
			
			 // 오늘날짜 입력
			$("#RGS_DT").val(new Date().toISOString().substring(0, 10));
		}
	});
	
	$(function(){
		$("input:text[numberOnly]").on("focus", function() {
		    var x = $(this).val();
		    x = removeCommas(x);
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
					x = addCommas(x);
					break;
				case "PHONE_NUMBER":
					x = addMinus(x);
					break;
				default:
					break;
				}
		        
		        $(this).val(x);
		    }
		}).on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		
		$("#btnSubmit").on("click", function(e) {
			e.preventDefault();
			
			if(gfn_isNull($("#USER_NAME").val())){
				gfn_alertPopup({message:"이름은 필수입력 사항입니다."});
				return false;
			}
			
			var sDate;
			sDate = $("#BIRTH").val();
			if(!gfn_isNull(sDate)){
				if(sDate.length != 10){
					gfn_alertPopup({message:"올바르지 않은 날짜입니다."});
					return false;
				}else{
					sDate = $("#RGS_DT").val();
					
					if(!gfn_isNull(sDate)){
						if(sDate.length != 10){
							gfn_alertPopup({message:"올바르지 않은 날짜입니다."});
							return false;
						}
					}
				}
			}
			
			var sEmail = $("#USER_MAIL").val();
			if(!gfn_isNull(sEmail)){
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(sEmail.match(regExp) == null) {
					gfn_alertPopup({message:"올바르지 않은 이메일입니다."});
					return false;
				}
			}
			
			if(!gfn_isNull('${user.USER_KEY}')){
				fn_updUser();
			}else{
				fn_insUser();
			}
		});
	});
	
	// 3자리 단위마다 콤마 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 전화번호 정규식
	function addMinus(x) {
		return x.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
	}
	
	// 모든 콤마 제거
	function removeCommas(x) {
		if(!x || x.length == 0) return "";
		else return x.split(",").join("");
	}
	
	function fn_insUser(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/insUser.do' />");
		comAjax.setCallback("fn_insUserCallback");
		comAjax.ajax();
	}
	
	function fn_insUserCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"등록이 완료되었습니다."});
				
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
				gfn_alertPopup({message:"수정이 완료되었습니다."});
				
				var myTimer = setTimeout(function() {
					window.opener.location.reload();
					window.open("about:blank","_self").close();
					
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
	</script>
	
</body>
</html>