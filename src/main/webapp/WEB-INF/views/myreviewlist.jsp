<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path = request.getContextPath();%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{border : 2px solid gray;}
td, th{border : 2px solid pink;}
</style> 

</head>
<body>
<h1>후기 게시판</h1>
	<table>
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
	<c:forEach items="${list }" var="vo">
	<tr>
	 <td>${vo.rid}</td>
	 <td><a href="<%=path %>/reviewdetailmp?rid=${vo.rid}">${vo.title}</a></td>
	 <td>${vo.name}</td> 
	 <td>${vo.viewcount}</td>
	</tr>
	</c:forEach>
	</table>



</body>
</html>