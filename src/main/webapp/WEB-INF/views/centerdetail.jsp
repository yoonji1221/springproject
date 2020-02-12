<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>센터 정보 자세히보기</h1>

<c:forEach items="${list }" var="vo">
센터주소: ${vo.postAdres}<br>
센터이름: ${vo.mnnstNm}<br>
이메일: ${vo.email}<br>
담당자 이름: ${vo.nanmmbyNmAdmn}<br>
전화번호: ${vo.telno}
</c:forEach>

</body>
</html>