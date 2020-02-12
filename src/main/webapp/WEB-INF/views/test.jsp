<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>봉사자 마이페이지</h3>


<c:forEach items="${list}" var="vo">
${vo.progrmBgnde} : ${vo.progrmRegistNo} : ${vo.progrmSj}<br> 
</c:forEach> 



</body>
</html>