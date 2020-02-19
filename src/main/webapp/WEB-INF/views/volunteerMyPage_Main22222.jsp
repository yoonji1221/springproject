<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">


<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script>
$(function(){

   $('#userPwChk').keyup(function() {

      if ($('#userPw').val() != $('#userPwChk').val()) {
         $('#chkNotice').text('비밀번호 일치하지 않음');
         $('#chkNotice').css('color', 'red');
         $("#chkNotice").css("font-size", "13px");
         $('#join').prop('disabled', true);

      }else{
         $('#chkNotice').text('비밀번호 일치함');
         $('#chkNotice').css('color', 'blue');
         $("#chkNotice").css("font-size", "13px");
         $('#join').prop('disabled', false);
      }
   });
   
   $("#lar1").change(function(){
          var selected_large = $("#lar1 option:selected").val();
          console.log(selected_large+"1");
          $.ajax({
             url : '/volunteer134/volunteerMypage/'+${vid}+'/precheck?selected_large='+ selected_large,
             type : 'get',
             success : function(category_list) {
                $("#med1").empty();
                for(var idx in category_list){
                   var data = category_list[idx]['medium']
                      var option = $("<option value='"+data+"'>"+data+"</option>");
                      $("#med1").append(option);
                }
                }, error : function(e) {
                   console.log(e);
                }
             });
          })
        $("#lar2").change(function(){
          var selected_large = $("#lar2 option:selected").val();
          console.log(selected_large);
          $.ajax({
             url : '/volunteer134/volunteerMypage/'+${vid}+'/precheck?selected_large='+ selected_large,
             type : 'get',
             success : function(category_list) {
                $("#med2").empty();
                for(var idx in category_list){
                   var data = category_list[idx]['medium']
                      var option = $("<option value='"+data+"'>"+data+"</option>");
                      $("#med2").append(option);
                }
                }, error : function(e) {
                   console.log(e);
                }
             });
          })
          
          $("#lar3").change(function(){
          var selected_large = $("#lar3 option:selected").val();
          console.log(selected_large);
          $.ajax({
             url : '/volunteer134/volunteerMypage/'+${vid}+'/precheck?selected_large='+ selected_large,
             type : 'get',
             success : function(category_list) {
                $("#med3").empty();
                for(var idx in category_list){
                   var data = category_list[idx]['medium']
                      var option = $("<option value='"+data+"'>"+data+"</option>");
                      $("#med3").append(option);
                }
                }, error : function(e) {
                   console.log(e);
                }
             });
          })
          
       
   var pw = $('input#userPw').val();
   var phone = $('input#hiddenPhone').val();
   var address = $('input#hiddenAddress').val();
   var mail = $('input#hiddenMail').val();
         $("#submit").on('click', function(){
            if($("#NewPw").val() == "" ){
                  $("#NewPw").val(pw); 
            }
            if($("#phone").val() == "" ){
                 $("#phone").val(phone); 
            }
            if($("#address").val() == "" ){
                 $("#address").val(address); 
            }
            if($("#mail").val() == "" ){
                 $("#mail").val(mail); 
            }
         })

});

function openZipSearch() {
   new daum.Postcode({
      oncomplete: function(data) {
         $('[name=address]').val(data.address);
      }
   }).open();
}

</script>
</head>
<body>





  <!-- Subhead
================================================== -->
<section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Volunteer <strong>Mypage</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Volunteer</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
  
  
         
       <!-- ****************************************************************** -->  
         <!--  -->
          <div class="container-fluid">  <!-- 젤큰 div -->
             <div class="row-fluid"> <!-- 젤큰거 아래  div -->
                <div class="span2">     <!--Sidebar content-->  
                 <jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
                 </div>  <!--Sidebar content--> 
                 
                 <div class="span10">   <!--Body content--> 
                 
                 
                 
  <section id="maincontent">
    <div class="container">

      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">봉사자 정보 수정</h5>
            <ul>
            <li>
            134자원봉사자의 기본 정보를 수정하기 위한 곳입니다.
            </li>
            <li>
            입력하신 정보의 일부는 정보제공에 활용됩니다.
         </li>
         <li>
            정확한 정보를 기입해 주세요.
            </li>
            <li>
            아이디는 변경불가능합니다.
         </li>
         <li>
            로그인 비밀번호 유출에 주의하세요.
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
            <form action="/volunteer134/volunteerMypage/${vid}" method="post">
            <table class="table">
            <tbody>
               <c:forEach items="${list}" var="vo">
              <tr>
                  <td>
                      <i class="icon-ok"></i><strong>아이디</strong>
                  </td>
                  <td>
                    <strong>${vo.id}</strong>
                  </td>
              </tr>
               <tr>
                  <td>
                      <i class="icon-ok"></i><strong>이름</strong>
                  </td>
                  <td>
                    <strong>${vo.name}</strong>
                  </td>
                 </tr>
                 <tr>
                  <td>
                      <i class="icon-ok"></i><strong>성별</strong>
                  </td>
                  <td>
                    <strong>${vo.gender}</strong>
                  </td>
                 </tr>
               
               <tr>
                  <td>
                      <strong>전화번호</strong>
                  </td>
                  <td>
                    <input type="text" name="phone" id="phone" class="form-control" placeholder='${vo.phone}'>
                  </td>
                 </tr>
                 <tr>
                  <td>
                     <strong>주소</strong>
                  </td>
                  <td>
                    <input type="text" id="address" name="address" placeholder='${vo.address}' style="width:300px;" />
               <!-- <button type="button" onclick="openZipSearch()">주소찾기</button> -->
                  </td>
                 </tr>
                 <tr>
                  <td>
                      <strong>이메일</strong>
                  </td>
                  <td>
               <input type="text" name="mail" id="mail" placeholder='${vo.mail}'><br>
                  </td>
                 </tr>
                 <!-- 기존 비밀번호  hidden -->
               <input type="hidden" id="userPw" class="form-control" value='${vo.pw}'>
               <!-- 기존 정보 유지하고 싶은 값 -->
               <input type="hidden" id="hiddenPhone" class="form-control" value='${vo.phone}'>
               <input type="hidden" id="hiddenAddress" class="form-control" value='${vo.address}'>
               <input type="hidden" id="hiddenMail" class="form-control" value='${vo.mail}'>
               <input type="hidden" id="hiddenPre1" class="form-control" value='${vo.preference1}'>
                 </c:forEach>
               <tr>
                  <td>
                      <strong>이전 비밀번호</strong>
                  </td>
                  <td>
               <input type="password" id="userPwChk" class="form-control">&nbsp;
               <span id="chkNotice"></span>
                  </td>
                 </tr>
                  <tr>
                  <td>
                      <strong>새 비밀번호</strong>
                  </td>
                  <td>
               <input type="password" id="NewPw" name="pw" class="form-control">
              </td>
                 </tr>
                 <tr>
                  <td>
                      <strong>선호봉사1</strong>
                  </td>
                  <td>
               <select name="large1" id="lar1" >
               <option> 선택안함 </option>
                  <c:forEach items="${prelist }" var="prelist">      
                     <option value="${prelist.large}" name="large1">${prelist.large}</option>
                  </c:forEach> 
               </select>
               <select name="medium1" id="med1">
               </select>
              </td>
                 </tr>
                 <tr>
                  <td>
                      <strong>선호봉사2</strong>
                  </td>
                  <td>
               <select name="large2" id="lar2" >
               <option> 선택안함 </option>
                  <c:forEach items="${prelist }" var="prelist">
                     <option value="${prelist.large}" name="large2">${prelist.large}</option>
                  </c:forEach> 
               </select>
               <select name="medium2" id="med2">
               </select>
              </td>
                 </tr>
                 <tr>
                  <td>
                      <strong>선호봉사3</strong>
                  </td>
                  <td>
               <select name="large3" id="lar3" >
               <option> 선택안함 </option>
                  <c:forEach items="${prelist }" var="prelist">
                     <option value="${prelist.large}" name="large3">${prelist.large}</option>
                  </c:forEach> 
               </select>
               <select name="medium3" id="med3">
               </select>
              </td>
                 </tr>
                </tbody>
               </table>
            <input type="submit" value="정보 수정" id="submit">
             </form>

          
          </section>
        </div>
      </div>
    </div>
  </section>
          
              <!--Body content--> 
            </div>
            </div>
          </div>
         
    
   <section id="blank" class="doc">
  </section>    

  <!-- Template Custom Javascript File -->
  <script src="${pageContext.request.contextPath}/resources/Plato/assets/js/custom.js"></script>        




</body>
<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>