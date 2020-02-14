<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="vinfo.VinfoVO"%>
<%@page import="volunteer.VolunteerVO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String Path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
<body style="
    margin-left: 200px;
">

<h1><%=session.getAttribute("dbid") %>님의 지역, 선호도 기반  추천봉사입니다</h1>
<table border="1" id="table1">
         <tr>
            <th>제목</th>
            <th>날짜</th>
            <th>장소</th>
            <th>모집인원</th>
            <th>신청인원</th>
            <th>분야</th>
            <th>모집기간</th>
            <th>모집상태</th>
            <th></th>
         </tr>
         <c:forEach items="${vinfolist }" var="vinfolist">
            <tr>
               <td>${vinfolist.progrmSj}</td>
               <td>${vinfolist.progrmBgnde}</td>
               <td>${vinfolist.actPlace}</td>
               <td>${vinfolist.rcritNmpr}</td>
               <td>${vinfolist.appTotal}</td>
               <td>${vinfolist.srvcClCode}</td>
               <td>${vinfolist.noticeBgnde}~ ${vinfolist.noticeEndde}</td>
               <td>모집중</td>
               <td><button onClick="window.open('/volunteer134/volunteerMypage/detail?progrmRegistNo=${vinfolist.progrmRegistNo}')">정보 조회</button></td>
            </tr>
         </c:forEach>
      </table>

</body>
</html>