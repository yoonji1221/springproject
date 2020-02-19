<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

    $("#btnWrite").click(function(){
        if(confirm("작성하시겠습니까?")){
            document.form1.action ="<%=path %>/reviewwrite";
            document.form1.submit();
        }
    });
});
</script>

<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

</head>
<body>

<div class="container-fluid" style="margin-top: 200px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
      <div class="span2">
           <!--Sidebar content--> 
           <jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            
            <h1>리뷰 작성</h1>

<form name="form1" method="post"> <%-- action="<%=path %>/reviewwrite"> --%>
    <div>
        제목
        <input style="width: 500px;"
        name="title" id="title" size="80" placeholder="제목을 입력해주세요">
    </div>
    <div>
        내용
        <textarea style="background-color: rgb(229, 229, 229); margin: 0px 0px 10px; width: 492px; height: 132px;"
        name="contents" id="contents" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <div style="width:650px; text-align: center;">
   <!--  <input type="submit" value="작성완료"> -->
    <button style="margin-left: 430px;"type="button" id="btnWrite" class="btn">작성완료</button>
    </div>
</form>  
            
            <!--Body content-->
          </div>
   </div> 
</div>




</body>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>