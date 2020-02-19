<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <% String path = request.getContextPath();%>
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
 

<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb31651ef6e0c7578e0ae1462b12a587&libraries=services,clusterer,drawing"></script>
<!-- header add -->
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
</head>
<body>
  <!-- Subhead
================================================== -->

 
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Center <strong>information</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Scaffolding</li>
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

            <h5 id="headings">자원봉사 수요기관정보</h5>
              <ul>
            <li>
            해당 봉사기관에서 제공하는 봉사기관에 대한 정보입니다.
            </li>
            <li>
            상세 내용과 다를 시 134자원봉사포털 고객센터로 문의바랍니다.
            </li>
            </ul>
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         
         <!-- Responsive design
        ================================================== -->
          <section id="responsive" class="doc">
          <c:forEach items="${list }" var="vo">
          <c:set var="address" value="${vo.postAdres}" />
        <c:set var="centerName" value="${vo.mnnstNm}" />

            <h5>${vo.mnnstNm}</h5>
              <table class="table">
              <tbody>
              <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>소속센터</strong>
                  </th>
                  <td>
                    ${vo.nanmmbyNm}
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>사무실연락처</strong>
                  </th>
                  <td>
                    ${vo.telno}
                  </td>
               </tr>
               
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>시설유형</strong>
                  </th>
                  <td>
                      민간사설시설
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>이메일</strong>
                  </th>
                  <td>
                    ${vo.email}
                  </td>
               </tr>
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>담당자명</strong>
                  </th>
                  <td>
                    ${vo.nanmmbyNmAdmn}
                  </td>
                  <th>
                      <i class="icon-certificate"></i><strong>담당자연락처</strong>
                  </th>
                  <td>
                    ${vo.telno}
                  </td>
               </tr>
               <tr>
                  <th>
                      <i class="icon-certificate"></i><strong>주소</strong>
                  </th>
                  <td>
                    ${vo.postAdres}
                  </td>
                  <th>
                  </th>
                  <td>
                  </td>
               </tr>
               <tr>
                  <th> 
                    <i class="icon-certificate"></i><strong>기관 위치</strong>
                  </th>
                  <td> 
                  </td>
                  <th>
                  </th>
                  <td>
                  </td>
               </tr>
               <tr>
                  <td colspan = 4> 
                  <div id="map" style="width:100%;height:350px;"></div>
                  </td>
               </tr>
               <tr>
                  <th> 
                
                  </th>
                  <td> 
                  </td>
                  <th>
                  </th>
                  <td>
                  </td>
               </tr>
               </tbody>
               </table>
         </c:forEach>
         </section>
         
          <section id="responsive" class="doc">
           <input type="button" value="돌아가기" onclick="location.href='/volunteer134/vinfolist'" style=" margin-left: 1100px;">
            <h5>센터의 모집봉사</h5>
           
              <table class="table table-bordered table-striped">
              <thead>
                 <tr>
                   <th>
                   봉사제목
                  </th>
                  <th>
                   봉사 날짜
                  </th>
                  <th>
                   봉사장소
                  </th>
                  <th>
                   모집상태
                 </th>
                </tr>
              </thead>
               <c:forEach items="${centerlist }" var="list">
               <tbody>
                <tr>
                  <td>
                   ${list.progrmSj}
                  </td>
                  <td>
                    ${list.progrmBgnde}
                  </td>
                  <td>
                    ${list.actPlace}
                  </td>
                  <td>
                    ${list.appTotal}/${list.rcritNmpr}명
                  </td>
                </tr>
                </c:forEach>
              </tbody>
               </table>
         </section>
         
        </div>
      </div>
    </div>
  </section>
  
  <section id="blank" class="doc">
  </section>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<c:out value="${address}" />', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><c:out value="${centerName}" /></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>         


<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>