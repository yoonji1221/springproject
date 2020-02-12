<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script>

	$(function() {
		var mnnstNm = $('input#hmnnstNm').val();
		var nanmmbyNm = $('input#hnanmmbyNm').val();
		var nanmmbyNmAdmn = $('input#hnanmmbyNmAdmn').val();
		var telno = $('input#htelno').val();
		$("#submit").on('click', function() {
			if ($("#mnnstNm").val() == "") {
				alert("eeeee");
				$("#mnnstNm").val(mnnstNm);
			}
			if ($("#nanmmbyNm").val() == "") {
				$("#nanmmbyNm").val(nanmmbyNm);
			}
			if ($("#nanmmbyNmAdmn").val() == "") {
				$("#nanmmbyNmAdmn").val(nanmmbyNmAdmn);
			}
			if ($("#telno").val() == "") {
				$("#telno").val(telno);
			}
			else{
				alert("zzzzzzzzzzzz");
			}
		})

	});

</script>
</head>
<body>
<div>

<h3> 센터 마이페이지 (메인)</h3>
<form action="/volunteer134/centerMypageForm" method="post">
<c:forEach items="${centerMypageList}" var="list">
기관이름 : <input type="text" name="mnnstNm" id="mnnstNm" value='${list.mnnstNm}'><br>
센터번호 : ${list.cid }<br>
모집기관 : <input type="text" name="nanmmbyNm" id="nanmmbyNm" placeholder='${list.nanmmbyNm }'><br>
담당자이름 : <input type="text" name="nanmmbyNmAdmn" id="nanmmbyNmAdmn" placeholder='${list.nanmmbyNmAdmn}'><br>
담당자e-mail: ${list.email}<br>
담당자주소: ${list.postAdres}<br>
담당자번호: <input type="text" name="telno" id="telno" placeholder='${list.telno}'><br>
<!-- 기존 정보 유지하고 싶은 값 -->
<input type="hidden" id="hmnnstNm" class="form-control" value='${list.mnnstNm}'>
<input type="hidden" id="hnanmmbyNm" class="form-control" value='${list.nanmmbyNm }'>
<input type="hidden" id="hnanmmbyNmAdmn" class="form-control" value='${list.nanmmbyNmAdmn}'>
<input type="hidden" id="htelno" class="form-control" value='${list.telno}'>
</c:forEach>
  
<br><input type="submit" value="정보 수정" id="submit">
</form>
</div>
</body>
</html>