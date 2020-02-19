<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path = request.getContextPath();%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">

<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


</head>

<body>

<section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>내가 작성한 봉사 후기  <strong> </strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">My page</li>
          </ul>
        </div>
      </div>
    </div>

  </section>
<div class="container-fluid" style="margin-top: 100px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
      <div class="span2">
           <!--Sidebar content--> 
           <jsp:include page="/WEB-INF/views/volunteerLeftMenu.jsp"></jsp:include>
           <!--Sidebar content--> 
        </div>
         
         <div class="span10"> 
            <!--Body content-->
            

   
     <p>
             내가 작성한 봉사 후기입니다.
            </p>
            
            
              <table class="table table-bordered table-striped">
              <thead>
                  <tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
              </thead>
              <tbody>
   <c:forEach items="${list }" var="vo">
   <tr>
    <td>${vo.rid}</td>
    <td><a style="color: #000000;" href="<%=path %>/reviewdetailmp?rid=${vo.rid}">${vo.title}</a></td>
    <td>${vo.name}</td> 
    <td>${vo.viewcount}</td>
   </tr>
   </c:forEach>
              </tbody>
            </table>
            
            <!--Body content-->
          </div>
   </div> 
</div>


   
   



</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</html>