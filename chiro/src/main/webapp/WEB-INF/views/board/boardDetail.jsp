<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>글읽기</title>
<style type="text/css">
.contents {
	text-align: left;
    padding-left: 1.0em;
}
.my_comment {
	opacity: 0.75;
	border-radius: 0.5em;
	background: #C6FFDD;
	background: -webkit-linear-gradient(to right, #f7797d, #FBD786, #C6FFDD);
	background: linear-gradient(to right, #f7797d, #FBD786, #C6FFDD);
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
				<jsp:include page="../frame/header.jsp" />
				
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
								<input type="text" readonly="readonly" name="NAME" id="NAME" value="${board.NAME}" placeholder="작성자" />
								<input type="hidden" id="BOARD_KEY" name="BOARD_KEY" value="${board.BOARD_KEY}">
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${board.USER_KEY}">
								<input type="hidden" id="BOARD_PWD" name="BOARD_PWD" value="${board.BOARD_PWD}" />
								<input type="hidden" id="CHK_INFO" name="CHK_INFO" value="${board.CHK_INFO}">
							</div>
							<div class="col-12-xsmall">
								<input type="text" readonly="readonly" name="PC_DT" id="PC_DT" value="${board.PC_DT}" placeholder="등록일" />
							</div>
							<div class="col-12">
								<input type="text" readonly="readonly" name="TITLE" id="TITLE" value="${board.TITLE}" placeholder="제목" />
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<textarea readonly="readonly" name="CONTENTS" id="CONTENTS" placeholder="내용" rows="10">${board.CONTENTS}</textarea>
							</div>
							
							<!-- Comment -->
							<div class="col-12">
								<h5 class="my_comment">&nbsp;</h5>
							</div>
							
							<div class="col-12 table-wrapper">
								<table style="text-align: center;">
									<colgroup>
										<col width="10%" />
										<col width="*" />
										<col width="15%" />
									</colgroup>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(comment) > 0}">
												<c:forEach items="${comment}" var="row">
													<tr>
														<td>${row.COMMENT_NAME}</td>
														<td class="contents">${row.COMMENT_CONTENTS}</td>
														<td>${row.PC_DT}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="3">등록된 댓글이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							
							<div class="col-12 table-wrapper">
								<table style="text-align: center;">
									<colgroup>
										<col width="20%" />
										<col width="*" />
										<col width="10%" />
									</colgroup>
									<tbody>
										<tr>
											<td>
												<input type="text" name="COMMENT_NAME" id="COMMENT_NAME" placeholder="이름" maxlength="30" />
											</td>
											<td>
												<input type="text" name="COMMENT_CONTENTS" id="COMMENT_CONTENTS" placeholder="" maxlength="1000" />
											</td>
											<td>
												<a href="#this" id="btnComment" class="button primary" style="background-color: #5ca0d3;">댓글</a>
											</td>
										</tr>
									</tbody>
								</table>
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
					
					<!-- The Modal -->
					<div id="myModal" class="modal">
						<!-- Modal content -->
						<div class="modal-content" style="max-width: 250px;">
							<div class="modal-header">
								<span class="close">&times;</span>
								<h3 style="margin-top: 0.8em;">비밀번호를 입력하세요.</h3>
							</div>
							<div class="modal-body">
								<div class="row gtr-uniform">
									<div class="col-12">
										<input type="password" id="TMP_BOARD_PWD" name="TMP_BOARD_PWD" maxlength="4" />
									</div>
									<div class="col-12-xsmall">
										<ul class="actions">
											<li><a href="#this" class="button big" id="btnConfirm">확인</a></li>
										</ul>
									</div>
								</div>
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
	var sCommand = '${COMMAND}';
	
	$(function(){
		// TODO 관리자 로그인 체크하여 수정, 삭제, 글쓰기 display 처리
		$("#btnModify").on("click", function(e) { // 수정
			e.preventDefault();
			// TODO 수정 시 관리자 체크 or 숨김처리
			fn_goWritePage(sCommand, "frm");
		});
		
		$("#btnDelete").on("click", function(e) { // 삭제
			e.preventDefault();
			
			// TODO 본인 글에만 삭제버튼이 나타나도록 하기.
			if(sCommand == "notice"){
				if(confirm("정말 삭제하시겠습니까?")){
					// TODO 삭제 시 관리자 체크 or 숨김처리
					fn_delBoard();
				}else{
					return false;
				}
			}else{
				$("#TMP_BOARD_PWD").val("");
				var comModal = new ComModal();
				comModal.block();
			}
		});
		
		$("#btnConfirm").on("click", function(e) {
			e.preventDefault();
			
			var sTmpBoardPwd = $("#TMP_BOARD_PWD").val();
			if(!gfn_isNull(sTmpBoardPwd)){
				if(sTmpBoardPwd != $("#BOARD_PWD").val()){
					gfn_alertPopup({message:"비밀번호가 올바르지 않습니다."});
					return false;
				}
				
				if(confirm("정말 삭제하시겠습니까?")){
					// TODO 삭제 시 관리자 체크 or 숨김처리
					fn_delBoard();
				}else{
					return false;
				}
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
		
		$("#btnComment").on("click", function(e) { // 댓글
			e.preventDefault();
		
			var sCommentName = $("#COMMENT_NAME").val();
			var sCommentContents = $("#COMMENT_CONTENTS").val();
			if(gfn_isNull(sCommentName)){
				gfn_alertPopup({message:"이름을 입력하세요."});
				return false;
			}
			
			if(gfn_isNull(sCommentContents)){
				gfn_alertPopup({message:"댓글 내용을 입력하세요."});
				return false;
			}
			
			fn_insComment({name: sCommentName
				, contents: sCommentContents, key: $("#BOARD_KEY").val()});
			}
		});
	});
	
	function fn_goWritePage(sCommand, obj) {
		// TODO 관리자 로그인 체크
		var comSubmit = new ComSubmit((!gfn_isNull(obj) ? obj : ""));
		comSubmit.addParam("COMMAND", sCommand);
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
					comSubmit.addParam("COMMAND", sCommand);
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
	
	function fn_insComment(params){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/insComment.do' />");
		comAjax.addParam("BOARD_KEY", params.key);
		comAjax.addParam("COMMENT_NAME", params.name);
		comAjax.addParam("COMMENT_CONTENTS", params.contents);
		comAjax.setCallback("fn_insCommentCallback");
		comAjax.ajax();
	}
	
	function fn_insCommentCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"등록이 완료되었습니다."
					, fade:250, duration:500});
				
				var myTimer = setTimeout(function() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/board.do' />");
					comSubmit.addParam("COMMAND", sCommand);
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
	</script>
	
</body>
</html>