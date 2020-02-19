=<%@ page language="java" contentType="text/html; charset=UTF-8"
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
  <!-- styles -->
 
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script>

$(function () {
   var postAdres = $('input#hpostAdres').val();
   var mnnstNm = $('input#hmnnstNm').val();
   var nanmmbyNmAdmn = $('input#hnanmmbyNmAdmn').val();
   var telno = $('input#htelno').val();
   
   
   $("#submit").on('click', function() {
      if ($("#postAdres").val() == "") {
         $("#postAdres").val(postAdres);
      }
      if ($("#mnnstNm").val() == "") {
         $("#mnnstNm").val(mnnstNm);
      }
      if ($("#nanmmbyNmAdmn").val() == "") {
         $("#nanmmbyNmAdmn").val(nanmmbyNmAdmn);
      }
      if ($("#telno").val() == "") {
         $("#telno").val(telno);
      }
      alert("마이페이지를 수정하였습니다.");
   })
   

});

function openZipSearch() {
   new daum.Postcode({
      oncomplete: function(data) {
         $('[name=postAdres]').val(data.address);
      }
   }).open();
}

</script>
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
            <li class="active">Center</li>
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
            
             <section id="maincontent">
    <div class="container">

      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">봉사기관 정보 수정</h5>
            <ul>
            <li>
            134자원봉사 센터의 기본 정보를 수정하기 위한 곳입니다.
            </li>
            <li>
            입력하신 봉사기관 정보는 봉사자들에게 제공됩니다.
         </li>
         <li>
            134봉사자들을 위해 정확한 정보를 기입해 주세요.
            </li>
            <li>
            center ID는 로그인 아이디로 설정되오니, 변경불가능합니다.
         </li>
         <li>
            담당자 e-mail은 로그인 비밀번호로 설정되오니, 유출에 주의하세요.
         </li>
         </ul>
         
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         
          <!-- Responsive design
        ================================================== -->
          <section id="responsive" class="doc">

            <h5>기본 정보</h5>
            <p>
                 <i class="icon-ok"></i><strong>필수 입력 사항입니다.</strong>
            </p>

         <form action="/volunteer134/centerMypageForm" method="post">
            <table class="table">
<!--               <thead>
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
              </thead> -->
             <c:forEach items="${centerMypageList}" var="list">
              <tbody>
                <tr>
                  <td>
                      <i class="icon-ok"></i><strong>기관 아이디</strong>
                  </td>
                  <td>
                    <strong>${list.cid }</strong>
                  </td>
                 </tr>
                 
                 <tr>
                  <td>
                      <i class="icon-ok"></i><strong>기관 이름</strong>
                  </td>
                  <td>
                    <input type="text" name="mnnstNm" id="mnnstNm" placeholder='${list.mnnstNm}'>
                  </td>
                </tr>
                
                 <tr>
                   <td>
                      <i class="icon-ok"></i> <strong>기관 주소</strong>
                  </td>
                  <td>
                   <input type="text" id="postAdres" name="postAdres" placeholder='${list.postAdres}' style="width:300px;" />
               <button type="button" onclick="openZipSearch()">주소찾기</button>
                  </td>
                </tr>
                
                 <tr>
                 <td>
                      <strong>담당자 이름</strong>
            </td>
                <td>
                   <input type="text" name="nanmmbyNmAdmn" id="nanmmbyNmAdmn" placeholder='${list.nanmmbyNmAdmn}'>
            </td>
                </tr>
                
                 <tr>
                <td>
                   <i class="icon-ok"></i><strong>담당자 이메일 (비밀번호)</strong>
            </td>
                <td>
                   <strong>${list.email}</strong>
            </td>
                </tr>
                
                 <tr>
                 <td>
                   <strong>담당자 전화번호</strong>
            </td>
                <td>
                   <input type="text" name="telno" id="telno" placeholder='${list.telno}'>
            </td>
                </tr>
                
                <input type="hidden" id="hmnnstNm" class="form-control" value='${list.mnnstNm}'>
            <input type="hidden" id="hnanmmbyNmAdmn" class="form-control" value='${list.nanmmbyNmAdmn}'>
                <input type="hidden" id="htelno" class="form-control" value='${list.telno}'>
                <input type="hidden" id="hpostAdres" class="form-control" value='${list.postAdres}'>

                </c:forEach>
              </tbody>
            </table>
            <input type="submit" value="정보 수정" id="submit">
            
            </form>

          
          </section>
        </div>
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
<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>