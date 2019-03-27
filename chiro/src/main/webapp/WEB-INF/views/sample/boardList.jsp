<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
</head>
<body>
	<h2>게시판 목록</h2>
	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.USER_IDX}</td>
							<td class="title"><a href="#this" name="title">${row.USER_NAME}</a>
								<input type="hidden" id="USER_IDX" name="USER_IDX"
								value="${row.USER_IDX}"></td>
							<td>${row.LUPD_CNT}</td>
							<td>${row.PC_TS}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<br />
	<a href="#this" class="btn" id="write">글쓰기</a>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});
			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_openBoardDetail($(this));
				alert("제목");
			});
		});
		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardWrite.do' />");
			comSubmit.submit();
		}
		function fn_openBoardDetail(obj) {
			alert("fn_openBoardDetail");
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardDetail.do' />");
			// comSubmit.addParam("USER_IDX", obj.parent().find("#USER_IDX").val());
			comSubmit.addParam("USER_IDX", ${map.USER_IDX});
			// comSubmit.addParam("IDX", $("#IDX").val());
			alert("submit");
			comSubmit.submit();
		}
		
		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/sample/selectBoardList.do' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectBoardListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody"); body.empty();
			if(total == 0){
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
				body.append(str);
			} else {
				var params = {
						divId : "PAGE_NAVI",
						pageIndex : "PAGE_INDEX",
						totalCount : total,
						eventName : "fn_selectBoardList" };
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" +
					"<td>" + value.IDX + "</td>" + 
					"<td class='title'>" + 
					"<a href='#this' name='title'>" + value.TITLE + "</a>" + 
					"<input type='hidden' name='title' value=" + value.IDX + ">" + "</td>" + 
					"<td>" + value.HIT_CNT + "</td>" + 
					"<td>" + value.CREA_DTM + "</td>" + 
					"</tr>"; });
				body.append(str);
				
				$("a[name='title']").on("click", function(e){ //제목
					e.preventDefault(); fn_openBoardDetail($(this));
				});
				}
		}
	</script>

</body>
</html>