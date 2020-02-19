<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
 

<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb31651ef6e0c7578e0ae1462b12a587&libraries=services,clusterer,drawing"></script>
<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</head>


<script type="text/javascript">
$(function(){
   $("#request_btn").on('click', function(){
      alert("봉사 신청하시겠습니까?");
})// btn end 

});

//센터 정보 보기
$(document).ready(function(){
    var cid = $('input#hiddencid').val();
   $("#btnDetail").click(function(){
       document.form1.action="/volunteer134/centerdetail?cid="+cid;
       document.form1.submit();
      });
   
   });
$(document).ready(function(){
$("#btnRegist").click(function(){
//    document.form1.action="/volunteer134/centerdetail?cid="+cid;
    document.form2.submit();
   });
});
</script>


<!-- Subhead
================================================== -->

 
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Voluntary Service<strong>Information</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">VoluntaryService</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
  <section id="maincontent">
  <div class="container-fluid">  <!-- 젤큰 div -->
             <div class="row-fluid"> <!-- 젤큰거 아래  div -->
                <div class="span2">     <!--Sidebar content-->  
                 <jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
                 </div>  <!--Sidebar content--> 
                 
                 <div class="span10">   <!--Body content--> 
  
  
  
    <div class="container">

      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">기업·단체 봉사조회</h5>
              <ul>
            <li>
            해당 봉사기관에서 제공하는 봉사활동에 대한 정보입니다.
            </li>
            <li>
            상세 내용과 다를 시 134자원봉사포털 고객센터로 문의바랍니다.
            </li>
            </ul>
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         <!-- Responsive design
        ================================================== -->
          <section id="responsive" class="doc">
          <c:forEach items="${list }" var="vo">
          <c:set var="progrmBgnde" value="${vo.progrmBgnde}"/>
         <c:set var="noticeBgnde" value="${vo.noticeBgnde}"/>
         <c:set var="noticeEndde" value="${vo.noticeEndde}"/>
		<%
         String progrmBgnde = (String)pageContext.getAttribute("progrmBgnde");
         StringBuffer sb = new StringBuffer(progrmBgnde);
         sb.insert(4, "년 ");
         sb.insert(8, "월 ");
         sb.append("일");
         String result_progrmBgnde = sb.toString();
         
         String noticeBgnde = (String)pageContext.getAttribute("noticeBgnde");
         StringBuffer sb2 = new StringBuffer(noticeBgnde);
         sb2.insert(4, "년 ");
         sb2.insert(8, "월 ");
         sb2.append("일");
         String result_noticeBgnde = sb2.toString();
         
         String noticeEndde = (String)pageContext.getAttribute("noticeEndde");
         StringBuffer sb3 = new StringBuffer(noticeEndde);
         sb3.insert(4, "년 ");
         sb3.insert(8, "월 ");
         sb3.append("일");
         String result_noticeEndde = sb3.toString();
         %>
         
         	<span><strong>${vo.progrmSj}</strong></span>
         	
         	<table class="table">
              <tbody>
              <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>봉사날짜</strong>
                  </th>
                  <td>
                    <%=result_progrmBgnde %>
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>봉사시간</strong>
                  </th>
                  <td>
                    ${vo.actBeginTm}시 ~ ${vo.actEndTm}시
                  </td>
               </tr>
               
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>모집기간</strong>
                  </th>
                  <td>
                    <%=result_noticeBgnde %> ~ <%=result_noticeEndde %>
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>모집인원</strong>
                  </th>
                  <td>
                    ${vo.rcritNmpr} 명/일
                  </td>
               </tr>
               
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>봉사분야</strong>
                  </th>
                  <td>
                    ${vo.srvcClCode}
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>신청인원수</strong>
                  </th>
                  <td>
                    ${vo.appTotal} 명
                  </td>
               </tr>
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>모집기관</strong>
                  </th>
                  <td>
                    <form name="form1" method="post">
					${mnnstNm}
					 <button style="margin-left: 10px;" 
					     type="button" id="btnDetail" 
					     class="btn btn-primary"><i class="icon-search"></i>상세보기</button>
					</form>
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>모집기관장소</strong>
                  </th>
                  <td>
                    ${vo.postAdres}
                  </td>
               </tr>
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>봉사장소</strong>
                  </th>
                  <td>
                    ${vo.actPlace}
                  </td>
                  <th>
                  </th>
                  <td>
                  </td>
               </tr>
               <tr>
                  <td colspan = 4>
                  ${vo.progrmCn}
                  </td>
               </tr>
               <tr>
                  <th> 
                  </th>
                  <td> 
                  </td>
                  <th>
                  </th>
                  <td>
                  </td>
               </tr>
				<input type="hidden" id="hiddencid" name="cid" value ="${vo.cid}"> 
				</tbody>
               </table>
         </c:forEach>
         </section>
        
      </div>
      </div>
    </div>
  </section>

            
            <!--Body content-->
          </div>
   </div> 
</div>


  <!-- Template Custom Javascript File -->
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/custom.js"></script>

<!-- footer add -->
</body>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>