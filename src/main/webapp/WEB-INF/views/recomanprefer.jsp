<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="vinfo.VinfoVO"%>
<%@page import="volunteer.VolunteerVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String Path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description"
	content="Clean responsive bootstrap website template">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic|Nanum+Myeongjo&display=swap"
	rel="stylesheet">

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<style type="text/css">
table {
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
}

th {
	text-align: center;
}
</style>
<body>
	<section id="subintro">

		<div class="container">
			<div class="row">
				<div class="span4">
					<h3>
						Mypage <strong>나의 추천 봉사 보기</strong>
					</h3>
				</div>
				<div class="span8">
					<ul class="breadcrumb notop">
						<li><a href="/volunteer134/home">Home</a><span
							class="divider">/</span></li>
						<li class="active">Mypage</li>
					</ul>
				</div>
			</div>
		</div>

	</section>
	<!-- 1번 div -->
	<div class="row-fluid" style="width: 700px;">
		<!-- 2번 div -->
		<div class="span2">
			<!--Sidebar content-->
			<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
			<!--Sidebar content-->
		</div>

		<div class="span10">
			<!--Body content-->


			<h1
				style="font-family: 'Do Hyeon', sans-serif; font-size: 30px; margin-left: 100px;">
				<%=session.getAttribute("dbid") %>님의 지역, 선호도 기반 추천봉사입니다
			</h1>

			<section id="tables" class="doc" style="padding-top: 0px;">

				<table id="table1" class=" table table-striped" style="width: 1200px;margin-left: 90px;height: 500px;">
					<tr>
						<th>제목</th>
						<th>날짜</th>
						<th>장소</th>
						<th nowrap>모집인원</th>
						<th nowrap>신청인원</th>
						<th>분야</th>
						<th>모집기간</th>

						<th></th>
					</tr>
					<c:forEach items="${vinfolist }" var="vinfolist">
						<tr>
							<td>${vinfolist.progrmSj}</td>
							<td>${vinfolist.progrmBgnde}</td>
							<td>${vinfolist.actPlace}</td>
							<td>${vinfolist.rcritNmpr}</td>
							<td>${vinfolist.appTotal}</td>
							<td noWrap>${vinfolist.srvcClCode}</td>
							<td>${vinfolist.noticeBgnde}~${vinfolist.noticeEndde}</td>
							<td nowrap>
								<button onClick="location.href='/volunteer134/volunteerMypage/volundetail?progrmRegistNo=${vinfolist.progrmRegistNo}'">정보 조회</button></td>
					</c:forEach>

					</tr>
				</table>
			</section>

			<!--Body content-->

		</div>
	</div>

</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>