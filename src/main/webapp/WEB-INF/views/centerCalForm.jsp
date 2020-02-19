<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="center.CenterVO"%>
<%@page import="vinfo.VinfoVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   Calendar cal = Calendar.getInstance();

   String strYear = request.getParameter("year");

   String strMonth = request.getParameter("month");

   int year = cal.get(Calendar.YEAR);

   int month = cal.get(Calendar.MONTH);

   int date = cal.get(Calendar.DATE);

   if (strYear != null)

   {

      year = Integer.parseInt(strYear);

      month = Integer.parseInt(strMonth);

   } else {

   }

   //년도/월 셋팅

   cal.set(year, month, 1);

   int startDay = cal.getMinimum(java.util.Calendar.DATE);

   int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

   int start = cal.get(java.util.Calendar.DAY_OF_WEEK); //무슨 요일인지 알수 있도록  일요일부터 1로 시작
   

   int newLine = 0;

   //오늘 날짜 저장.

   Calendar todayCal = Calendar.getInstance();

   SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

   int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
   
   

   ///////////////////////////////////

         List<VinfoVO> list = (List<VinfoVO>)request.getAttribute("mycentercal");
          int today = Integer.parseInt(request.getAttribute("today").toString());
         
         int progrmRegistNo=0; //봉사번호
         //int progrmBgnde=0;
         //String progrmEndde=null;
         String actBeginTm=null;
         String actEndTm=null;
         
         //int rcritNmpr=0;//모집인원
         //int appTotal=0;//신청인원
         //int rcritState=0; //모집상태 int형
         String srcritState=null; //모집상태 표현

         //String noticeBgnde=null;
         //String noticeEndde=null;
         
         String srvcClCode=null;
         //String progrmSj=null; //봉사제목
         String progrmCn=null;
         
         //int cid=session.getAttribute("cid").toString();/////session에 담긴 cid가져오기
         String actPlace=null;//봉사장소
         //String actWkdy=null;

         List<Integer> BgndList = new ArrayList<Integer>();
         List<Integer> rcritNmprList = new ArrayList<Integer>();
         List<Integer> appTotalList = new ArrayList<Integer>();
         List<String> progrmSjList = new ArrayList<String>();
         List<Integer> rcritStateList = new ArrayList<Integer>();
         List<Integer> VnumList = new ArrayList<Integer>();
         List<String> srcritStateList = new ArrayList<String>();
         
           for(VinfoVO vo : list ) {  
              BgndList.add(Integer.parseInt(vo.getProgrmBgnde()));
              rcritNmprList.add(vo.getRcritNmpr());
              appTotalList.add(vo.getAppTotal());
              progrmSjList.add(vo.getProgrmSj());
              VnumList.add(vo.getProgrmRegistNo());
           }
           
           for(int i = 0; i < list.size(); i++){
              rcritStateList.add(rcritNmprList.get(i) - appTotalList.get(i));
           }
           
           for(int i = 0; i < rcritStateList.size(); i++){      
              if(BgndList.get(i) < today){
                 srcritStateList.add("모집완료");
              }else if(rcritStateList.get(i)==0){                
                 srcritStateList.add("모집완료");
                }
                else{
                   srcritStateList.add("모집중");
                }
           }                 
      
      %>




<!DOCTYPE html>
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
  width: 120px;

}

</style>

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript"> </script>
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta name="author" content="">
 
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
  
</head>

<body>

  <!-- Subhead
================================================== -->
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Center <strong>Calendar</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="#">Home</a><span class="divider">/</span></li>
            <li class="active">Lists</li>
          </ul>
        </div>
      </div>
    </div>

  </section>

<div class="container-fluid" style="margin-top: 50px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
      <div class="span2">
           <!--Sidebar content--> 
           <jsp:include page="/WEB-INF/views/centerLeftMenu.jsp"></jsp:include>
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            
            <section id="maincontent">



     <div class="row">
     <div class="spantable">
     
    <form name="calendarFrm" id="calendarFrm" action="" method="post">

      <div id="content" style="width: 1100px;">



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

                        <td align="center"><a
                           href="<c:url value='/centercal' />?year=<%=year - 1%>&amp;month=<%=month%>"
                           target="_self">  <!-- 이전해 -->

                        </a> <%
    if (month > 0) {
 %> <a
                           href="<c:url value='/centercal' />?year=<%=year%>&amp;month=<%=month - 1%>"
                           target="_self"> <b>&lt;</b> <!-- 이전달 -->

                        </a> <%
    } else {
 %> <b>&lt;</b> <%
    }
 %> &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월

                           &nbsp;&nbsp; <%
    if (month < 11) {
 %> <a
                           href="<c:url value='/centercal' />?year=<%=year%>&amp;month=<%=month + 1%>"
                           target="_self"> <!-- 다음달 --> <b>&gt;</b>

                        </a> <%
    } else {
 %> <b>&gt;</b> <%
    }
 %> <a
                           href="<c:url value='/centercal' />?year=<%=year + 1%>&amp;month=<%=month%>"
                           target="_self"> <!-- 다음해 --> 

                        </a></td>

                     </tr>

                  </table>



               </td>

            </tr>

         </table>

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

                     for (int index = 1; index < start; index++)

                     {

                        out.println("<TD >&nbsp;</TD>");

                        newLine++;

                     }

                     for (int index = 1; index <= endDay; index++)

                     {

                        String color = "";

                        if (newLine == 0) { //일
                           color = "RED";

                        } else if (newLine == 6) { //토
                           color = "#529dbc";

                        } else {
                           color = "BLACK"; //평일
                        }
                        ;

                        String sUseDate = Integer.toString(year);

                        sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
                              : Integer.toString(month + 1);

                        sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
                              : Integer.toString(index);

                        int iUseDate = Integer.parseInt(sUseDate);

                        String backColor = "#EFEFEF";

                        if (iUseDate == intToday) {

                           backColor = "#c9c9c9";
                        }
                        
                        for(int i = 0; i < list.size(); i++){
                           if(iUseDate==BgndList.get(i) && srcritStateList.get(i).equals("모집완료")){
                              backColor ="FAE0D4";
                           }else if(iUseDate==BgndList.get(i) && srcritStateList.get(i).equals("모집중")){
                              backColor ="#FFD9EC";
                           }
                        }
                        

                        out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap >");
                        
                  
                  %>

                  <font color='<%=color%>'> <%=index%>

                  </font>



                  <%
                     out.println("<BR>");

                        //out.println(iUseDate); //20200207 년월일 나타냄

//////////////////////////////////////////////////////////////////////
                        
                         for(int i = 0; i < list.size(); i ++){
                        if(iUseDate==BgndList.get(i)){
                           
                           //out.println(cid);
                           //out.println(progrmRegistNo);
                           out.println("<div class=\"date_wrap\" style='padding-left: 10px;'>");
                           if(srcritStateList.get(i).equals("모집완료")){
                              out.println("<i class='icon-remove'></i><strong>"+srcritStateList.get(i)+"</strong>");
                              out.println("<label id='shortening'><a href ="+"volunteerMypage/volundetail?progrmRegistNo="+VnumList.get(i)+">"+"<i class='icon-zoom-in'></i>"+progrmSjList.get(i)+"</a></label>");
                              
                              out.println("<i class='icon-user'></i>모집인원 : "+appTotalList.get(i)+"/"+rcritNmprList.get(i)+"명");

                              out.println("</div>");
                           }
                           else if(srcritStateList.get(i).equals("모집중")){
                              out.println("<i class='icon-heart'></i><strong>"+srcritStateList.get(i)+"</strong>");
                              out.println("<label id='shortening'><a href ="+"volunteerMypage/volundetail?progrmRegistNo="+VnumList.get(i)+">"+"<i class='icon-zoom-in'></i>"+progrmSjList.get(i)+"</a></label>");
                              
                              out.println("<i class='icon-user'></i>모집인원 : "+appTotalList.get(i)+"/"+rcritNmprList.get(i)+"명");

                              out.println("</div>");
                           }
                           
                           

                           }
                         }
                        
                     //   style="margin-bottom: -;margin-bottom: -;margin-bottom: -;margin-bottom: -;"
                        
                        
//////////////////////////////////////////////////////////////////////

                        out.println("<BR>");

                        //기능 제거 

                        out.println("</TD>");

                        newLine++;

                        if (newLine == 7)

                        {

                           out.println("</TR>");

                           if (index <= endDay)

                           {

                              out.println("<TR>");

                           }

                           newLine = 0;

                        }

                     }

                     //마지막 공란 LOOP

                     while (newLine > 0 && newLine < 7)

                     {

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
    </div>
  
    
  </section>
            
            <!--Body content-->
          </div>
   </div> 
</div>

</body>

 
   <!-- footer add -->
   <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>