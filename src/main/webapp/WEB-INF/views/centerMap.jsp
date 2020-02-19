<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb31651ef6e0c7578e0ae1462b12a587&libraries=services,clusterer,drawing"></script>
</head>



<script>
//도,시 선택하면 아래주소 뽑기
$(function(){
   
   var td1 =  $("#td1").val();
   if( td1 == null){
      $("#table1").text('');
   }
   
   $("#address").change(function(){
             var selected_address = $("#address option:selected").val();
             console.log(selected_address);
             $.ajax({
                url : '/volunteer134/vinfolist/addresscheck?selected_address='+ selected_address,
                type : 'get',
                success : function(addresslist) {
                   $("#detailaddress").empty();
                   var a =  $("<option></option>");
                   $("#detailaddress").append(a);
                   for(var idx in addresslist){
                      var data2 = addresslist[idx]['postAdres']
                         var option = $("<option value='"+data2+"'>"+data2+"</option>");
                         $("#detailaddress").append(option);
                   }
                   }, error : function(e) {
                      console.log(e);
                   }
                });
             })
});

function button1_click() {

   var address = $("#address option:selected").val();
   var detailaddress = $("#detailaddress option:selected").val();
   var total = address + " " + detailaddress;
   console.log(total);
   
   $.ajax({
       url : '/volunteer134/vinfoMap/search?address='+total,
       type : 'get',
       success : function(category_list) {
          $("#map").remove();
          $("#mapPosition").html("<div id='map2' style='width: 100%; height: 500px;'></div> ");
          
       var postAdres_list = new Array();
         var mnnstNm_list = new Array();
         var cid_list = new Array();
         var content_list = new Array();
         var coords = new Array();
          
         var mapContainer = document.getElementById('map2'), 
      mapOption = {
         center : new kakao.maps.LatLng(37.485728, 126.898927), 
         level : 5
      };
       
         var map = new kakao.maps.Map(mapContainer, mapOption);
      var geocoder = new kakao.maps.services.Geocoder();
   
      var bounds = new kakao.maps.LatLngBounds();
        
          for(var idx in category_list){            
               postAdres_list[idx] = category_list[idx]['postAdres']
               mnnstNm_list[idx] = category_list[idx]['mnnstNm']
               cid_list[idx] = category_list[idx]['cid']                
               //$("#map2").append(idx + postAdres_list[idx] + '<br>'); //봉사 장소                
          }       
      
    postAdres_list.forEach(function(addr, index) {
       content_list.push('<div style="width:150px;text-align:center;padding:6px 0;">'+mnnstNm_list[index]+'</div>');
         
         geocoder.addressSearch(addr, function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                 var y = result[0].y;
                 var x = result[0].x;

                  coords[index] = new kakao.maps.LatLng(y, x);
                  
                  bounds.extend(coords[index]);
                  
                  var marker = new kakao.maps.Marker({
                      map: map,
                      position: coords[index]
                  });
                                                 
                  var infowindow = new kakao.maps.InfoWindow({
                      content: content_list[index]
                  });
                  
                   kakao.maps.event.addListener(marker, 'click', function() {                     
                  var cid = infowindow.getContent();
                  document.getElementById('cName').innerHTML = cid;
                  location.href="/volunteer134/vinfoMap/"+cid_list[index];
                  //infowindow.open(map, marker);
               }); 
                  
                  (function(marker, infowindow) {
                      kakao.maps.event.addListener(marker, 'mouseover', function() {                     
                          infowindow.open(map, marker);
                      });

                      kakao.maps.event.addListener(marker, 'mouseout', function() {
                          infowindow.close();
                      });
                  })(marker, infowindow);
                  
              } //if end
              map.setBounds(bounds);                        
          }); // geo end
      });// forEach end
      

//////////
       }, error : function(e) {
           console.log(e);
       }
   });  

    
}
</script>
<body>
<section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3><strong></strong> 전체 센터 한 눈에 보기</h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">All center</li>
          </ul>
        </div>
      </div>
    </div>
      </section>
    
      <section id="maincontent">
    <div class="container">
             <section id="global">

            <h5 id="headings">센터 위치 검색하기</h5>
            <ul>
            <li>
            134자원봉사 홈페이지에 등록된 봉사 센터들의 위치 정보를 조회할 수 있습니다.
            </li>
            <li>
           선택 가능한 주소 항목을 통해 원하는 봉사 센터를 찾아보세요.
         </li>
         <li>
           지도 위의 마커를 선택하면 해당 주소에 위치하는 센터의 봉사 정보를 조회할 수 있습니다.
            </li>
            <li>
           '자세히'버튼을 통해 봉사 정보 확인과 봉사 신청이 가능합니다.
         </li>
         <li>
            담당자 e-mail은 로그인 비밀번호로 설정되오니, 유출에 주의하세요.
         </li>
         </ul>
         
            <div class="page-header">
              <h3></h3>
            </div>
         </section>



<form method="get">
봉사 지역 : <select name="address" id="address" >
<option value="">선택해주세요.</option>
   <c:forEach items="${silist}" var="silist">
      <option value="${silist.postAdres}" name="silist">${silist.postAdres}</option>
   </c:forEach> 
</select>
<select name="detailaddress" id="detailaddress">
</select>
<input id="button1" type=button value="검색"  onclick="button1_click();">
</form>
<p id="mapPosition">
<div id="map" style="width: 100%; height: 500px;"></div>
<p> 



   <script>
      var mapContainer = document.getElementById('map'), 
      mapOption = {
         center : new kakao.maps.LatLng(37.485728, 126.898927), 
         level : 7
      };

      var map = new kakao.maps.Map(mapContainer, mapOption);
      var geocoder = new kakao.maps.services.Geocoder();

      var postAdres_list = new Array();
      var mnnstNm_list = new Array();
      var cid_list = new Array();
      var content_list = new Array();
      var coords = new Array();
      
      var bounds = new kakao.maps.LatLngBounds();  

      <c:forEach var="centervo" items="${list}">
      postAdres_list.push("${centervo.postAdres} ");
      mnnstNm_list.push("${centervo.mnnstNm} ");
      cid_list.push("${centervo.cid}");
      </c:forEach>

      
      postAdres_list.forEach(function(addr, index) {
         content_list.push('<div style="width:150px;text-align:center;padding:6px 0;">'+mnnstNm_list[index]+'</div>');
         
         geocoder.addressSearch(addr, function(result, status) {
              if (status === kakao.maps.services.Status.OK) {
                  coords[index] = new kakao.maps.LatLng(result[0].y, result[0].x);
                  bounds.extend(coords[index]);
                  var marker = new kakao.maps.Marker({
                      map: map,
                      position: coords[index]
                  });
               
                 
                  
                  var infowindow = new kakao.maps.InfoWindow({
                      content: content_list[index]
                  });
                  
                  kakao.maps.event.addListener(marker, 'click', function() {                     
                  var cid = infowindow.getContent();
                  document.getElementById('cName').innerHTML = cid;
                  location.href="/volunteer134/vinfoMap/"+cid_list[index];
                  //infowindow.open(map, marker);
               }); 
                  
                  (function(marker, infowindow) {
                      kakao.maps.event.addListener(marker, 'mouseover', function() {                     
                          infowindow.open(map, marker);
                      });

                      kakao.maps.event.addListener(marker, 'mouseout', function() {
                          infowindow.close();
                      });
                  })(marker, infowindow);
                  
              } //if end   
              map.setBounds(bounds);           
          }); // geo end
      });// forEach end
           
            
          
   </script> 
   

<div id="cName" name="cName"> </div>

<div id="includeT" style="width: 100%; top:500px;"><jsp:include page='/WEB-INF/views/centerMapTable.jsp'></jsp:include> </div>
</div>
  </section>
</section>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
   </body>
</html>