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
						<h1>글쓰기</h1>
					</header>
					
					<!-- Form -->
					<form method="post" id="frm" name="frm" method="post" autocomplete="off">
						<div class="row gtr-uniform">
							<div class="col-12-xsmall">
								<input type="text" name="NAME" id="NAME" value="${board.NAME}" placeholder="작성자" maxlength="30" />
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${board.USER_KEY}">
								<input type="hidden" id="IDX" name="IDX" value="${board.IDX}">
							</div>
							<div class="col-12-xsmall">
								<input type="password" id="PWD" name="PWD" value="${board.PWD}" placeholder="비밀번호" maxlength="30" />
							</div>
							<div class="col-12">
								<input type="text" name="TITLE" id="TITLE" value="${board.TITLE}" placeholder="제목" maxlength="100" />
							</div>
							<div class="col-12">
								<input type="checkbox" id="CHK_INFO" name="CHK_INFO" value="1">
								<label for="CHK_INFO">공지사항으로 등록하기</label>
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<textarea name="CONTENTS" id="CONTENTS" placeholder="내용" rows="10" maxlength="4000" >${board.CONTENTS}</textarea>
							</div>

							<!-- Break -->
							<div class="col-12">
								<ul class="actions" style="float: right;">
									<li><input type="submit" id="submit" value="작성완료" class="button primary" /></li>
									<li><a href="#this" class="button big" id="cancel">취소</a></li>
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
	var sCommand = '${command}';
	
	$(function(){
		
		if(!gfn_isNull('${board.IDX}')){
			if(sCommand == "notice"){
				$("H1").append("(UPDATE)"); // header
				$("#submit").val("수정완료"); // 입력 --> 수정
				
				$("#NAME").prop("readonly", true);
				document.getElementById('PWD').style.display = 'none';
				
				// 체크박스
				if('${board.CHK_INFO}' == '1'){
					$("#CHK_INFO").prop("checked", true);
				}
			}else if(sCommand == "board"){
				
			}
		}else{
			if(sCommand == "notice"){
				$("#NAME").val("관리자");
				$("#NAME").prop("readonly", true);
				document.getElementById('PWD').style.display = 'none';
			}else if(sCommand == "board"){
				document.getElementById('CHK_INFO').style.display = 'none';
			}
		}
		
		$("#cancel").on("click", function(e) { // 뒤로가기
			e.preventDefault();
			window.history.back();
		});
			
		$("#submit").on("click", function(e) {
			e.preventDefault();
			
			if(gfn_isNull($("#NAME").val())){
				alert("작성자를 입력하세요.");
				return false;
			}
			
			if(sCommand != "notice"){
				var sPwd = $("#PWD").val();
				if(gfn_isNull(sPwd)){
					alert("비밀번호를 입력하세요.");
					return false;
				}
				
				if(sPwd.length < 4){
					alert("비밀번호를 4자리 이상 입력하세요.");
					return false;
				}
			}
			
			if(gfn_isNull($("#TITLE").val())){
				alert("제목을 입력하세요.");
				return false;
			}
			
			if(gfn_isNull($("#CONTENTS").val())){
				alert("내용을 입력하세요.");
				return false;
			}
			
			if(!gfn_isNull('${board.IDX}')){
				if(sCommand == "notice"){
					fn_updNotice();
				}else{
					fn_updBoard();
				}
			}else{
				if(sCommand == "notice"){
					fn_insNotice();
				}else{
					fn_insBoard();
				}
			}
		});
	});
	
	function fn_insNotice(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/insNotice.do' />");
		comAjax.setCallback("fn_insNoticeCallback");
		comAjax.ajax();
	}
	
	function fn_insNoticeCallback(){
		alert("등록이 완료되었습니다.");
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='notice.do' />");
		comSubmit.submit();
	}
	
	function fn_updNotice(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/updNotice.do' />");
		comAjax.setCallback("fn_updNoticeCallback");
		comAjax.ajax();
	}
	
	function fn_updNoticeCallback(){
		alert("수정이 완료되었습니다.");
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='notice.do' />");
		comSubmit.submit();
	}
	</script>
	
</body>
</html>