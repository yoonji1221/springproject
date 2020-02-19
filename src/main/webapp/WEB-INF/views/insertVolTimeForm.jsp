<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
 
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">


<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
  
</head>

<body>


 
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Center <strong>Mypage</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Scaffolding</li>
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
           <jsp:include page="/WEB-INF/views/centerLeftMenu.jsp"></jsp:include>
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            
            
      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">봉사활동 시간 입력</h5>
            <ul>
            <li>
            134자원봉사 센터업무를 위한 곳입니다.
            </li>
         <li>
            134봉사자들을 위해 봉사시간실적을 기입해 주세요.
            </li>
         <li>
            봉사활동 실적은 시간 단위로 기록되므로, 시간단위로 입력하셔야 합니다.
         </li>
         <li>
            입력하신 봉사활동 실적은 해당 봉사자들에게만 연람가능합니다.
         </li>
         </ul>
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         
          <!-- Responsive design
        ================================================== -->
          <section id="responsive" class="doc">

            <h5>활동 실적 미기입 봉사자</h5>
            <p>
                 해당 센터에 자원봉사를 신청한 신청자 목록:
            </p>
            <form action="/volunteer134/insertVolTimeForm" method="post">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>
                   봉사 제목
                  </th>
                  <th>
                   봉사 날짜
                  </th>
                  <th>
                   봉사자 ID
                  </th>
                  <th>
                   활동시간기입
                  </th>
                </tr>
              </thead>
              <c:forEach items="${timeList}" var="list">
              <tbody>
                <tr>
                  <td>
                   ${list.progrmSj}
                  </td>
                  <td>
                    ${list.progrmBgnde}
                  </td>
                  <td>
                    ${list.id}
                  </td>
                  <td>
                    <input type="text" name="realTime" id="realTime" style="width: 40px;">
                     <input type="submit" value="시간입력">
                  </td>
                </tr>
                <input type="hidden" id="hvid" name="hvid" class="form-control" value='${list.vid}'>
                </c:forEach>
              </tbody>
            </table>
            </form>

          
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
  
  


 

  <script src="assets/js/jquery.js"></script>
  <script src="assets/js/modernizr.js"></script>
  <script src="assets/js/jquery.easing.1.3.js"></script>
  <script src="assets/js/google-code-prettify/prettify.js"></script>
  <script src="assets/js/bootstrap.js"></script>
  <script src="assets/js/jquery.prettyPhoto.js"></script>
  <script src="assets/js/portfolio/jquery.quicksand.js"></script>
  <script src="assets/js/portfolio/setting.js"></script>
  <script src="assets/js/hover/jquery-hover-effect.js"></script>
  <script src="assets/js/jquery.flexslider.js"></script>
  <script src="assets/js/classie.js"></script>
  <script src="assets/js/cbpAnimatedHeader.min.js"></script>
  <script src="assets/js/jquery.refineslide.js"></script>
  <script src="assets/js/jquery.ui.totop.js"></script>

  <!-- Template Custom Javascript File -->
  <script src="assets/js/custom.js"></script>

</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>