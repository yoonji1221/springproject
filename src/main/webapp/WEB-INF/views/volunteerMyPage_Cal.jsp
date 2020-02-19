<%@page import="java.util.ArrayList"%>
<%@page import="vinfo.VinfoVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>


<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">


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
   /* font-family: "돋움"; */
   font-size: 11pt;
   color: #595959;
}

th {
   /* font-family: "돋움"; */
   font-size: 11pt;
   color: #000000;
}

select {
   /* font-family: "돋움"; */
   font-size: 11pt;
   color: #595959;
}

.divDotText {
   overflow: hidden;
   text-overflow: ellipsis;
}

A:link {
   font-size: 11pt;
   /* font-family: "돋움"; */
   color: #000000;
   text-decoration: none;
}

A:visited {
   font-size: 11pt;
   /* font-family: "돋움"; */
   color: #000000;
   text-decoration: none;
}

A:active {
   font-size: 11pt;
   /* font-family: "돋움"; */
   color: red;
   text-decoration: none;
}

A:hover {
   font-size: 11pt;
   /* font-family: "돋움"; */
   color: red;
   text-decoration: none;
}

#shortening {
  display:block;
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width: 100px;

}

</style>
<head>
<TITLE>캘린더</TITLE>

<jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript"> </script>
  <title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <meta name="author" content="">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">

</head>

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


 <c:set var="vid" value="${vid}" />
 <%
      int vid = Integer.parseInt(pageContext.getAttribute("vid").toString()) ;
 %>
================================================== -->
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Volunteer <strong>Calendar</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Lists</li>
          </ul>
        </div>
      </div>
    </div>

  </section>

     
    <form name="calendarFrm" id="calendarFrm" action="" method="post">

      <div id="content" style="width: 1100px;padding-left: 300px;">



         <table width="100%" border="0" cellspacing="1" cellpadding="1">

            <tr>

               <td align ="right">


       </td>



            </tr>

         </table>

         <!--날짜 네비게이션  -->

         <table width="100%" border="0" cellspacing="1" cellpadding="1"
            id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">



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

         <br>
            <table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">

            <THEAD>

               <TR bgcolor="#CECECE">

                  <TD width='100px'>

                     <DIV align="center" style="width:105px;height:25px;">
                        <font color="red">일</font>
                     </DIV>

                  </TD>

                  <TD width='100px'>

                     <DIV align="center" style="width:105px;height:25px;">월</DIV>

                  </TD>

                  <TD width='100px'>

                     <DIV align="center" style="width:105px;height:25px;">화</DIV>

                  </TD>

                  <TD width='100px'>

                     <DIV align="center" style="width:105px;height:25px;">수</DIV>

                  </TD>

                  <TD width='100px'>

                     <DIV align="center" style="width:105px;height:25px;">목</DIV>

                  </TD>

                  <TD width='100px'>

                     <DIV align="center" style="width:105px;height:25px;">금</DIV>

                  </TD>

                  <TD width='100px'>

                     <DIV align="center">
                        <font color="#529dbc" style="width:105px;height:25px;">토</font>
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
int today = Integer.parseInt(request.getAttribute("today").toString());

List<Integer> BgndList = new ArrayList<Integer>();
List<Integer> VnumList = new ArrayList<Integer>();
List<String> SjList = new ArrayList<String>();
List<String> actPlaceList = new ArrayList<String>();
List<String> srcritStateList = new ArrayList<String>();
String srcritState;

for (VinfoVO vo : list) {
   BgndList.add(Integer.parseInt(vo.getProgrmBgnde()));
   VnumList.add(vo.getProgrmRegistNo());
   SjList.add(vo.getProgrmSj());
   actPlaceList.add(vo.getActPlace());
}

for(int i = 0; i <list.size(); i++){   
   if(BgndList.get(i) < today){      
      //srcritState = "봉사 완료";
      srcritStateList.add("봉사완료");
   }else{
      srcritStateList.add("봉사대기");
      //srcritState = "봉사 대기";
   }
}

//봉사자가 그동안 신청한 봉사일정 색칠하기
for(int i = 0; i <list.size(); i++){   
   if(BgndList.get(i) < today && iUseDate == BgndList.get(i) && srcritStateList.get(i).equals("봉사완료")){      
       backColor ="#FAE0D4";
   }else if(iUseDate == BgndList.get(i) && srcritStateList.get(i).equals("봉사대기")){
      backColor ="#FFD9EC";
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
      
      if(srcritStateList.get(i).equals("봉사완료")){
            out.println("<div style='color:red;'>"+srcritStateList.get(i)+"</div>");
            out.println("<label id='shortening'><a href = '/volunteer134/volunteerMypage/detail/"+vid+"?progrmRegistNo="+VnumList.get(i)+"'>");     
            out.println(actPlaceList.get(i));
            out.println("</a></label>");
        }
        else if(srcritStateList.get(i).equals("봉사대기")){
           out.println("<div style='color:blue;'>"+srcritStateList.get(i)+"</div>");
           out.println("<label id='shortening'><a href = '/volunteer134/volunteerMypage/detail/"+vid+"?progrmRegistNo="+VnumList.get(i)+"'>");     
            out.println(actPlaceList.get(i));
            out.println("</a></label>");
        }

/*       out.println("<label id='shortening'><a href = '/volunteer134/volunteerMypage/detail/"+vid+"?progrmRegistNo="+VnumList.get(i)+"'>");     
      out.println(actPlaceList.get(i));
      out.println("</a></label>"); */
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
 
<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</BODY>
</HTML>