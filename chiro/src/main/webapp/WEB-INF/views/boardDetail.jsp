<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>글읽기</title>
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
					
					<span class="image main">
						<img class="my_img" src="/images/board_read01.png" alt="" />
					</span>
					
					<!-- Form -->
					<form method="post" id="frm" name="frm" method="post" autocomplete="off">
						<div class="row gtr-uniform">
							<div class="col-12-xsmall">
								<input type="text" readonly="readonly" name="NAME" id="NAME" value="${board.NAME}" placeholder="작성자" maxlength="30" />
								<input type="hidden" id="BOARD_KEY" name="BOARD_KEY" value="${board.BOARD_KEY}">
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${board.USER_KEY}">
								<input type="hidden" id="BOARD_PWD" name="BOARD_PWD" value="${board.BOARD_PWD}" placeholder="비밀번호" maxlength="4" />
								<input type="hidden" id="CHK_INFO" name="CHK_INFO" value="${board.CHK_INFO}">
							</div>
							<div class="col-12-xsmall">
								<input type="text" readonly="readonly" name="PC_DT" id="PC_DT" value="${board.PC_DT}" placeholder="등록일" />
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
									<li><input type="submit" id="btnModify" value="수정" class="button primary" /></li>
									<li><input type="submit" id="btnDelete" value="삭제" class="button" /></li>
									<li><a href="#this" class="button big" id="btnCancel">목록</a></li>
									<li><a href="#this" class="button big" id="btnWrite">글쓰기</a></li>
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
		// TODO 관리자 로그인 체크하여 수정, 삭제, 글쓰기 display 처리
		$("#btnModify").on("click", function(e) { // 수정
			e.preventDefault();
			// TODO 수정 시 관리자 체크 or 숨김처리
			fn_goWritePage(sCommand, "frm");
		});
		
		$("#btnDelete").on("click", function(e) { // 삭제
			e.preventDefault();
			
			if(confirm("정말 삭제하시겠습니까?")){
				// TODO 삭제 시 관리자 체크 or 숨김처리
				fn_delBoard();
			}else{
				return false;
			}
		});
			
		$("#btnCancel").on("click", function(e) { // 목록
			e.preventDefault();
			window.history.back();
		});
		
		$("#btnWrite").on("click", function(e) { // 글쓰기
			e.preventDefault();
			fn_goWritePage(sCommand);
		});
	});
	
	function fn_goWritePage(sCommand, obj) {
		// TODO 관리자 로그인 체크
		var comSubmit = new ComSubmit((!gfn_isNull(obj) ? obj : ""));
		comSubmit.addParam("command", sCommand);
		comSubmit.setUrl("<c:url value='/write.do' />");
		comSubmit.submit();
	}
	
	function fn_delBoard(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/delBoard.do' />");
		comAjax.setCallback("fn_delBoardCallback");
		comAjax.ajax();
	}
	
	function fn_delBoardCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"삭제가 완료되었습니다."
					, fade:250, duration:500});
				
				var myTimer = setTimeout(function() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/board.do' />");
					comSubmit.addParam("command", sCommand);
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