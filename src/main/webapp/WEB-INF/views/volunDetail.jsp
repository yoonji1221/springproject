<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String Path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<style>
table{
margin : auto;
border: 2px solid gray;
border-collapse: collapse;
}

td{
text-align:center;
border: 1px solid gray;
padding: 10px;
}
</style>

</head>
<body>

<h3> 상세 봉사 정보 페이지 </h3>
<div style="position:fixed; top:70px; left:250px;">

<table>
<c:forEach items="${list}" var="vo">
<!-- 20200205 - 2020년02월05일로 변환하기 : 다시 해보기  -->
<%-- <fmt:parseDate var="dateString" value="${vo.actBeginTm}" pattern="yyyyMMdd"/>
<fmt:formatDate var="actBeginTm" value="${dateString}" pattern="yyyy-MM-dd"/> --%>
<tr><td  colspan="2">${vo.progrmSj}</td></tr>
<tr><td>봉사 번호</td> <td>${vo.progrmRegistNo}</td> </tr>
<tr><td>봉사 날짜</td> <td>${vo.progrmBgnde}</td></tr>
<tr><td>봉사 시간</td> <td>${vo.actBeginTm} ~ ${vo.actEndTm}</td></tr>
<tr><td>모집 기간</td> <td>${vo.noticeBgnde} ~ ${vo.noticeEndde}</td></tr>
<tr><td>모집 인원</td> <td>${vo.rcritNmpr}</td></tr>
<tr><td>신청 인원</td> <td>${vo.appTotal}</td></tr>
<tr><td>봉사 분야</td> <td>${vo.srvcClCode}</td></tr>
<tr><td>봉사 장소</td> <td>${vo.actPlace}</td></tr>
<tr><td>센터 이름</td> <td>${mnnstNm} <button onclick="window.open('')">상세보기</button></td></tr>
<tr><td>상세 내용</td> <td>${vo.progrmCn}</td></tr>
</c:forEach>
</table>



<%String old_url = request.getHeader("referer");
String split_url = old_url.substring(35, 50);
if(split_url.equals("volunteerMypage")){
%>
<button onclick="window.open('<%=Path%>/reviewwrite')">리뷰작성</button><!-- 경로추가 -->
<button onclick="window.open('<%=Path%>/reviewupdate')">리뷰수정</button> <!-- 리뷰수정버튼 누르면, 리뷰삭제 + 수정 가능하도록 -->
<%
}else{
%>
<button onclick="volunRequest()">봉사 신청</button>
<%
}
%>
</div>
</body>
<script>
function volunRequest() {
	alert("신청");
	location.href="<%=Path%>/requestVolunWork";
};
</script>
</html>