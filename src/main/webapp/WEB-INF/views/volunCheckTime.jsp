<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String Path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
<body>

 <c:set var="vid" value="${vid}" />
 <%
      int vid = Integer.parseInt(pageContext.getAttribute("vid").toString()) ;
 %>
================================================== -->
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Volunteer <strong>Check My Info</strong></h3>
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

       <!-- ****************************************************************** -->  
         <!--  -->
          <div class="container-fluid">  <!-- 젤큰 div -->
             <div class="row-fluid"> <!-- 젤큰거 아래  div -->
                <div class="span2">     <!--Sidebar content-->  
                 <jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
                 </div>  <!--Sidebar content--> 
                 
                 <div class="span10">   <!--Body content--> 
                 
      
      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">봉사 시간 확인 및 리뷰 작성</h5>
            <ul>
            <li>
            134자원봉사자의 신청 완료한 봉사 정보를 확인하는 곳입니다.
            </li>
            <li>
            봉사 기관에서 입력한 실제 봉사 시간 정보를 확인할 수 있습니다.
         </li>
         <li>
            봉사 시간 관련 문의는 봉사 기관에 직접 부탁드립니다.
            </li>
            <li>
           봉사 완료한 봉사에 대한 리뷰를 작성 할 수 있습니다.
         </li>
         <li>
            
         </li>
         </ul>
         
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
                 
         
          <!-- Responsive design
        ================================================== -->
  <section id="responsive" class="doc">
<table class="table table-bordered table-striped">
<thead>
<tr><th style="font-size:23px;">${dbid}님의 누적 봉사 시간</th> <th  colspan="4" style="font-size:23px;">${sumTime } 시간</th></tr>
<tr><th>기관 이름</th> <th>봉사 제목</th> <th>방문 날짜</th> <th>실제 봉사 시간</th> <th>현황</th></tr>
</thead>
<tbody>
<c:forEach items="${list }" var="check">

         <c:set var="progrmBgnde" value="${check.progrmBgnde}"/>
         <%
         String progrmBgnde = (String)pageContext.getAttribute("progrmBgnde");
         StringBuffer sb = new StringBuffer(progrmBgnde);
         sb.insert(4, "년 ");
         sb.insert(8, "월 ");
         sb.append("일");
         String result_progrmBgnde = sb.toString();
         %> 
         
         
<tr>
<td >${check.mnnstNm } </td>
<td >${check.progrmSj} </td>
<td ><%=result_progrmBgnde %> </td>
<td >${check.realtime} 시간</td>
 <c:choose>
  <c:when test ="${check.progrmBgnde lt today}" > <%--0216 <= 0217--%>
   <td style="color:green">봉사  완료</td>
  </c:when>
  <c:otherwise>
   <td style="color:red">봉사 대기</td> <%--0218 > 0217--%>
  </c:otherwise>
 </c:choose> 
</tr>
</c:forEach>
</tbody>
</table>

</section>
        </div>
      </div>

  </section>
  
  <section id="blank" class="doc">
  </section>


            
            <!--Body content-->
          </div>
   </div> 
</div>

  



   </body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>