<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

/* $(document).ready(function() {

	$('#large').click(function() {
	alert($('select[name=large]').val());


			$.ajax({
				console.log("dadadad");
				url : '/volunteer134/vinfoupload',
				type : 'get',
				dataType : 'json',
				data : $("#large option:selected").val(),
				success : function(data) {
					 console.log(data.mlist.length);  
					if (data.mlist.length > 0) {
						 $("#mcheck").attr("disabled", true);
					} 
				},
				error : function(x, o, e) {
					var msg = "페이지 호출 중 에러 발생 \n" + x.status + " : " + o
							+ " : " + e;
					alert(msg);
				}
			});
	
	}); */
	
/* 	   function category(large){
      $.ajax({
         type: "get",
         url : '/volunteer134/vinfoupload',
         dataType : 'json',
         data:{param:large},      //맞는지 모르겠음
         success: function(result){
            
            //select box 초기화
            $("#medium").find("option").remove().end.append("<option value=''>전체</option>");
            
            //배열개수만큼 option 추가
            $.each(result, function(i){
               $("#medium").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
            });
         },
         error: function(jqXHR, textStatus, errorThrown){
            alert("오류 발생함");
         }
      });
   } */
   
 $(function(){  
   $("#large").change(function(){
	   var selected_large = $("#large option:selected").val();
	console.log(selected_large);
	$.ajax({
		type: "get",
        url : '/volunteer134/vinfoupload/precheck?selected_large='+selected_large,
        success: function(category_list){
        	$("#medium").empty();
        	for(var idx in category_list){
        		var data = category_list[idx]['medium']
        		var option =$("<option>"+data+"</option>");
        		$("#medium").append(option);
        	}
        }, error : function(e){
        	console.log(e);
        }
	});
   });
 })

	
	
</script>

</head>
<body>


	<h1>봉사 정보 등록하기</h1>
	<form action="<%=path%>/vinfoupload" method="post">
		센터 이름: <br> 센터 주소: <br> 
		봉사 제목: <input type=text name="progrmSj"><br> 
		봉사 날짜: <input type=text name="progrmBgnde"><br>
		봉사 시작 시간: <input type=text name="actBeginTm"><br> 
		봉사 종료 시간: <input type=text name="actEndTm"><br> 
		모집 시작: <input type=text name="noticeBgnde"><br> 
		모집 종료: <input type=text name="noticeEndde"><br> 
		모집 인원: <input type=text name="rcritNmpr"><br> 
		봉사 분야:
		<select name="large" id="large">
		<c:forEach items="${large }" var="vo">
			<option value="${vo}">${vo}</option>
		</c:forEach>
		</select> 

<%-- 		<select name="medium">
		<c:forEach items="${medium }" var="vo">
			<option value="${vo}">${vo}</option>
		</c:forEach>
		</select> --%>
		
		
	<select name="medium" id="medium">
         <!-- <option value="">전체</option> -->
      </select>
		
		<br>
<%-- 		<select name="sub" id="sub">
			 <span id="mcheck">  <c:forEach items="${mlist }" var="vo">
					<option>${vo}</option>
				</c:forEach>
		 </span>
		</select> <br>  --%>
      
      
		봉사 장소: <input type=text name="actPlace"><br>
		상세 내용: <input type=text name="progrmCn"><br> 
		<input type="submit" value="봉사정보 입력완료">

	</form>


</body>
</html>