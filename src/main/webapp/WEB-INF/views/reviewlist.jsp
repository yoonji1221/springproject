<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path = request.getContextPath();%>
     
<!DOCTYPE html>
<html lang="en"> 

<head>
  <meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">


<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


</head>


<body>
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3><strong>리뷰</strong> 보기</h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Review </li>
          </ul>
        </div>
      </div>
    </div>

  </section>
<div class="container-fluid" style="margin-top: 50px;"> <!-- 1번 div -->
   <div class="row-fluid"> <!-- 2번 div -->
     
<div class="container">

            <h5>봉사 후기</h5>
            <p>
             함께 따뜻했던 봉사의 추억을 나눠봅시다.
            </p>
            <table class="table table-bordered table-striped">
              <thead>
               	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
              </thead>
              <tbody>
           	<c:forEach items="${list }" var="vo">
	<tr>
	 <td>${vo.rid}</td>
	 <td ><a style="color: #000000;" href="<%=path %>/reviewdetail?rid=${vo.rid}">${vo.title}</a></td>
	 <td>${vo.name}</td> 
	 <td>${vo.viewcount}</td>
	</tr>
	</c:forEach>
              </tbody>
            </table>
         
</div>
            <!--Body content-->
          </div>
   </div> 
</div>

<%--             <h5>봉사 후기</h5>
            <p>
             함께 따듯했던 봉사의 추억을 나눠봅시다.
            </p>

              <table class="table table-hover">
                <thead>
               	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
              </thead>
              <tbody>
           	<c:forEach items="${list }" var="vo">
	<tr>
	 <td>${vo.rid}</td>
	 <td><a href="<%=path %>/reviewdetail?rid=${vo.rid}">${vo.title}</a></td>
	 <td>${vo.name}</td> 
	 <td>${vo.viewcount}</td>
	</tr>
	</c:forEach>
              </tbody>
              </table> --%>







</body>


<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>
