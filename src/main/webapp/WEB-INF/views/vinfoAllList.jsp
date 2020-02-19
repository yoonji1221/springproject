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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
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
   $("#pagingbtn").remove();
      $("#table1").remove();
      $("#table2").remove();
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
             var table = $("<table id=\"table2\" class=\"table table-bordered table-striped\">");
             $("#tab2").append(table);
              for(var idx in category_list){
                var progrmSj = category_list[idx]['progrmSj']
                var progrmBgndeS = category_list[idx]['progrmBgnde']
                var actPlace = category_list[idx]['actPlace']
                var rcritNmpr = category_list[idx]['rcritNmpr']
                var srvcClCode = category_list[idx]['srvcClCode']
                var noticeBgndeS = category_list[idx]['noticeBgnde']
                var noticeEnddeS = category_list[idx]['noticeEndde']
                var progrmRegistNo = category_list[idx]['progrmRegistNo']
                var today = ${today}
                var recruit;
                var button;
                
                var progrmBgnde = progrmBgndeS.substring(0,4) + "년 " + progrmBgndeS.substring(5,6) + "월 " + progrmBgndeS.substring(7,8) + "일 ";
                var noticeBgnde = noticeBgndeS.substring(0,4) + "년 " + noticeBgndeS.substring(5,6) + "월 " + noticeBgndeS.substring(7,8) + "일 ";
                var noticeEndde = noticeEnddeS.substring(0,4) + "년 " + noticeEnddeS.substring(5,6) + "월 " + noticeEnddeS.substring(7,8) + "일 ";
                
                
                if(rcritNmpr == srvcClCode){
                    recruit = "<span style=\"font-size: 15px; color:red;\">&nbsp;(인원 마감)</span>";
                    button = "";                   
                 }
                if(progrmBgndeS < today ){
                   recruit = "<span style=\"font-size: 15px;\">&nbsp;(모집 마감)</span>";
                   button ="";
         
                }else if(noticeEnddeS < today){
                   recruit = "<span style=\"font-size: 15px;\">&nbsp;(모집 마감)</span>";
                   button ="";
                   
                }else if(noticeBgndeS >= today){
                   recruit = " <span style=\"font-size: 15px; color: #ff4e00;\">&nbsp;(모집대기)</span>";
                   button = "";
                }
                else{
                   recruit = "<span style=\"font-size: 15px; color: #ff4e00;\"><strong>&nbsp;(모집중)</strong></span>";
                   button = "<button onClick=\"location.href='/volunteer134/volunteerMypage/detail?progrmRegistNo="+progrmRegistNo+"'\"><i class=\"icon-search\"></i>자세히</button>";
                }
                
                var all = $("<tr><td><span value='"+progrmSj+"' style=\"font-size: 15px; color: #0090b1;\"><i class=\"icon-bullhorn\"></i><strong>&nbsp;"+progrmSj+"</strong></span>"+recruit+button+" <br><span value='"+actPlace+"'>"+"<i class=\"icon-map-marker\"></i>&nbsp;모집장소 : "+actPlace+"</span><br><span value='"+srvcClCode+"'>"+"<i class=\"icon-tags\"></i>&nbsp;봉사분야 : "+srvcClCode+"</span><br><span value='"+progrmBgnde+"'>"+"<i class=\"icon-time\"></i>&nbsp;봉사날짜 : "+progrmBgnde+"</span><br><span value='"+noticeBgnde+"'>"+"<i class=\"icon-calendar\"></i>&nbsp;모집기간 : "+noticeBgnde+"~"+noticeEndde+"</span>");                   
                $("#table2").append(all);
             }
              
             }, error : function(e) {
                console.log(e);
             }
          });      
}

</script>
<style>

</style>
</head>
<body>
<section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>voluntary service<strong>List</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">All voluntary service</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
  <section id="maincontent">
    <div class="container">

      <div class="row">

        <div class="span12">

          <section id="global">

            <h5 id="headings">자원봉사 수요기관 목록</h5>
            <form>
           <ul>
            <li>
               봉사기관에서 제공하는 수요봉사 목록입니다.
            </li>
           
            
            <li>
               관심있는 봉사활동 <strong>지역</strong>을 선택하세요.<BR>
               <select name="address" id="address" >
               <option value="">지역</option>
               <c:forEach items="${silist}" var="silist">
                  <option value="${silist.postAdres}" name="silist">${silist.postAdres}</option>
               </c:forEach> 
            </select>
            <select name="detailaddress" id="detailaddress">
            <option value="">전체</option>
            </select><br>
            </li>
            <li>
               관심있는 봉사활동 <strong>분류</strong>를 선택하세요.<BR>
               <select name="preference" id="preference" >
            <option value="" >종류</option>
               <c:forEach items="${largelist}" var="largelist">
                  <option value="${largelist.large}" name="largelist">${largelist.large}</option>
               </c:forEach> 
            </select>
            <select name="detailprefer" id="detailprefer">
            <option value="">전체</option>
            </select>
            </li>
            </ul>
            <input id="button1" type=button value="검색" class="btn" onclick="button1_click();">         
          
            </form>
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         

<div id="tab2"></div>
<div id="outter" >
      <div style="float: right;margin-right: 120px;">
         <select id="cntPerPage" name="sel" onchange="selChange()" items="${paging}" var="paging" class="span1"
            style="font-size: 10pt;width: 90px;">
            <option value="10"
               <c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개보기</option>
            <option value="20"
               <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개보기</option>
            <option value="30"
               <c:if test="${paging.cntPerPage == 30}">selected</c:if>>30개보기</option>
            <option value="50"
               <c:if test="${paging.cntPerPage == 50}">selected</c:if>>50개보기</option>
         </select>
      </div>
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
      <table id="table1" class="table table-bordered table-striped"> 
        
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
         <thead>
         <tr>
         <td>
         <span style="font-size: 15px; color: #0090b1;"><i class="icon-bullhorn"></i><strong>&nbsp;${vinfolist.progrmSj}</strong></span>
<%--            <span style="font-size: 15px; color: #ff4e00;"><strong>&nbsp;(모집 중)</strong></span>
                        <button onClick="location.href='/volunteer134/volunteerMypage/detail?progrmRegistNo=${vinfolist.progrmRegistNo}'"><i class="icon-search"></i>자세히</button> --%>
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
         </thead>
       </c:forEach>
      </table>
      
      <div style="display: block; text-align: center;" items="${paging}" var="paging" id="pagingbtn">
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
   


<form>
<input type="hidden" id="vid" name="vid" value='<%=request.getParameter("vid") %>'>
</form>
</div>
      </div>
    </div>
  </section>
  
  <section id="blank" class="doc">
  </section>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>