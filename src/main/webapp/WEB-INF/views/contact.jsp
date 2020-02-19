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

<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</head>
<body>
 <!-- Subhead
================================================== -->

 
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Volunteer134<strong>Guide</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Contact</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
  <section id="maincontent">
    <div class="container">

      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">포털 이용가이드</h5>
            <h3 id="headings">134와 함께하는 행복한 나눔생활의 시작</h3>
              <ul>
            <li>
            134자원봉사 포털은 그동안 개별적으로 이루어지던 전국의 자원봉사 정보를 한곳에 모아 다양한 자원봉사 정보 검색은 물론 신청부터 실적 확인까지 원스톱으로 제공해 드리고 있습니다.
            </li>
            <li>
         134자원봉사 포털에 가입하면 전국단위 자원봉사 정보 및 조회 - 신청 - 실적 확인이 가능한 서비스를 제공합니다.
         </li>
         <li>
          자원봉사 더 이상 어렵지 않습니다.
         </li>
         <li>
         1365자원봉사포털을 통해 쉽고 편리하게 이용하세요.
         </li>
         <li>
         문의내용이 있다면 아래 입력창에 남겨주세요.
         </li>
         </ul>

            <div class="page-header">
              <h3></h3>
            </div>
         </section>
  
   <section id="maincontent">
    <div class="container">
      <div class="row">
        <div class="span4">
          <aside>
            <div class="widget">
              <h4>Get in touch with us</h4>
              <ul>
                <li><label><strong>Phone : </strong></label>
                  <p>
                    +82 10-8717-9078
                  </p>
                </li>
                <li><label><strong>Email : </strong></label>
                  <p>
                    pdy0830@naver.com
                  </p>
                </li>
                <li><label><strong>Office address : </strong></label>
                  <p>
                    Kitri Volunteer134, Inc.<br>
                    Guro Digital Complex Seoul, Korea
                  </p>
                </li>
              </ul>
            </div>
            <div class="widget">
              <h4>Social network</h4>
              <ul class="social-links">
                <li><a href="https://twitter.com/hashtag/1365%EC%9E%90%EC%9B%90%EB%B4%89%EC%82%AC" title="Twitter"><i class="icon-bg-light icon-twitter icon-circled icon-1x active"></i></a></li>
                <li><a href="https://www.facebook.com/kitri.bob/" title="Facebook"><i class="icon-bg-light icon-facebook icon-circled icon-1x active"></i></a></li>
                <li><a href="http://www.kitri.re.kr/kitri/main/main.web?" title="Google plus"><i class="icon-bg-light icon-google-plus icon-circled icon-1x active"></i></a></li>
                <li><a href="https://ko.wikipedia.org/wiki/%ED%95%9C%EA%B5%AD%EC%A0%95%EB%B3%B4%EA%B8%B0%EC%88%A0%EC%97%B0%EA%B5%AC%EC%9B%90" title="Linkedin"><i class="icon-bg-light icon-linkedin icon-circled icon-1x active"></i></a></li>
              
              </ul>
            </div>
          </aside>
        </div>
        <div class="span8">
          <div class="map-container">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2662.2355164109485!2d126.89567076772951!3d37.485519996428394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9e3ac6500f81%3A0x9c30e9fbc9189200!2z7ZWc6rWt7KCV67O06riw7Iig7Jew6rWs7JuQ!5e0!3m2!1sko!2skr!4v1582000362562!5m2!1sko!2skr" width="100%" height="380" frameborder="0" style="border:0" allowfullscreen=""></iframe>          <div class="spacer30">
          </div>
         <div class="spacer30">
         </div>
         
          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
          <form action="/volunteer134/insertContact" method="post" role="form" class="contactForm">
            <div class="row">
              <div class="span4 form-group">
                <input type="text" name="yourname" class="form-control" id="yourname" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validation"></div>
              </div>

              <div class="span4 form-group">
                <input type="email" class="form-control" name="youremail" id="youremail" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                <div class="validation"></div>
              </div>
              <div class="span8 form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validation"></div>
              </div>
              <div class="span8 form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validation"></div>
                <div class="text-center">
                  <input class="btn btn-color btn-rounded" type="submit" value="Send message">
                </div>
              </div>
            </div>
          </form>
        </div>
  
     </div>
    </div>
    </div>
    </section>
    </div>
    </div>
    </div>
  
  </section>
  
  <section id="blank" class="doc">
  </section>
  
   
  
</body>
  <!-- footer add -->
   <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>