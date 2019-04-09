<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>회원상세정보</title>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
	
		<!-- Main -->
		<div id="main">
			<div class="inner">
				
				<!-- Content -->
				<section>
					<header class="main">
						<h1>회원상세정보</h1>
					</header>

					<span class="image main">
						<img src="/images/member_detail01.png" alt="" style="box-shadow: 10px 10px 20px -5px rgba(0, 0, 0, 0.8);" />
					</span>

					<!-- Form -->
					<h2>Membership Application Form</h2>
					
					<form method="post" id="frm" name="frm" method="post" autocomplete="off">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly" name="USER_NAME" id="USER_NAME" value="${user.USER_NAME}" placeholder="이름" />
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${user.USER_KEY}">
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly" name="USER_AGE" id="USER_AGE" value="${user.USER_AGE}" class="int" placeholder="나이" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly"  name="BIRTH" id="BIRTH" value="${user.BIRTH}" placeholder="생년월일" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="email" readonly="readonly" name="USER_MAIL" id="USER_MAIL" value="${user.USER_MAIL}" placeholder="이메일" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly" name="PHONE_NUMBER" id="PHONE_NUMBER" value="${user.PHONE_NUMBER}" placeholder="휴대전화" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly" name="GENDER" id="GENDER" value="${user.GENDER}" placeholder="성별" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly" name="RGS_DT" id="RGS_DT" value="${user.RGS_DT}" placeholder="등록일자" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" readonly="readonly" name="RGS_CNT" id="RGS_CNT" value="${user.RGS_CNT}" placeholder="횟수" />
							</div>
							
							<!-- Break -->
							<div class="col-6 col-12-small">
								<input type="checkbox" readonly="readonly" id="CHK01" name="CHK01" value="${user.CHK01}">
								<label for="CHK01">디스크 수술이나 그 외에 다른 진단을 받으신적 있습니까?</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" readonly="readonly" id="CHK02" name="CHK02" value="${user.CHK02}">
								<label for="CHK02">이전에 도수(카이로프래틱) 치료를 받아보신적 있으십니까?</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" readonly="readonly" id="CHK03" name="CHK03" value="${user.CHK03}">
								<label for="CHK03">신체중에 근위축이나 마비가 오는 부위가 있습니까?</label>
							</div>
							<div class="col-6 col-12-small">
								<input type="checkbox" readonly="readonly" id="CHK04" name="CHK04" value="${user.CHK04}">
								<label for="CHK04">병력, 수술(성형포함), 복용제가 있으십니까?</label>
							</div>

							<!-- Break -->
							<div class="col-12">
								<textarea readonly="readonly" name="OUTL_CTT" id="OUTL_CTT" placeholder="비고" rows="6" >${user.OUTL_CTT}</textarea>
							</div>

							<!-- Break -->
							<div class="col-12">
								<ul class="actions">
									<li><input type="submit" id="modify" value="MODIFY" class="button primary" /></li>
									<li><input type="submit" id="delete" value="DELETE" class="button" /></li>
								</ul>
							</div>
						</div>
					</form>
					
					<hr class="major" />
					
				</section>
			</div>
		</div>

	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	$(document).ready(function() {
		$('input:checkbox').each(function() {
			if(this.value == "1"){
				this.checked = true;
			}
		});
		
		$("#modify").on("click", function(e) { // 수정
			e.preventDefault();
			fn_openJoinUpd();
		});
		
		$("#delete").on("click", function(e) { // 삭제
			e.preventDefault();
		
			if(confirm("정말 삭제하시겠습니까?")){
				fn_delUser();
			}else{
				return false;
			}
		});
	});
	
	function fn_delUser(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/delUser.do' />");
		comAjax.setCallback("fn_delUserCallback");
		comAjax.ajax();
	}
	
	function fn_delUserCallback(){
		alert("삭제가 완료되었습니다.");
		
		window.opener.location.reload();
		//window.close();
		window.open("about:blank","_self").close();
	}
	
	function fn_openJoinUpd() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/join.do' />")
		comSubmit.submit();
	}
	</script>
	
</body>
</html>