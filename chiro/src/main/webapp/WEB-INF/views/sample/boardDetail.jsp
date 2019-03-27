<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.USER_IDX }</td>
				<th scope="row">조회수</th>
				<td>${map.LUPD_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.USER_NAME }</td>
				<th scope="row">작성시간</th>
				<td>${map.PC_TS }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.USER_NAME }</td>
			</tr>
			<tr>
				<td colspan="4">${map.LUPD_CNT }</td>
			</tr>
		</tbody>
	</table>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			$("#update").on("click", function(e) {
				e.preventDefault();
				fn_openBoardUpdate();
			});
		});
		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardList.do' />");
			comSubmit.submit();
		}
		function fn_openBoardUpdate() {
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>
	}
</body>
</html>
