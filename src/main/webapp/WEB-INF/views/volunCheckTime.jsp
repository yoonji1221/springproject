<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<style type="text/css">
table{
margin : auto;
border: 2px solid pink;
border-collapse: collapse;
}
td, th{
text-align:center;
border: 1px solid gray;
padding: 10px;
}
</style>
</head>
<body>

<h3> 봉사 시간 확인하기 </h3>

<div style="position:fixed; top:70px; left:250px;">
회원 번호 : ${vid}
<table>
<tr><td  colspan="2">누적 봉사 시간</td> <td  colspan="3"></td></tr>
<tr><th>기관 이름</th> <th>봉사 제목</th> <th>방문 날짜</th> <th>실제 봉사 시간</th> <th>리뷰 작성</th></tr>
<tr><td ></td> <td ></td> <td ></td> <td ></td> <td ></td> </tr>
</table>
</div>

</body>
</html>