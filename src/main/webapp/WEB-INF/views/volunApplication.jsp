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
<style>
table{
margin : auto;
border: 2px solid gray;
border-collapse: collapse;
}

th, td{
text-align:center;
border: 1px solid gray;
padding: 10px;
}
</style>

</head>
<body>

${vid }
<h3>신청현황페이지</h3>
<div style="position:fixed; top:70px; left:250px;">

<table>
<tr><th>봉사 번호</th> <th>봉사 제목</th> <th>봉사 장소</th> <th>봉사 날짜</th> <th>신청현황</th> <th></th> </tr>
<c:forEach items="${list}" var="vo">
<tr><td>${vo.progrmRegistNo}</td> <td>${vo.progrmSj}</td> <td>${vo.actPlace}</td> <td>${vo.progrmBgnde}</td> <td>${vo.appTotal} / ${vo.rcritNmpr}명</td>
<td><button onClick="window.open('/volunteer134/volunteerMypage/${vid}/ApplicationList/Cancle?ProgrmRegistNo=${vo.progrmRegistNo}')">봉사 취소</button></td>
</tr>
</c:forEach>
</table>

</div>
</body>
</html>