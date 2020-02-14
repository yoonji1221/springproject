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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<style type="text/css">
table{
margin : auto;
border: 2px solid pink;
border-collapse: collapse;
}
td{
text-align:center;
border: 1px solid gray;
padding: 10px;
}
td.info1{
text-align:center;
border: 1px solid gray;
padding: 10px;
width:100px;
}

td.info{
text-align:center;
border: 1px solid gray;
padding: 10px;
width:500px;
word-break:break-all;
}
</style>
</head>


<script>
$(function(){
	$("#request_btn").on('click', function(){
		alert("봉사 신청하시겠습니까?");
})// btn end 

});
</script>

<body>
<h3> 상세 봉사 정보 페이지 </h3>
<div style="top:70px; left:250px;">
<table>
<c:forEach items="${list}" var="vo">
<!-- 20200205 - 2020년02월05일로 변환하기 : 다시 해보기  -->
<%-- <fmt:parseDate var="dateString" value="${vo.actBeginTm}" pattern="yyyyMMdd"/>
<fmt:formatDate var="actBeginTm" value="${dateString}" pattern="yyyy-MM-dd"/> --%>
<tr><td  colspan="2">${vo.progrmSj}</td></tr>
<tr><td class="info1">봉사 번호</td> <td class="info">${vo.progrmRegistNo}</td> </tr>
<tr><td class="info1">봉사 날짜</td> <td class="info">${vo.progrmBgnde}</td></tr>
<tr><td class="info1">봉사 시간</td> <td class="info">${vo.actBeginTm} ~ ${vo.actEndTm}</td></tr>
<tr><td class="info1">모집 기간</td> <td class="info">${vo.noticeBgnde} ~ ${vo.noticeEndde}</td></tr>
<tr><td class="info1">모집 인원</td> <td class="info">${vo.rcritNmpr}</td></tr>
<tr><td class="info1">신청 인원</td> <td class="info">${vo.appTotal}</td></tr>
<tr><td class="info1">봉사 분야</td> <td class="info">${vo.srvcClCode}</td></tr>
<tr><td class="info1">봉사 장소</td> <td class="info">${vo.actPlace}</td></tr>
<tr><td class="info1">봉사 기관 주소</td> <td class="info">${vo.postAdres}</td></tr>
<tr><td class="info1">센터 이름</td> <td class="info">${mnnstNm} <button onclick="window.open('')">상세보기</button></td></tr>
<tr><td class="info1">상세 내용</td> <td class="info">${vo.progrmCn}</td></tr>

<%String old_url = request.getHeader("referer");
String split_url[]  = old_url.split("/");
if(split_url[4].equals("volunteerMypage")){
%>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>

<tr><td  colspan="2"><button onclick="window.open('<%=Path%>/reviewwrite')" >리뷰작성</button> <button onclick="window.open('<%=Path%>/reviewupdate')">리뷰수정</button></td></tr>

<%
}else if (split_url[4].contains("vinfolist")) { 
%>

<tr><td  colspan="2">
<form action="/volunteer134/requestVolunWork" method="post">
<c:forEach items="${list}" var="vo">
<input type="hidden" id="progrmRegistNo" name="progrmRegistNo" value='${vo.progrmRegistNo}'>
<input type="hidden" id="actPlace" name="actPlace" value='${vo.actPlace}'>
<input type="hidden" id="postAdres" name="postAdres" value='${vo.postAdres}'>
</c:forEach>
<input type=submit id="request_btn" value="봉사 신청">
</form>
</td></tr>

<%
}else{ //center mypage에서 조회할때 사용
%>
<tr><td  colspan="2">
<form action="/volunteer134/requestVolunWork" method="post">
<c:forEach items="${list}" var="vo">
<input type="hidden" id="progrmRegistNo" name="progrmRegistNo" value='${vo.progrmRegistNo}'>
<input type="hidden" id="actPlace" name="actPlace" value='${vo.actPlace}'>
<input type="hidden" id="postAdres" name="postAdres" value='${vo.postAdres}'>
</c:forEach>
<input type=submit id="request_btn" value="봉사 신청">
</form>
</td></tr>
<%} %>

</c:forEach>
</table>
</div>


</body>

</html>