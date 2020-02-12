<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>

</head>
<body>
<h1>리뷰 작성</h1>

<%-- 	<form action="<%=path%>/reviewwrite" method="post">
		제목: <input type=text name="title"><br> 
		내용: <input type=text name="contents"><br> 
			<input type="submit" value="입력완료">
	</form> --%>
		

<form name="form1" method="post" action="<%=path %>/reviewwrite">
    <div>
        제목
        <input name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>
        내용
        <textarea name="contents" id="contents" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <div style="width:650px; text-align: center;">
    <input type="submit" value="작성완료">
    

        <!-- <button type="button" id="btnSave">확인</button>
        <button type="reset">취소</button> -->
    </div>
</form>  

</body>
</html>