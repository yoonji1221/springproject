<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">

<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
<body>

   <table id = "table1">
<tr> <th>봉사 기관 이름</th> <th>${mnnstnm}</th> </tr>
        <c:forEach items="${viewAll }" var="vinfolist">
        	<c:set var="progrmBgnde" value="${vinfolist.progrmBgnde}"/>
			<c:set var="noticeBgnde" value="${vinfolist.noticeBgnde}"/>
			<c:set var="noticeEndde" value="${vinfolist.noticeEndde}"/>
			<%
			String progrmBgnde = (String)pageContext.getAttribute("progrmBgnde");
			StringBuffer sb = new StringBuffer(progrmBgnde);
			sb.insert(4, "년 ");
			sb.insert(8, "월 ");
			sb.append("일");
			String result_progrmBgnde = sb.toString();
			
			String noticeBgnde = (String)pageContext.getAttribute("noticeBgnde");
			StringBuffer sb2 = new StringBuffer(noticeBgnde);
			sb2.insert(4, "년 ");
			sb2.insert(8, "월 ");
			sb2.append("일");
			String result_noticeBgnde = sb2.toString();
			
			String noticeEndde = (String)pageContext.getAttribute("noticeEndde");
			StringBuffer sb3 = new StringBuffer(noticeEndde);
			sb3.insert(4, "년 ");
			sb3.insert(8, "월 ");
			sb3.append("일");
			String result_noticeEndde = sb3.toString();
			%>
         
         <tr>
         <td colspan=2>
         <span style="font-size: 15px; color: #0090b1;"><i class="icon-bullhorn"></i><strong>&nbsp;${vinfolist.progrmSj}</strong></span>
            <c:choose>
                    <c:when test ="${vinfolist.progrmBgnde lt today}" >
                         <span style="font-size: 15px;">&nbsp;(모집 마감)</span>
                     </c:when>
                     <c:when test ="${vinfolist.rcritNmpr eq vinfolist.appTotal}" >
                         <span style="font-size: 15px; color:red;">&nbsp;(인원 마감)</span>
                     </c:when>
                     <c:when test ="${vinfolist.noticeEndde lt today}" >
                         <span style="font-size: 15px";">&nbsp;(모집 마감)</span>
                     </c:when>
          
                     <c:when test ="${vinfolist.noticeBgnde ge today}" >
                         <span style="font-size: 15px; color: #ff4e00;">&nbsp;(모집 대기)</span>
                     </c:when>
                     <c:otherwise>
                         <span style="font-size: 15px; color: #ff4e00;"><strong>&nbsp;(모집 중)</strong></span>
                        <button onClick="location.href='/volunteer134/volunteerMypage/detail?progrmRegistNo=${vinfolist.progrmRegistNo}'"><i class="icon-search"></i>자세히</button>
                     </c:otherwise>
                  </c:choose>
                 <!-- 제목 -->
            <br>
            <i class="icon-map-marker"></i>&nbsp;모집장소 : ${vinfolist.actPlace}<br>
            <i class="icon-tags"></i>&nbsp;봉사분야 : ${vinfolist.srvcClCode}<br>
            <i class="icon-time"></i>&nbsp;봉사날짜 : <%=result_progrmBgnde %><br>
            <i class="icon-calendar"></i>&nbsp;모집기간 : <%=result_noticeBgnde %> ~ <%=result_noticeEndde %>
         </td>
         </tr>
         
       </c:forEach>                      
            
      </table>
      
            <table id="table1" class="table table-bordered table-striped"> 
        <tr> <th>봉사 기관 이름</th> <th>${mnnstnm}</th> </tr>
        <c:forEach items="${viewAll }" var="vinfolist">
        	<c:set var="progrmBgnde" value="${vinfolist.progrmBgnde}"/>
			<c:set var="noticeBgnde" value="${vinfolist.noticeBgnde}"/>
			<c:set var="noticeEndde" value="${vinfolist.noticeEndde}"/>
			<%
			String progrmBgnde = (String)pageContext.getAttribute("progrmBgnde");
			StringBuffer sb = new StringBuffer(progrmBgnde);
			sb.insert(4, "년 ");
			sb.insert(8, "월 ");
			sb.append("일");
			String result_progrmBgnde = sb.toString();
			
			String noticeBgnde = (String)pageContext.getAttribute("noticeBgnde");
			StringBuffer sb2 = new StringBuffer(noticeBgnde);
			sb2.insert(4, "년 ");
			sb2.insert(8, "월 ");
			sb2.append("일");
			String result_noticeBgnde = sb2.toString();
			
			String noticeEndde = (String)pageContext.getAttribute("noticeEndde");
			StringBuffer sb3 = new StringBuffer(noticeEndde);
			sb3.insert(4, "년 ");
			sb3.insert(8, "월 ");
			sb3.append("일");
			String result_noticeEndde = sb3.toString();
			%>
         
         <tr>
         <td colspan=2>
         <span style="font-size: 15px; color: #0090b1;"><i class="icon-bullhorn"></i><strong>&nbsp;${vinfolist.progrmSj}</strong></span>
            <c:choose>
                    <c:when test ="${vinfolist.progrmBgnde lt today}" >
                         <span style="font-size: 15px;">&nbsp;(모집 마감)</span>
                     </c:when>
                     <c:when test ="${vinfolist.rcritNmpr eq vinfolist.appTotal}" >
                         <span style="font-size: 15px; color:red;">&nbsp;(인원 마감)</span>
                     </c:when>
                     <c:when test ="${vinfolist.noticeEndde lt today}" >
                         <span style="font-size: 15px";">&nbsp;(모집 마감)</span>
                     </c:when>
          
                     <c:when test ="${vinfolist.noticeBgnde ge today}" >
                         <span style="font-size: 15px; color: #ff4e00;">&nbsp;(모집 대기)</span>
                     </c:when>
                     <c:otherwise>
                         <span style="font-size: 15px; color: #ff4e00;"><strong>&nbsp;(모집 중)</strong></span>
                        <button onClick="location.href='/volunteer134/volunteerMypage/detail?progrmRegistNo=${vinfolist.progrmRegistNo}'"><i class="icon-search"></i>자세히</button>
                     </c:otherwise>
                  </c:choose>
                 <!-- 제목 -->
            <br>
            <i class="icon-map-marker"></i>&nbsp;모집장소 : ${vinfolist.actPlace}<br>
            <i class="icon-tags"></i>&nbsp;봉사분야 : ${vinfolist.srvcClCode}<br>
            <i class="icon-time"></i>&nbsp;봉사날짜 : <%=result_progrmBgnde %><br>
            <i class="icon-calendar"></i>&nbsp;모집기간 : <%=result_noticeBgnde %> ~ <%=result_noticeEndde %>
         </td>
         </tr>
         
       </c:forEach>
      </table>
      
      
   

</body>
</html>