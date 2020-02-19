<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">

<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script>
function deleteuser(id){
   var logoutFlag = confirm("선택한 회원을 탈퇴시키겠습니까?");
   if(logoutFlag) {
      $.ajax({
          url : '/volunteer134/adminuserlist/deleteuser?id='+ id,
          type : 'get',
          success : function(data) {
             if(data==1) {
                console.log(id);
                alert("탈퇴되었습니다.");
                /* location.href='/volunteer134/adminuserlist/user'; */
                location.reload();
                 
             }else{
                alert("탈퇴 실패했습니다.");
             }
             }, error : function(e) {
                   console.log(e);
             }
          });
   }
}

</script>
</head>
<body style="margin-top: 50px; margin-left: 50px; margin-right: 50px;
   background-color: #f5f5f5;">


<h1>회원정보</h1>

<div class="table-responsive">
<table class="table table-striped"><tr><th>아이디</th><th>이름</th><th>전화번호</th><th>이메일</th><th>관리</th></tr>
<c:forEach items="${userlist }" var="userlist"> 
<h3><tr><td>${userlist.id }
</td><td>${userlist.name }
</td><td>${userlist.phone }
</td><td> ${userlist.mail }

</td><td> <input type="button" value="탈퇴" onclick="deleteuser('${userlist.id}')">
</td></tr>
</h3>
</c:forEach>
</table></div>
<input type="button" value="돌아가기" onclick="location.href='/volunteer134/home'">
&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="문의문자보기" onclick="location.href='/volunteer134/contactList'">
</body>
</html>