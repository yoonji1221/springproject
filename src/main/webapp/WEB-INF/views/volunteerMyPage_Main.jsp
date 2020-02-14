<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
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
                 $("#phone").val(콜); 
            }
            if($("#address").val() == "" ){
                 $("#address").val(address); 
            }
            if($("#mail").val() == "" ){
                 $("#mail").val(mail); 
            }
         })

});
</script>

<body>


<h3>봉사자마이페이지</h3>

<div style="position:fixed; top:70px; left:250px;">
회원 번호 : ${vid}

<form action="/volunteer134/volunteerMypage/${vid}" method="post">
<c:forEach items="${list}" var="vo">
이름 : ${vo.name}<br>
아이디 : ${vo.id }<br>
성별 : ${vo.gender}<br>
전화번호 : <input type="text" name="phone" id="phone" class="form-control" placeholder='${vo.phone}'><br> 
주소 : <input type="text" name="address" id="address" placeholder='${vo.address}'><br>
이메일 : <input type="text" name="mail" id="mail" placeholder='${vo.mail}'><br>
<!-- 기존 비밀번호  hidden -->
<input type="hidden" id="userPw" class="form-control" value='${vo.pw}'>
<!-- 기존 정보 유지하고 싶은 값 -->
<input type="hidden" id="hiddenPhone" class="form-control" value='${vo.phone}'>
<input type="hidden" id="hiddenAddress" class="form-control" value='${vo.address}'>
<input type="hidden" id="hiddenMail" class="form-control" value='${vo.mail}'>
<input type="hidden" id="hiddenPre1" class="form-control" value='${vo.preference1}'>
</c:forEach>

새 비밀번호 : <input type="password" id="NewPw" name="pw" class="form-control">
이전 비밀번호 : <input type="password" id="userPwChk" class="form-control">&nbsp; 
<span id="chkNotice"></span><br>
<br>
선호 봉사 :
<select name="large1" id="lar1" >
<option> 선택안함 </option>
   <c:forEach items="${prelist }" var="prelist">      
      <option value="${prelist.large}" name="large1">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium1" id="med1">
</select><br>
선호 봉사 :
<select name="large2" id="lar2" >
<option> 선택안함 </option>
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}" name="large2">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium2" id="med2">
   
</select><br>
선호 봉사 :
<select name="large3" id="lar3" >
<option> 선택안함 </option>
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}" name="large3">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium3" id="med3">
   
</select><br>
<br><input type="submit" value="정보 수정" id="submit">

</form>
</div>
</body>
</html>