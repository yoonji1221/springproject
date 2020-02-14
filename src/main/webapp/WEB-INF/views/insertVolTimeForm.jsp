<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script>

/*     $(function() {
      var realTime = $('input#hrealTime').val();
      
      $("#submit").on('click', function() {
         if ($("#realTime").val() == "") {
            $("#realTime").val(realTime);
         }
         else{
            alert("zzzzzzzzzzzz");
         }
      })

   }); */

</script>
 <style>
table{
margin : auto;
border: 2px solid gray;
border-collapse: collapse;
}

th, td, h3{
text-align:center;
border: 1px solid gray;
padding: 10px;
}
</style> 



</head>
<body>
   <h3>봉사활동시간 입력</h3>
   <form action="/volunteer134/insertVolTimeForm" method="post">

      <table cellspacing='0'>
         <!-- cellspacing='0' is important, must stay -->
         <thead>
            <tr>
               <th>봉사 제목</th>
               <th>봉사 날짜</th>
               <th>봉사자id</th>
               <th colspan="2">활동시간</th>
            </tr>
         </thead>
         <!-- Table Header -->
         <c:forEach items="${timeList}" var="list">
            <tbody>
               <tr>
                  <td>${list.progrmSj}</td>
                  <td>${list.progrmBgnde}</td>
                  <td>${list.id}</td>
                  <td>${list.realTime}<input type="text" name="realTime" id="realTime"> <input type="submit" value="시간입력"></td>

                  <!-- <td><a href="#yep-iit-doesnt-exist">Hyperlink Example</a></td>
                  <td>80%</td>
                  <td>80%</td>
                  <td><a href="">Another</a></td> -->
               </tr>
               <input type="hidden" id="hvid" name="hvid" class="form-control" value='${list.vid}'>
               <%-- <input type="hidden" id="hrealTime" class="form-control" value='${list.realTime}'> --%>
         </c:forEach>
         </tbody>
      </table>
   </form>
</body>
</html>



