<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자 로그인</h1>
<form action="<%=path %>/selectlogin/adminlogin" method="post">
아이디  <input type="text" name="adminid"><br>
비밀번호  <input type="password" name="adminpw" ><br>
<input type="submit" value="로그인" >
</form>
</body>
</html>