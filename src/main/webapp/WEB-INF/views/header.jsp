<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <% String Path = request.getContextPath();%>
       
<!DOCTYPE html>
<html lang="en">
<head> 
  <meta charset="utf-8">
  <title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
  <!-- styles -->
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/headerfix.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/bootstrap.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/bootstrap-responsive.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/docs.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/prettyPhoto.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/flexslider.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/refineslide.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/font-awesome.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/animate.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/resources/Plato/assets/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/Plato/assets/color/default.css" rel="stylesheet">

  <!-- fav and touch icons -->
  <link rel="shortcut icon" href="resources/Plato/assets/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/resources/Plato/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/Plato/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/resources/Plato/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/Plato/assets/ico/apple-touch-icon-57-precomposed.png">




</head>

<body>

  <header>
    <!-- Navbar
    ================================================== -->
    <div class="cbp-af-header" 
    style="padding-top: 0px;height: 120px;padding-bottom: 0px;">
      <div class=" cbp-af-inner">
        <div class="container">
          <div class="row">

            <div class="span4">
              <!-- logo -->
              <div class="logo">
               <a href="/volunteer134/home" >
               <!-- image logo -->
                <img src="${pageContext.request.contextPath}/resources/Plato/assets/img/bong4gray.PNG" 
                 style="width: 210px; margin-left: 50px;" alt="" /> 
          
                 </a>
                 <!-- image button try -->
                 <!-- <button type="button" id="logoGray">
                 <img src="resources/Plato/assets/img/logoGray.png"
                  style="width: 210px; margin-left: 100px;" alt=""></button> -->
                 
                 
     <!--         <form action="">
            <input type="button" class="logo-button">             
             </form> -->
             
              </div>
              <!-- end logo -->
            </div>

            <div class="span7">
              <!-- top menu -->
              <div class="navbar">
                <div class="navbar-inner">
    <nav>
                    <ul class="nav topnav">
                      <li class="dropdown active">
                        <a href="/volunteer134/home">Home</a>
                      </li>
                      <li class="dropdown">
                       <a href="/volunteer134/aboutvolunteer">AboutVolunteer134</a>
                      
                      </li>
                      <li class="dropdown">
                        <a href="/volunteer134/vinfolist">알아보기</a>
                        <ul class="dropdown-menu">
                          <li><a href="/volunteer134/vinfolist">전체 봉사 조회</a></li>
                           <li><a href="/volunteer134/vinfoMap">전체 기관 보기</a></li>
                        </ul>
                      </li>
                      <li>
                       <a href="/volunteer134/contact" style="padding-right: 50px;">Contact</a>
                      
                      </li>
<% if(session.getAttribute("dbid")==null && session.getAttribute("dbadm")==null){
%>
                     <!--  <li class="dropdown">
                        <a href="#">로그인</a>
                        <ul class="dropdown-menu">
                          <li><a href="/volunteer134/selectlogin/volunlogin">회원 로그인</a></li>
                          <li><a href="/volunteer134/selectlogin/centerlogin">센터 로그인</a></li>
                          <li><a href="/volunteer134/selectlogin/adminlogin">관리자 로그인</a></li>
                        </ul>
                      </li> -->
                       <li class="dropdown">
                        <a href="/volunteer134/selectlogin">로그인</a>
                      </li>
                      <li>
                        <a href="/volunteer134/volunjoin">회원가입</a>
                      </li>
<%
} else if (session.getAttribute("dbid")!=null){
%>    
<li style="color:white;margin-top: 7px;"> <%=session.getAttribute("dbid")%>님 환영합니다!&nbsp;</li>  <br>                
<input class="btn btn-default" type='button' value=' 로그아웃 ' onclick='logout()' style=" padding-bottom: 2px;
    padding-top: 2px;
    margin-top: 5px;"
>
<input class="btn btn-default" type='button' value='마이페이지' onclick="location.href='/volunteer134/volunteerMypage/<%=session.getAttribute("volid")%>'"  style=" padding-bottom: 2px;
    padding-top: 2px;
    margin-top: 6px;">
<%} else if(session.getAttribute("dbadm")!=null){
%>
<li style="color: white;margin-left: 400px;bottom: 40px;">담당자 <%=session.getAttribute("dbadm")%>님 환영합니다!&nbsp;</li>
<input class="btn btn-default" type='button' value='로그아웃' onclick='logout()' style="margin-top: 30px;">
<input class="btn btn-default" type='button' value='센터 정보 보기' onclick="location.href='/volunteer134/centerMypageForm'" style="margin-top: 30px;">
  </div>
<%
} else {
%>    
<li style="color:white;">관리자님 환영합니다</li>
<input class="btn btn-default" type='button' value='로그아웃' onclick='logout()' style="margin-top: 15px;">
<%} 
%>                   
                   

                </div>
                
              </div>
              <!-- end menu -->
            </div>

          </div>
        </div>
      </div>
    
  </header>



  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/modernizr.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/google-code-prettify/prettify.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/jquery.prettyPhoto.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/portfolio/jquery.quicksand.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/portfolio/setting.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/hover/jquery-hover-effect.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/jquery.flexslider.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/classie.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/cbpAnimatedHeader.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/jquery.refineslide.js"></script>
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/jquery.ui.totop.js"></script>

  <!-- Template Custom Javascript File -->
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/custom.js"></script>


</body>
<script>

function logout() {
   var logoutFlag = confirm("로그아웃 하시겠습니까?");
   if(logoutFlag) {
      location.href="<%=Path%>/logout";
   }
};
</script>
</html>