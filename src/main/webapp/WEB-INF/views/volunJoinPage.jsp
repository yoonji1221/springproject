<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	    $('#userPw').keyup(function(){
       		$('#chkNotice').html('');
    	});
	      
    $('#userPwChk').keyup(function(){

        if($('#userPw').val() != $('#userPwChk').val()){
          $('#chkNotice').text('비밀번호 일치하지 않음');
          $('#chkNotice').css('color', 'red');
          $("#chkNotice").css("font-size", "13px");
          $('#join').prop('disabled', true); 

        } else{
          $('#chkNotice').text('비밀번호 일치함');
          $('#chkNotice').css('color', 'blue');
          $("#chkNotice").css("font-size", "13px");
          $('#join').prop('disabled', false);
        }
    });

    //아이디 유효성 검사(1 = 중복 / 0 != 중복)
	 $("#id").keyup(function() {
    	var id = $('#id').val();
    	$.ajax({
    		url : '/volunteer134/volunjoin/user?id='+ id,
    		type : 'get',
    		success : function(data) {
    			console.log("1 = 중복o / 0 = 중복x : "+ data);							
    			if (data == 1) {// 1 : 아이디가 중복되는 문구
    					$("#id_check").text("사용중인 아이디입니다");
    					$("#id_check").css("color", "red");
    					$("#id_check").css("font-size", "13px");
    					$("#join").attr("disabled", true);
    				} else {
    						$('#id_check').text('사용가능한 아이디입니다.');
    						$('#id_check').css('color', 'blue');
    						$("#id_check").css("font-size", "13px");
    						$("#join").attr("disabled", false);				
    				}
    			}, error : function(e) {
    				console.log(e);
    			}
    		});
    	});
    
    $("#lar1").change(function(){
    	var selected_large = $("#lar1 option:selected").val();
    	console.log( selected_large);
    	$.ajax({
    		url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
    		type : 'get',
    		success : function(category_list) {
    			$("#med1").empty();
    			for(var idx in category_list){
    				var data = category_list[idx]['medium']
    	            var option = $("<option>"+data+"</option>");
	                $("#med1").append(option);
    			}
    			}, error : function(e) {
    				console.log(e);
    			}
    		});
    	})
     $("#lar2").change(function(){
    	var selected_large = $("#lar2 option:selected").val();
    	console.log( selected_large);
    	$.ajax({
    		url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
    		type : 'get',
    		success : function(category_list) {
    			$("#med2").empty();
    			for(var idx in category_list){
    				var data = category_list[idx]['medium']
    	            var option = $("<option>"+data+"</option>");
	                $("#med2").append(option);
    			}
    			}, error : function(e) {
    				console.log(e);
    			}
    		});
    	})
    	
    	 $("#lar3").change(function(){
    	var selected_large = $("#lar3 option:selected").val();
    	console.log( selected_large);
    	$.ajax({
    		url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
    		type : 'get',
    		success : function(category_list) {
    			$("#med3").empty();
    			for(var idx in category_list){
    				var data = category_list[idx]['medium']
    	            var option = $("<option>"+data+"</option>");
	                $("#med3").append(option);
    			}
    			}, error : function(e) {
    				console.log(e);
    			}
    		});
    	})
    	
    	
    });
</script>
</head>
<body>

<h1>회원가입</h1>
<form action="<%=path %>/" method="get"> <!-- 값확인위해서 get, 추후에 post로 바꿀것!!!!! -->
이름 : <input type="text" name="name" ><br>
아이디 : <input type="text" id="id" name="id"><br>
<span id="id_check"></span><br>
비밀번호 : <input type="password" id="userPw" name="pw" class="form-control"><br>
비밀번호 확인 : <input type="password" id="userPwChk" class="form-control">&nbsp; 
<span id="chkNotice"></span><br>
전화번호 : <input type="text" name="phone" id="phone" class="form-control"><br> 
주소 : <input type="text" name="address"><br>
이메일 : <input type="text" name="email"><br>
남성 <input type="radio" name="gender" value="male">
여성 <input type="radio" name="gender" value="female"><br>
선호 봉사 :
<select name="large" id="lar1">
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium" id="med1">
</select><br>
선호 봉사 :
<select name="large" id="lar2">
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium" id="med2">
   
</select><br>
선호 봉사 :
<select name="large" id="lar3">
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium" id="med3">
   
</select><br>
<input type="hidden" name="move" value="join">
<br><input type="button" value="회원가입완료" >
</form>
</body>
</html>