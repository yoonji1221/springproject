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
function erchk() {
	var flag =validation(); // 유효성 검사를 한 값
	if(flag){
		document.sub1.submit();
	}
};
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
    	console.log( selected_large);
    	$.ajax({
    		url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
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
    		url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
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
    	
    	//휴대폰 인증
    	$("#phonecheck").click(function(){
    		
    		var number = Math.floor(Math.random() * 100000) + 100000;
            if(number>100000){
               number = number - 10000;
            }

            $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
         
         var to = $("#to").val();
 		
         if(to == "" || to == null){
            alert("빈칸이나 공백을 채워주세요");
             return; 
         }
         
         var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
            
            if(!con_test){
            	return;
            }
    		
    		$.ajax({
  				url : '/volunteer134/volunjoin/phonecheck',
  				data : {
  					to: $("#to").val(),
                    text: $("#text").val()
  				},
    			type : 'get',
    			success : function(data){
    				alert("문자 발송에 성공하였습니다");
    				
    				
    			},error : function(e) {
    				console.log(e);
    			}
    		});
    	})
    	
 });
    
function  validation(){
	 var flag = false;
	 var length = $("input:radio[name='gender']:checked").length;
	if($("#id").val() == "" ){
		console.log($("#id").val());
		alert("아이디칸이 비었습니다");
	}else if($("#userPw").val() == "" ){
		alert("비밀번호칸이 비었습니다");
	}else if($("#name").val() == "" ){
		console.log($("#name").val());
		alert("이름칸이 비었습니다");
	}else if($("#phone").val() == "" ){
		alert("전화번호칸이 비었습니다");
	}else if($("#email").val() == "" ){
		alert("이메일칸이 비었습니다");
	}else if($("#address").val() == "" ){
		alert("주소칸이 비었습니다");
	}else if(length <= 0){
		alert("성별을 선택하세요");
	}else if($("#userNum").val() != $("#text").val()){
		alert("인증번호를 확인해주세요");
	}
	else{
		flag = true;
	} return flag;
}

</script>
</head>
<body>

<h1>회원가입</h1>
<form action="<%=path %>/volunjoin" name="sub1" method="post">
<input type="hidden" id="text"><br>
이름 : <input type="text" id="name"name="name"><br>
아이디 : <input type="text" id="id" name="id"><br>
<span id="id_check"></span><br>
비밀번호 : <input type="password" id="userPw" name="pw" class="form-control"><br>
비밀번호 확인 : <input type="password" id="userPwChk" class="form-control">&nbsp; 
<span id="chkNotice"></span><br>
전화번호 : <input type="text" name="phone" id="to" class="form-control">
<input type="button" id="phonecheck" value="인증번호 받기"> <br>
인증번호 :<input type="text" id="userNum" placeholder="인증번호를 입력해주세요"> <br>


주소 : <input type="text" name="address"><br>
이메일 : <input type="text" name="mail"><br>
남성 <input type="radio" id="gender" name="gender" value="male">
여성 <input type="radio" id="gender1" name="gender" value="female"><br>
선호 봉사 :
<select name="large1" id="lar1" >
<option>선택안함</option>
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}" name="large1">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium1" id="med1">
</select><br>
선호 봉사 :
<select name="large2" id="lar2" >
<option>선택안함</option>
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}" name="large2">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium2" id="med2">
   
</select><br>
선호 봉사 :
<select name="large3" id="lar3" >
<option>선택안함</option>
   <c:forEach items="${prelist }" var="prelist">
      <option value="${prelist.large}" name="large3">${prelist.large}</option>
   </c:forEach> 
</select>
<select name="medium3" id="med3">
   
</select><br>
<br><input onclick="erchk()" type="button" id="join" value="회원가입완료" disabled="disabled" >

</form>
</body>
</html>