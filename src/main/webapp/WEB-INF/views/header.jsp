<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String Path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("dbid")==null && session.getAttribute("dbadm")==null){
%>
	<div id=divv style="float:right;">
	<form style="text-align:right">
		<input type="button" value="로그인" onclick="location.href='selectlogin'">
		<input type="button" value="회원가입" onclick="location.href='volunjoin'">
	</form>
	</div>

<%
} else if (session.getAttribute("dbid")!=null){
%>	 
<div id=frm style="float:right;margin-right: 100px;">
<%=session.getAttribute("dbid")%>님 환영합니다!&nbsp;
<input class="btn btn-default" type='button' value='로그아웃' onclick='logout()'>
<input class="btn btn-default" type='button' value='마이페이지' onclick="location.href='/volunteer134/volunteerMypage/<%=session.getAttribute("volid")%>'">
  </div>
<%} else if(session.getAttribute("dbadm")!=null){
%>
<div id=frm style="float:right;margin-right: 100px;">
담당자 <%=session.getAttribute("dbadm")%>님 환영합니다!&nbsp;
<input class="btn btn-default" type='button' value='로그아웃' onclick='logout()'>
<input class="btn btn-default" type='button' value='마이페이지' onclick="location.href='/volunteer134/centerMypageForm'">
  </div>
<%
} else {
%>	 
관리자님 환영합니다
<input class="btn btn-default" type='button' value='로그아웃' onclick='logout()'>
<%} 
%>
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