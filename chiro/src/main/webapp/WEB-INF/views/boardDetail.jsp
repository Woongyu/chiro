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
						<h1>글읽기</h1>
					</header>
					
					<!-- Form -->
					<form method="post" id="frm" name="frm" method="post" autocomplete="off">
						<div class="row gtr-uniform">
							<div class="col-12-xsmall">
								<input type="text" readonly="readonly" name="NAME" id="NAME" value="${board.NAME}" placeholder="작성자" maxlength="30" />
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${board.USER_KEY}">
								<input type="hidden" id="IDX" name="IDX" value="${board.IDX}">
								<input type="hidden" id="PWD" name="PWD" value="${board.PWD}" placeholder="비밀번호" maxlength="30" />
								<input type="hidden" id="CHK_INFO" name="CHK_INFO" value="${board.CHK_INFO}">
							</div>
							<div class="col-12">
								<input type="text" readonly="readonly" name="TITLE" id="TITLE" value="${board.TITLE}" placeholder="제목" maxlength="100" />
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<textarea readonly="readonly" name="CONTENTS" id="CONTENTS" placeholder="내용" rows="10" maxlength="4000" >${board.CONTENTS}</textarea>
							</div>

							<!-- Break -->
							<div class="col-12">
								<ul class="actions" style="float: right;">
									<li><input type="submit" id="modify" value="수정" class="button primary" /></li>
									<li><input type="submit" id="delete" value="삭제" class="button" /></li>
									<li><a href="#this" class="button big" id="cancel">목록</a></li>
									<li><a href="#this" class="button big" id="write">글쓰기</a></li>
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
		// TO-DO 관리자 로그인 체크하여 수정, 삭제, 글쓰기 display 처리
		$("#modify").on("click", function(e) { // 수정
			e.preventDefault();
			// TO-DO 수정삭제 시 관리자 체크
			fn_openWriteUpd(sCommand);
		});
		
		$("#delete").on("click", function(e) { // 삭제
			e.preventDefault();
			
			if(confirm("정말 삭제하시겠습니까?")){
				if(sCommand == "notice"){
					fn_delNotice();
				}else{
					fn_delBoard();
				}
			}else{
				return false;
			}
		});
			
		$("#cancel").on("click", function(e) { // 목록
			e.preventDefault();
			window.history.back();
		});
		
		$("#write").on("click", function(e) { // 글쓰기
			e.preventDefault();
			fn_openWritePage(sCommand);
		});
	});
	
	function fn_delNotice(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/delNotice.do' />");
		comAjax.setCallback("fn_delNoticeCallback");
		comAjax.ajax();
	}
	
	function fn_delNoticeCallback(){
		alert("삭제가 완료되었습니다.");
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='notice.do' />");
		comSubmit.submit();
	}
	
	function fn_openWritePage(sCommand) {
		// TO-DO 관리자 로그인 체크
		var comSubmit = new ComSubmit();
		comSubmit.addParam("command", sCommand);
		comSubmit.setUrl("<c:url value='/write.do' />");
		comSubmit.submit();
	}
	
	function fn_openWriteUpd(sCommand) {
		var comSubmit = new ComSubmit("frm");
		comSubmit.addParam("command", sCommand);
		comSubmit.setUrl("<c:url value='/write.do' />")
		comSubmit.submit();
	}
	</script>
	
</body>
</html>