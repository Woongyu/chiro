<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<title>글쓰기</title>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
						<h1>글쓰기</h1>
					</header>
					
					<span class="image main">
						<img class="my_img" src="/images/board_write01.png" alt="" />
					</span>
					
					<!-- Form -->
					<form method="post" id="frm" name="frm" autocomplete="off" enctype="multipart/form-data">
						<div class="row gtr-uniform">
							<div class="col-12-xsmall">
								<input type="text" name="NAME" id="NAME" value="${board.NAME}" placeholder="작성자" maxlength="30" />
								<input type="hidden" id="BOARD_KEY" name="BOARD_KEY" value="${board.BOARD_KEY}" />
								<input type="hidden" id="USER_KEY" name="USER_KEY" value="${board.USER_KEY}" />
							</div>
							<div class="col-12-xsmall BOARD_PWD">
								<input type="password" id="BOARD_PWD" name="BOARD_PWD" placeholder="비밀번호" maxlength="4" />
							</div>
							<div class="col-12">
								<input type="text" name="TITLE" id="TITLE" value="${board.TITLE}" placeholder="제목" maxlength="100" />
							</div>
							<div class="col-12 CHK_INFO">
								<input type="checkbox" id="CHK_INFO" name="CHK_INFO" value="1" />
								<label class="CHK_INFO" for="CHK_INFO">공지사항으로 등록하기</label>
							</div>
							
							<!-- Break -->
							<div class="col-12">
								<textarea name="CONTENTS" id="CONTENTS" placeholder="내용" rows="10" maxlength="4000" onkeyup="fn_onKeyup(this, 240);">${board.CONTENTS}</textarea>
							</div>

							<!-- Break -->
							<div class="col-12">
								<ul class="actions" style="float: right;">
									<li><input type="submit" id="btnSubmit" value="작성하기" class="button primary" /></li>
									<li><a href="#this" class="button big" id="btnCancel">취소</a></li>
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
			<jsp:include page="../frame/sideMenu.jsp" />
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
	var sCommand = '${COMMAND}';
	var sBoardKey = '${board.BOARD_KEY}';
	var obj = []; // 전역변수
	
	$(function(){
		// 스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: obj,
			elPlaceHolder: "CONTENTS",
			sSkinURI: "/resources/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부
				bUseToolbar : true,            
				// 입력창 크기 조절바 사용 여부
				bUseVerticalResizer : true,    
				// 모드 탭(Editor | HTML | TEXT) 사용 여부
				bUseModeChanger : true,
			}
		});
		
		if(!gfn_isNull(sBoardKey)){
			$("H1").append("(UPDATE)"); // header
			$("#btnSubmit").val("수정하기");
			
			if(sCommand == "notice"){
				// TODO 관리자 로그인
				$("#NAME").prop("readonly", true);
				$("#BOARD_PWD").css("display", "none");
				$(".BOARD_PWD").css("display", "none");
				
				// 체크박스
				if('${board.CHK_INFO}' == '1'){
					$("#CHK_INFO").prop("checked", true);
				}
			}else{
				$(".CHK_INFO").css("display", "none");
				$("#CHK_INFO").css("display", "none");
				$("label[class='CHK_INFO']").each(function() {
					$(this).css("display", "none");
				});
				
			}
		}else{
			if(sCommand == "notice"){
				$("#NAME").val("관리자");
				$("#NAME").prop("readonly", true);
				$("#BOARD_PWD").css("display", "none");
				$(".BOARD_PWD").css("display", "none");
			}else{
				$(".CHK_INFO").css("display", "none");
				$("#CHK_INFO").css("display", "none");
				$("label[class='CHK_INFO']").each(function() {
					$(this).css("display", "none");
				});
			}
		}
		
		$("#btnCancel").on("click", function(e) { // 취소
			e.preventDefault();
			window.history.back();
		});
			
		$("#btnSubmit").on("click", function(e) { // 입력
			e.preventDefault();
			
			// id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
			
			if(gfn_isNull($("#NAME").val())){
				gfn_alertPopup({message:"작성자를 입력하세요."});
				return false;
			}
			
			if(gfn_isNull($("#TITLE").val())){
				gfn_alertPopup({message:"제목을 입력하세요."});
				return false;
			}
			
			if(gfn_isNull($("#CONTENTS").val())){
				gfn_alertPopup({message:"내용을 입력하세요."});
				return false;
			}
			
			if(sCommand != "notice"){
				var sBoardPwd = $("#BOARD_PWD").val();
				if(gfn_isNull(sBoardPwd)){
					gfn_alertPopup({message:"비밀번호를 입력하세요."});
					return false;
				}
				
				if(!$.isNumeric(sBoardPwd)){
					gfn_alertPopup({message:"비밀번호는 숫자만 가능합니다."});
					return false;
				}
				
				if(sBoardPwd.length < 4){
					gfn_alertPopup({message:"비밀번호를 4자리 이상 입력하세요."});
					return false;
				}
				
				if(!gfn_isNull(sBoardKey)){
					fn_chkBoardPwd();
				}
			}
			
			if(gfn_isNull(sBoardKey)){
				fn_insBoard(); // 입력
			}
		});
		
		// 자동개행
		var oContents = $("#CONTENTS");
		oContents.css('height', oContents.prop('scrollHeight')+5)
	});
	
	function fn_chkBoardPwd(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/chkBoardPwd.do' />");
		comAjax.setCallback("fn_chkBoardPwdCallback");
		comAjax.ajax();
	}
	
	function fn_chkBoardPwdCallback(data){
		var bTf = data.bTf;
		if(!gfn_isNull(bTf)){
			if(bTf == true){
				fn_updBoard(); // 수정
			}else{
				gfn_alertPopup({message:"비밀번호가 올바르지 않습니다."});
				return false;
			}
		}else{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/error.do' />");
			comSubmit.submit();
		}
	}
	
	function fn_onKeyup(obj, bSize) {
		obj.style.height = "1px"; // 초기화
		obj.style.height = (obj.scrollHeight >= bSize) ? obj.scrollHeight+5+"px" : bSize+"px";
	}

	function fn_insBoard(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/insBoard.do' />");
		comAjax.addParam("COMMAND", sCommand);
		comAjax.setCallback("fn_insBoardCallback");
		comAjax.ajax();
	}
	
	function fn_insBoardCallback(data){
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
	
	function fn_updBoard(){
		var comAjax = new ComAjax("frm");
		comAjax.setUrl("<c:url value='/updBoard.do' />");
		comAjax.addParam("COMMAND", sCommand);
		comAjax.setCallback("fn_updBoardCallback");
		comAjax.ajax();
	}
	
	function fn_updBoardCallback(data){
		var nCnt = data.nCnt;
		if(!gfn_isNull(nCnt)){
			if(nCnt > 0){
				gfn_alertPopup({message:"수정이 완료되었습니다."
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