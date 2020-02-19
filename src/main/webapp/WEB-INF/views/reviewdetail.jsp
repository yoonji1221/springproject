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
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>


  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
  
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">
 
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
            <li class="active">Review</li>
          </ul>
        </div>
      </div>
    </div>

  </section>

<div class="container">

            <h4>상세 리뷰 보기</h4>
            <p> 봉사자 후기입니다.</p>


<c:forEach items="${list2 }" var="vo">
              <table class="table">
                <thead>
                  <tr>
                    <th nowrap>제목</th>
                    <th>
                      ${vo.title}
                    </th>
             
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td nowrap>
                      	조회수
                    </td>
                    <td>
                      ${vo.viewcount}
                    </td>
                    
                    </tr>
                 <!--  -->
                     <tr>
                    <td nowrap>
                      	작성 시간
                    </td>
                    <td>
                      ${vo.time}
                    </td>
                    
                    </tr>
                 <!--  -->
                 
                  <tr>
                    <td nowrap>
                      	내용
                    </td>
                    <td>
                      ${vo.contents}
                    </td>
                    
                    </tr>
                 
                 
                </tbody>
              </table>
              
              </c:forEach>
              <input type="button" value="돌아가기" onclick="location.href='/volunteer134/reviewlist'">
            </div>








</body>

<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>