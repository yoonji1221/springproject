<%@page import="java.util.ArrayList"%>
<%@page import="vinfo.VinfoVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>


<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<HEAD>
<TITLE>캘린더</TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript">       </script>
<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<style TYPE="text/css">
body {
   scrollbar-face-color: #F6F6F6;
   scrollbar-highlight-color: #bbbbbb;
   scrollbar-3dlight-color: #FFFFFF;
   scrollbar-shadow-color: #bbbbbb;
   scrollbar-darkshadow-color: #FFFFFF;
   scrollbar-track-color: #FFFFFF;
   scrollbar-arrow-color: #bbbbbb;
   margin-left: "0px";
   margin-right: "0px";
   margin-top: "0px";
   margin-bottom: "0px";
}

td {
   font-family: "돋움";
   font-size: 9pt;
   color: #595959;
}

th {
   font-family: "돋움";
   font-size: 9pt;
   color: #000000;
}

select {
   font-family: "돋움";
   font-size: 9pt;
   color: #595959;
}

.divDotText {
   overflow: hidden;
   text-overflow: ellipsis;
}

#detail{
word-break:break-all;
width : 100px;
font-weight : bold;
}
</style>
</HEAD>
<%

Calendar cal = Calendar.getInstance();
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
}else{

}

//년도/월 셋팅
cal.set(year, month, 1);
int startDay = cal.getMinimum(java.util.Calendar.DATE); //해당 월의 첫날
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //해당 월의 마지막 날
int start = cal.get(java.util.Calendar.DAY_OF_WEEK); //calendar가 가르키는(의미하는) 특정 날짜가 무슨 요일  : 일 = 1, 월 = 2 .., 토 =7
int newLine = 0;


//오늘 날짜 저장
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));


%>

<BODY>

<div style="position:fixed; top:70px; left:250px;">
 <c:set var="vid" value="${vid}" />
 <%
      int vid = Integer.parseInt(pageContext.getAttribute("vid").toString()) ;
 %>
   <form name="calendarFrm" id="calendarFrm" action="" method="post">
   <DIV id="content" style="width: 712px;">
   <table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
      <td align="right"><input type="button" onclick="javascript:location.href='<c:url value='/volunteerMypage/${vid}/Cal' />'" value="오늘" /></td>
      </tr>
   </table>

   <!--날짜 네비게이션  -->
   <table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">
      <tr>
      <td height="60">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
         <td height="10"></td>
         </tr>
         <tr>
         <td align="center">
            <a href="<c:url value='/volunteerMypage' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self"> 
            <!-- 이전해 -->
            </a> <%if(month > 0 ){ %> <a href="<c:url value='/volunteerMypage/${vid}/Cal' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self"> <b>&lt;</b>
            <!-- 이전달 -->
            </a> <%} else {%> <b>&lt;</b> <%} %> &nbsp;&nbsp; <%=year%>년 <%=month+1%>월 &nbsp;&nbsp; <%if(month < 11 ){ %> 
            <a href="<c:url value='/volunteerMypage/${vid}/Cal' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self"> 
            <!-- 다음달 -->
            <b>&gt;</b>
            </a> <%}else{%> <b>&gt;</b> <%} %> <a href="<c:url value='/volunteerMypage' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self"> <!-- 다음해 -->
            </a></td>
         </tr>
         </table>
      </td>
      </tr>
   </table>

         <br>
         <table id="mainCalender" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF" >
            <THEAD>
               <TR bgcolor="#CECECE">
                  <TD width='100px'>
                     <DIV align="center">
                        <font color="red">일</font>
                     </DIV>
                  </TD>
                  <TD width='100px'>
                     <DIV align="center">월</DIV>
                  </TD>
                  <TD width='100px'>
                     <DIV align="center">화</DIV>
                  </TD>
                  <TD width='100px'>
                     <DIV align="center">수</DIV>
                  </TD>
                  <TD width='100px'>
                     <DIV align="center">목</DIV>
                  </TD>
                  <TD width='100px'>
                     <DIV align="center">금</DIV>
                  </TD>
                  <TD width='100px'>
                     <DIV align="center">
                        <font color="#529dbc">토</font>
                     </DIV>
                  </TD>
               </TR>
            </THEAD>
            <TBODY>
               <TR>
<%
//처음 빈공란 표시
for(int index = 1; index < start ; index++ ){ //
   out.println("<TD>&nbsp;</TD>");
   newLine++;
   }
                     
for(int index = 1; index <= endDay; index++){
   String color = "";
   if(newLine == 0){ //일
      color = "RED";
   }else if(newLine == 6){ //토
      color = "#529dbc";
   }else{ //평일
      color = "BLACK"; 
      };
      
      
      
String sUseDate = Integer.toString(year); 
sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

int iUseDate = Integer.parseInt(sUseDate);
String backColor = "#EFEFEF";
if(iUseDate == intToday ) { //오늘 날짜는 배경색깔 변경
   backColor = "#c9c9c9";
}


//////////////////////////////////////////////hj
List<VinfoVO> list = (List<VinfoVO>)request.getAttribute("list");
List<Integer> BgndList = new ArrayList<Integer>();
List<Integer> VnumList = new ArrayList<Integer>();
List<String> SjList = new ArrayList<String>();
List<String> actPlaceList = new ArrayList<String>();
for (VinfoVO vo : list) {
   BgndList.add(Integer.parseInt(vo.getProgrmBgnde()));
   VnumList.add(vo.getProgrmRegistNo());
   SjList.add(vo.getProgrmSj());
   actPlaceList.add(vo.getActPlace());
}

//봉사자가 그동안 신청한 봉사일정 색칠하기
for(int i = 0; i <BgndList.size(); i++){
   if(iUseDate == BgndList.get(i)){
      backColor = "pink";
   }
}

out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
 %>

<font color='<%=color%>'> <%out.print(index); %> </font>

<%
out.println("<BR>");
//out.println(iUseDate); //여기에 일정출력
/////////////////)
for(int i = 0; i <BgndList.size(); i++){
   if(iUseDate == BgndList.get(i)){
      out.println("<div id='detail'> <a href = '/volunteer134/volunteerMypage/detail/"+vid+"?progrmRegistNo="+VnumList.get(i)+"'>");
      //out.println(VnumList.get(i) + "<br>");
      out.println(actPlaceList.get(i));
      out.println("</a></div>");
   }
}
///////////////
out.println("<BR>");
//기능 제거 
out.println("</TD>");
newLine++;
if(newLine == 7){
   out.println("</TR>");
   if(index <= endDay){
      out.println("<TR>");
      }
   newLine=0;
   }
} //for end

//마지막 공란 LOOP
while(newLine > 0 && newLine < 7){
   out.println("<TD>&nbsp;</TD>");
   newLine++;
   }
%>
</TR>
</TBODY>
</TABLE>
</DIV>
</form>
</div>
</BODY>
</HTML>