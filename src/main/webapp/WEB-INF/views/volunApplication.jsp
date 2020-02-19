<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">   
$(document).on("click","#btn_confirm",function(){
   var check = confirm("신청한 봉사를 취소하시겠습니까?");
     var ProgrmRegistNo = $(this).attr('value');
     if(check) {
        location.replace('/volunteer134/volunteerMypage/'+${vid}+'/ApplicationList/Cancle?ProgrmRegistNo=' + ProgrmRegistNo); 
        }
     else{ }
});
</script>
</head>
<body>

 <c:set var="vid" value="${vid}" />
 <%
      int vid = Integer.parseInt(pageContext.getAttribute("vid").toString()) ;
 %>
<!-- Subhead
================================================== -->
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Volunteer <strong>My Application</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Lists</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
  
    <section id="maincontent">




<div class="container-fluid" style="margin-top: 100px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
      <div class="span2">
           <!--Sidebar content--> 
          
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            
            
      <div class="row">

        <div class="span12">

          <section id="global">
          
          <h5 id="headings">신청 내역 확인</h5>
            <ul>
            <li>
            134자원봉사자의 봉사 신청 내역을 확인하는 곳입니다.
            </li>
         <li>
            봉사를 원하지 않는 항목에 대해서는 취소가 가능합니다.
            </li>
         <li>
            봉사 취소를 원할 시, 취소 버튼을 누르면 신청한 항목에 대해서 취소가 가능합니다.
         </li>
         </ul>
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         
          <!-- Responsive design
        ================================================== -->
 <section id="responsive" class="doc">
<h5>봉사 신청 현황</h5>

<table class="table table-bordered table-striped">
<tr><th>봉사 번호</th> <th>봉사 제목</th> <th>봉사 장소</th> <th>봉사 날짜</th> <th>신청현황</th> <th></th> </tr>
<c:forEach items="${list}" var="vo">

         <c:set var="progrmBgnde" value="${vo.progrmBgnde}"/>
         <%
         String progrmBgnde = (String)pageContext.getAttribute("progrmBgnde");
         StringBuffer sb = new StringBuffer(progrmBgnde);
         sb.insert(4, "년 ");
         sb.insert(8, "월 ");
         sb.append("일");
         String result_progrmBgnde = sb.toString();
         %>

<tr><td>${vo.progrmRegistNo}</td> <td>${vo.progrmSj}</td> <td>${vo.actPlace}</td> <td><%=result_progrmBgnde %></td> <td>${vo.appTotal} / ${vo.rcritNmpr}명</td>
 <c:choose>
  <c:when test ="${vo.progrmBgnde lt today}" >
   <td nowrap style="color:red">봉사 완료</td>
  </c:when>
 <c:otherwise>
    <td>
   <button id="btn_confirm" value="${vo.progrmRegistNo}" >취소</button>
   </td>
 </c:otherwise>
</c:choose>
</tr>
</c:forEach>
</table>

</section>

</div>
</div>
  </section> <!-- maincontent -->

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
   </body>
</html>