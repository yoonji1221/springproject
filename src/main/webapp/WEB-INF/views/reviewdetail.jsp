<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <% String path = request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
<%-- 

$(document).ready(function(){
    $("#btnDelete").click(function(){
        if(confirm("삭제하시겠습니까?")){
            document.form1.action = "<%=path %>/reviewdelete";
            document.form1.submit();
        }
    });
    
    $("#btnUpdete").click(function(){
        var title = $("#title").val();
        var contents = $("#contents").val();

        if(title == ""){
            alert("제목을 입력하세요");
            document.form1.title.focus();
            return;
        }
        if(contents == ""){
            alert("내용을 입력하세요");
            document.form1.contents.focus();
            return;
        }
        document.form1.action="<%=path %>/reviewupdate"
        // 폼에 입력한 데이터를 서버로 전송
        document.form1.submit();
    });
}); --%>
</script>

</head>
<body>

<%-- <c:forEach items="${list2 }" var="vo">

 <form name="form1" method="post">
    <div>
        제목	<input name="title" id="title" size="80" value="${vo.title}" placeholder="제목을 입력해주세요">
    </div>
    <div>
        내용	<textarea name="contents" id="contents" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.contents}</textarea>
    </div>
    
    <div style="width:650px; text-align: center;">
   		<input type="hidden" name="mid" value ="${vo.mid}"> 
        <button type="button" id="btnUpdete">수정</button>
        <button type="button" id="btnDelete">삭제</button>
    </div>
</form>  

</c:forEach> --%>


<!-- 원래꺼 -->
<h1>상세리뷰보기</h1>
<c:forEach items="${list2 }" var="vo">

<h5>제목: ${vo.title}</h5> 
 <h5>조회수: ${vo.viewcount}</h5> 
 <h5>작성 시간: ${vo.time}</h5> 
 <h5 style="background-color: pink">${vo.contents}</h5>
 
</c:forEach>

<%-- <form action="<%=path %>/reviewwrite" method="get">
<input type="submit" value="리뷰작성">
</form>
<br>

<form action="<%=path %>/reviewupdate" method="get">
<input type="submit" value="수정">
</form>
<br>

<form action="<%=path %>/reviewdelete?seq=${vo.mid}" method="post">
<input type="submit" value="삭제">
</form>  --%>



</body>
</html>