<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="vinfo.VinfoVO"%>
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
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
<body>
   <h1>봉사 리스트</h1>

<style>
h2 {
   text-align: center;
}

table {
   width: 100%;
}

#outter, #table2 {
   display: block;
}

a {
   text-decoration: none;
}
</style>

   <script>
      function selChange() {
         var sel = document.getElementById('cntPerPage').value;
         location.href = "<%=Path %>/vinfolist?nowPage=${paging.nowPage}&cntPerPage="
               + sel;
      }
      
//도,시 선택하면 아래주소 뽑기
$(function(){
   
   $("#address").change(function(){
             var selected_address = $("#address option:selected").val();
             console.log(selected_address);
             $.ajax({
                url : '/volunteer134/vinfolist/addresscheck?selected_address='+ selected_address,
                type : 'get',
                success : function(addresslist) {
                   $("#detailaddress").empty();
                   var a =  $("<option value='전체'>전체</option>");
                   $("#detailaddress").append(a);
                   for(var idx in addresslist){
                      var data = addresslist[idx]['postAdres']
                         var option = $("<option value='"+data+"'>"+data+"</option>");
                         $("#detailaddress").append(option);
                   }
                   }, error : function(e) {
                      console.log(e);
                   }
                });
             })
//large선택하면 medium 목록 가져오기             
      $("#preference").change(function(){
       var selected_large = $("#preference option:selected").val();
       console.log( selected_large);
       $.ajax({
          url : '/volunteer134/vinfolist/prefercheck?selected_large='+ selected_large,
          type : 'get',
          success : function(category_list) {
             $("#detailprefer").empty();
             for(var idx in category_list){
                var data = category_list[idx]['medium']
                   var option = $("<option value='"+data+"'>"+data+"</option>");
                   $("#detailprefer").append(option);
             }
             }, error : function(e) {
                console.log(e);
             }
          });
       }) 
});      
       
//검색결과조회   
function button1_click() {
		$("#table2").text('');
       var address = $("#address option:selected").val();
       var detailaddress = $("#detailaddress option:selected").val();
       var preference = $("#preference option:selected").val();
       var detailprefer = $("#detailprefer option:selected").val();
       console.log(address+":"+detailaddress+":"+preference+":"+detailprefer);
       
       $.ajax({
          url : '/volunteer134/vinfolist/search?address='+ address +'&detailaddress='+detailaddress+'&preference='+preference+'&detailprefer='+detailprefer,
          type : 'get',
          success : function(category_list) {
             $("#outter").remove();
             /*  $("#table2").hide(); */
             var table = $("<thead><th>제목</th><th>봉사 날짜</th><th>장소</th><th>모집인원</th><th>분야</th><th>신청 가능 날짜(모집 시작일)</th></thead>");
              $("#table2").append(table);
              for(var idx in category_list){
                var progrmSj = category_list[idx]['progrmSj']
                var progrmBgnde = category_list[idx]['progrmBgnde']
                var actPlace = category_list[idx]['actPlace']
                var rcritNmpr = category_list[idx]['rcritNmpr']
                var srvcClCode = category_list[idx]['srvcClCode']
                var noticeBgnde = category_list[idx]['noticeBgnde']
                   
                var optionprogrmSj = $("<td><option value='"+progrmSj+"'>"+progrmSj+"</option></td>");
                var optionprogrmBgnde = $("<td><option value='"+progrmBgnde+"'>"+progrmBgnde+"</option></td>");
                var optionactPlace = $("<td><option value='"+actPlace+"'>"+actPlace+"</option></td>");
                var optionrcritNmpr = $("<td><option value='"+rcritNmpr+"'>"+rcritNmpr+"</option></td>");
                var optionsrvcClCode = $("<td><option value='"+srvcClCode+"'>"+srvcClCode+"</option></td>");
                var optionnoticeBgnde = $("<td><option value='"+noticeBgnde+"'>"+noticeBgnde+"</option></td>");
             
                $("#table2").append("<tbody><tr>");
                   $("#table2").append(optionprogrmSj); //봉사 제목
                   $("#table2").append(optionprogrmBgnde); //봉사 날짜
                   $("#table2").append(optionactPlace); //봉사 장소
                   $("#table2").append(optionrcritNmpr); //신청 인원
                   $("#table2").append(optionsrvcClCode); //봉사 분야
                   $("#table2").append(optionnoticeBgnde); //신청 가능 날짜
                   $("#table2").append("</tr></tbody>");
    
             }
             }, error : function(e) {
                console.log(e);
             }
          });      
}

</script>
<body>

<form method="get">
봉사 지역 : <select name="address" id="address" >
<option value="">선택해주세요.</option>
   <c:forEach items="${silist}" var="silist">
      <option value="${silist.postAdres}" name="silist">${silist.postAdres}</option>
   </c:forEach> 
</select>
<select name="detailaddress" id="detailaddress">
</select><br>
봉사 분야 : <select name="preference" id="preference" >
<option value="" >선택해주세요.</option>
   <c:forEach items="${largelist}" var="largelist">
      <option value="${largelist.large}" name="largelist">${largelist.large}</option>
   </c:forEach> 
</select>
<select name="detailprefer" id="detailprefer">
<option value="">전체</option>
</select>
<input id="button1" type=button value="검색"  onclick="button1_click();">
</form>
<table id="table2">
      </table>

  <div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()" items="${paging}" var="paging">
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
				<option value="30"
					<c:if test="${paging.cntPerPage == 30}">selected</c:if>>30줄
					보기</option>
				<option value="50"
					<c:if test="${paging.cntPerPage == 50}">selected</c:if>>50줄
					보기</option>
			</select>
		</div>
		<!-- 옵션선택 끝 -->
		<%
		List<VinfoVO> list = (List<VinfoVO>)request.getAttribute("viewAll");
		List<Integer> rcritNmpr_List = new ArrayList<Integer>();
		List<Integer> appTotal_List = new ArrayList<Integer>();
		for (VinfoVO vo : list) {
			rcritNmpr_List.add(vo.getRcritNmpr());
			appTotal_List.add(vo.getAppTotal());
			}
		for(int i = 0; i < list.size(); i ++){
			int r = rcritNmpr_List.get(i);
			int a = appTotal_List.get(i);
			if(r == a){
				//out.println("<td>모집완료</td>");
			}else{
				//out.println("<td>모집중</td>");
			}
		}
		%>
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
			<c:forEach items="${viewAll }" var="vinfolist">
				<tr>
					<td>${vinfolist.progrmSj}</td>
					<td>${vinfolist.progrmBgnde}</td>
					<td>${vinfolist.actPlace}</td>
					<td>${vinfolist.rcritNmpr}</td>
					<td>${vinfolist.appTotal}</td>
					<td>${vinfolist.srvcClCode}</td>
					<td>${vinfolist.noticeBgnde}~ ${vinfolist.noticeEndde}</td>
						<c:choose>
							<c:when test ="${vinfolist.rcritNmpr eq vinfolist.appTotal}" >
							 <td style="color:red">모집완료</td>
							 <td></td>
							</c:when>
							<c:otherwise>
							 <td style="color:green">모집중</td>
							 <td><button onClick="window.open('/volunteer134/volunteerMypage/detail?progrmRegistNo=${vinfolist.progrmRegistNo}')">정보 조회</button></td>
							</c:otherwise>
						</c:choose>					
					</c:forEach>
									
				</tr>
			
		</table>
		
		<div style="display: block; text-align: center;" items="${paging}" var="paging" >
			<c:if test="${paging.startPage != 1 }">
				<a
					href="<%=Path %>/vinfolist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="<%=Path %>/vinfolist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="<%=Path %>/vinfolist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</div>

<h3>vidd = <%=request.getParameter("vid") %></h3>
<form>
<input type="hidden" id="vid" name="vid" value='<%=request.getParameter("vid") %>'>
</form>
</body>
</html>