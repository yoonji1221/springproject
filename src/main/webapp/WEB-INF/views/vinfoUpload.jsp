<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


 $(function(){  
    
     $("#preference").change(function(){
         var selected_large = $("#preference option:selected").val();
         console.log( selected_large);
         $.ajax({
            url : '/volunteer134/vinfolist/prefercheck?selected_large='+ selected_large,
            type : 'get',
            success : function(category_list) {
               $("#detailprefer").empty();
               for(var idx in category_list){
                  var data = category_list[idx]['medium']
                     var option = $("<option value='"+data+"'>"+data+"</option>");
                     $("#detailprefer").append(option);
               }
               }, error : function(e) {
                  console.log(e);
               }
            });
         }) 
 
   
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
          <h3>My Center <strong>봉사 정보 등록하기</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">MyCenter</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
<div class="container-fluid" style="margin-top: 100px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
      <div class="span2">
           <!--Sidebar content--> 
           <jsp:include page="/WEB-INF/views/centerLeftMenu.jsp"></jsp:include>
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            
            <section id="responsive" class="doc">
   <h1>봉사 정보 등록하기</h1>
   <form action="<%=path%>/vinfoupload" method="post">
   
   <table class="table">
   
   <tbody>
   
   

   <c:forEach items="${center }" var="vo">
   <input type="hidden" id="postAdres" name="postAdres" value='${vo.postAdres}'>
   <input type="hidden" id="cid" name="cid" value='${cid}'>
     <tr><td> 센터 이름:</td><td>${vo.mnnstNm}</td></tr>
     <tr><td> 센터 주소:</td><td>${vo.postAdres}</td></tr>
   </c:forEach>
   
   


 <tr><td> 봉사 제목:</td><td> <input placeholder="제목을 입력해주세요" type=text name="progrmSj"> </td></tr>
 <tr><td> 봉사 날짜:</td><td> <input placeholder="ex) 20200217" type=text name="progrmBgnde"> </td></tr>
 <tr><td> 봉사 시작 시간:</td><td> <input placeholder="ex) 15시" type=text name="actBeginTm"> </td></tr>
 <tr><td> 봉사 종료 시간:</td><td> <input placeholder="ex) 18시" type=text name="actEndTm"> </td></tr>
 <tr><td> 모집 시작:</td><td> <input placeholder="ex) 20200217" type=text name="noticeBgnde"> </td></tr>
 <tr><td> 모집 종료:</td><td> <input placeholder="ex) 20200217" type=text name="noticeEndde"> </td></tr>
 <tr><td> 모집 인원:</td><td> <input placeholder="ex) 5" type=text name="rcritNmpr">명 </td></tr>
 <tr><td> 봉사 분야:</td><td> 
<select name="preference" id="preference" >
<option value="" >선택해주세요.</option>
   <c:forEach items="${large}" var="largelist">
      <option value="${largelist.large}" name="largelist">${largelist.large}</option>
   </c:forEach> 
</select>

<select name="detailprefer" id="detailprefer">
</select>
        </td></tr>
       <tr><td> 봉사 장소: </td><td> <input placeholder="봉사 장소를 입력해주세요" type=text name="actPlace"> </td></tr>
       <tr><td> 상세 내용:</td><td> <input placeholder="상세 내용을 입력해주세요" type=text name="progrmCn"> </td></tr>
       <tr><td> <input type="submit" value="봉사정보 입력완료"></td></tr>


</tbody>
</table>


   </form>
   
   
</section>
            
            <!--Body content-->
          </div>
   </div> 
</div>


<!-- *************************** -->

<%-- 

   <h1>봉사 정보 등록하기</h1>
   <form action="<%=path%>/vinfoupload" method="post">

   <c:forEach items="${center }" var="vo">
   <input type="hidden" id="postAdres" name="postAdres" value='${vo.postAdres}'>
   <input type="hidden" id="cid" name="cid" value='${cid}'>
      센터 이름:    ${vo.mnnstNm}   <br> 
      센터 주소:    ${vo.postAdres}<br>
      
   </c:forEach>
 
      봉사 제목: <input type=text name="progrmSj"><br> 
      봉사 날짜: <input type=text name="progrmBgnde"><br>
      봉사 시작 시간: <input type=text name="actBeginTm"><br> 
      봉사 종료 시간: <input type=text name="actEndTm"><br> 
      모집 시작: <input type=text name="noticeBgnde"><br> 
      모집 종료: <input type=text name="noticeEndde"><br> 
      모집 인원: <input type=text name="rcritNmpr"><br> 
      봉사 분야 : <select name="preference" id="preference" >
<option value="" >선택해주세요.</option>
   <c:forEach items="${large}" var="largelist">
      <option value="${largelist.large}" name="largelist">${largelist.large}</option>
   </c:forEach> 
</select>
<select name="detailprefer" id="detailprefer">
</select>
      
      <br>
      <select name="sub" id="sub">
          <span id="mcheck">  <c:forEach items="${mlist }" var="vo">
               <option>${vo}</option>
            </c:forEach>
       </span>
      </select> <br> 
      
      
      봉사 장소: <input type=text name="actPlace"><br>
      상세 내용: <input type=text name="progrmCn"><br> 
      <input type="submit" value="봉사정보 입력완료">

   </form> --%>


</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>