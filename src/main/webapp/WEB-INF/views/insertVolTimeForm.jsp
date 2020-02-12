<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
margin : auto;
border: 2px solid gray;
border-collapse: collapse;
}

th, td, h3{
text-align:center;
border: 1px solid gray;
padding: 10px;
}
</style>

</head>
<body>

<h3>봉사활동시간 입력</h3>

<table>
<tr><th>봉사 제목</th> <th>봉사 날짜</th> <th>봉사자id</th> <th>활동시간</th> </tr>
${manageList}
<c:forEach items="${manageList}" var="list">
<tr><td>${list.}</td> <td>${vo.progrmSj}</td> <td>${vo.actPlace}</td> <td>${vo.progrmBgnde}</td> <td>${vo.appTotal} / ${vo.rcritNmpr}명</td>
<td><button onClick="window.open('/volunteer134/volunteerMypage/${vid}/ApplicationList/Cancle?ProgrmRegistNo=${vo.progrmRegistNo}')">봉사 취소</button></td></tr>
</c:forEach>

</table>

</body>
</html>