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
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">


 


<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
    var mid = $('input#hiddenmid').val();
    $("#btnDelete").click(function(){
        if(confirm("삭제하시겠습니까?")){
            document.form1.action = "<%=path %>/reviewdelete?mid=" +mid;
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
});
</script>

<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


</head>
<body>

<section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3><strong>리뷰</strong> 수정하기 </h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Mypage</li>
          </ul>
        </div>
      </div>
    </div>

  </section>



<div class="container-fluid" style="margin-top: 100px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
      <div class="span2">
           <!--Sidebar content--> 
           <jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            
            
<c:forEach items="${list2 }" var="vo">

 <form name="form1" method="post">
 <fieldset>
 <legend>봉사 후기 수정</legend>
    <div>
        제목   <input style="width: 500px;" name="title" id="title" size="50" value="${vo.title}" placeholder="제목을 입력해주세요">
    </div><br>
    <div>
        내용  
         <textarea style="background-color: rgb(229, 229, 229); margin: 0px 0px 10px; width: 492px; height: 132px;"
          name="contents" id="contents" rows="4" cols="80" placeholder="내용을 입력해주세요">${vo.contents}</textarea>
    </div>
    <br>
    <br>
    <div><!--  style="width:650px; text-align: center;"> -->
         <input type="hidden" id="hiddenmid" name="mid" value ="${vo.mid}"> 
       
         <button style="margin-left: 430px;" type="button" id="btnUpdete" class="btn btn-primary">수정</button>
         <button type="button" id="btnDelete" class="btn">삭제</button>
    </div>
        </fieldset>
</form>  

</c:forEach>
            
            <!--Body content-->
          </div>
   </div> 
</div>


  <!-- Template Custom Javascript File -->
  <script src="resources/Plato/assets/js/custom.js"></script>

</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>