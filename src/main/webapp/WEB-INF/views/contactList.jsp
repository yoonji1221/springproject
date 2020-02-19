<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script>
</script>
</head>
<body style="margin-top: 50px; margin-left: 50px; margin-right: 50px;
   background-color: #f5f5f5;">

<h1>Contact</h1>

<div class="table-responsive">
<table class="table table-striped"><tr><th>이름</th><th>메일</th><th>문의제목</th><th>문의내용</th></tr>
<c:forEach items="${contactList }" var="list"> 
<h3>
<tr><td>${list.yourname }</td>
<td>${list.youremail }</td>
<td>${list.subject }</td>
<td> ${list.message }</tr>
</h3>
</c:forEach>
</table></div>
<input type="button" value="회원목록보기" onclick="location.href='/volunteer134/adminuserlist/user'">
<input type="button" value="HOME" onclick="location.href='/volunteer134/home'">
</body>
</html>