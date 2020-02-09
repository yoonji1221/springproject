<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
<body>



	<h1>봉사 리스트</h1>
	<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href = "<%=contextPath %>/vinfolist?nowPage=${paging.nowPage}&cntPerPage="
					+ sel;
		}
	</script>
<body>
	<h2>게시판</h2>

	<div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()" items="${paging}" var="paging">
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
				<option value="30"
					<c:if test="${paging.cntPerPage == 30}">selected</c:if>>30줄
					보기</option>
				<option value="50"
					<c:if test="${paging.cntPerPage == 50}">selected</c:if>>50줄
					보기</option>
			</select>
		</div>
		<!-- 옵션선택 끝 -->
		<table border="1">
			<tr>
				<th>제목</th>
				<th>날짜</th>
				<th>장소</th>
				<th>모집인원</th>
				<th>분야</th>
				<th>모집기간</th>
			</tr>
			<c:forEach items="${viewAll }" var="vinfolist">
				<tr>
					<td>${vinfolist.progrmSj}</td>
					<td>${vinfolist.progrmBgnde}</td>
					<td>${vinfolist.actPlace}</td>
					<td>${vinfolist.rcritNmpr}</td>
					<td>${vinfolist.srvcClCode}</td>
					<td>${vinfolist.noticeBgnde}~ ${vinfolist.noticeEndde}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div style="display: block; text-align: center;" items="${paging}" var="paging">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="<%=contextPath %>/vinfolist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="<%=contextPath %>/vinfolist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="<%=contextPath %>/vinfolist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</div>
	
</body>
</html>