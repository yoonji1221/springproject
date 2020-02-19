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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Myeongjo|Noto+Sans+KR&display=swap" rel="stylesheet"></head>
 
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
form{
font-family: 'Nanum Gothic', sans-serif;
        font-size: 17px;
}
select{
font-family: 'Noto Sans KR', sans-serif;
        font-size: 15px;
}
.form-control{

    width: 500px;
    height: 25px;
}

</style>
<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<script>
function erchk() {
   var flag =validation(); // 유효성 검사를 한 값
   if(flag){
      document.sub1.submit();
   }
};
$(function(){
       $('#userPw').keyup(function(){
             $('#chkNotice').html('');
       });
         
    $('#userPwChk').keyup(function(){

        if($('#userPw').val() != $('#userPwChk').val()){
          $('#chkNotice').text('비밀번호 일치하지 않음');
          $('#chkNotice').css('color', 'red');
          $("#chkNotice").css("font-size", "13px");
          $('#join').prop('disabled', true); 

        } else{
          $('#chkNotice').text('비밀번호 일치함');
          $('#chkNotice').css('color', 'blue');
          $("#chkNotice").css("font-size", "13px");
          $('#join').prop('disabled', false);
        }
    });

    //아이디 유효성 검사(1 = 중복 / 0 != 중복)
    $("#id").keyup(function() {
       var id = $('#id').val();
       $.ajax({
          url : '/volunteer134/volunjoin/user?id='+ id,
          type : 'get',
          success : function(data) {
             console.log("1 = 중복o / 0 = 중복x : "+ data);                     
             if (data == 1) {// 1 : 아이디가 중복되는 문구
                   $("#id_check").text("사용중인 아이디입니다");
                   $("#id_check").css("color", "red");
                   $("#id_check").css("font-size", "13px");
                   $("#join").attr("disabled", true);
                } else {
                      $('#id_check').text('사용가능한 아이디입니다.');
                      $('#id_check').css('color', 'blue');
                      $("#id_check").css("font-size", "13px");
                      $("#join").attr("disabled", false);            
                }
             }, error : function(e) {
                console.log(e);
             }
          });
       });
    
    $("#lar1").change(function(){
       var selected_large = $("#lar1 option:selected").val();
       console.log( selected_large);
       $.ajax({
          url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
          type : 'get',
          success : function(category_list) {
             $("#med1").empty();
             for(var idx in category_list){
                var data = category_list[idx]['medium']
                   var option = $("<option value='"+data+"'>"+data+"</option>");
                   $("#med1").append(option);
             }
             }, error : function(e) {
                console.log(e);
             }
          });
       })
     $("#lar2").change(function(){
       var selected_large = $("#lar2 option:selected").val();
       console.log( selected_large);
       $.ajax({
          url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
          type : 'get',
          success : function(category_list) {
             $("#med2").empty();
             for(var idx in category_list){
                var data = category_list[idx]['medium']
                   var option = $("<option value='"+data+"'>"+data+"</option>");
                   $("#med2").append(option);
             }
             }, error : function(e) {
                console.log(e);
             }
          });
       })
       
       $("#lar3").change(function(){
       var selected_large = $("#lar3 option:selected").val();
       console.log(selected_large);
       $.ajax({
          url : '/volunteer134/volunjoin/precheck?selected_large='+ selected_large,
          type : 'get',
          success : function(category_list) {
             $("#med3").empty();
             for(var idx in category_list){
                var data = category_list[idx]['medium']
                   var option = $("<option value='"+data+"'>"+data+"</option>");
                   $("#med3").append(option);
             }
             }, error : function(e) {
                console.log(e);
             }
          });
       })
       
       //휴대폰 인증
       $("#phonecheck").click(function(){
          
          var number = Math.floor(Math.random() * 100000) + 100000;
            if(number>100000){
               number = number - 10000;
            }

            $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
         
         var to = $("#to").val();
       
         if(to == "" || to == null){
            alert("빈칸이나 공백을 채워주세요");
             return; 
         }
         
         var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
            
            if(!con_test){
               return;
            }
          
          $.ajax({
              url : '/volunteer134/volunjoin/phonecheck',
              data : {
                 to: $("#to").val(),
                    text: $("#text").val()
              },
             type : 'get',
             success : function(data){
                alert("문자 발송에 성공하였습니다");
                
                
             },error : function(e) {
                console.log(e);
             }
          });
       })
       
 });
    
function  validation(){
    var flag = false;
    var length = $("input:radio[name='gender']:checked").length;
    
    var reqlength = $("input:checkbox[name='req']:checked").length;
   console.log(reqlength);
   
    if($("#id").val() == "" ){
      console.log($("#id").val());
      alert("아이디칸이 비었습니다");
   }else if($("#userPw").val() == "" ){
      alert("비밀번호칸이 비었습니다");
   }else if($("#name").val() == "" ){
      console.log($("#name").val());
      alert("이름칸이 비었습니다");
   }else if($("#phone").val() == "" ){
      alert("전화번호칸이 비었습니다");
   }else if($("#email").val() == "" ){
      alert("이메일칸이 비었습니다");
   }else if($("#address").val() == "" ){
      alert("주소칸이 비었습니다");
   }else if(length <= 0){
      alert("성별을 선택하세요");
   }else if(reqlength <= 0){
      alert("개인정보 약관에 동의하셔야 합니다.");
   }else if($("#userNum").val() != $("#text").val()){
      alert("인증번호를 확인해주세요");
   }
   else{
      flag = true;
   } return flag;
}

function openZipSearch() {
   new daum.Postcode({
      oncomplete: function(data) {
         $('[name=address]').val(data.address);
      }
   }).open();
}
</script>
</head>
<!-- <body  style="width: 1000px;
    margin-left: 100px;
   background-color: #f5f5f5;"> -->


  
  
<!-- Subhead
================================================== -->
  <section id="subintro">

    <div class="container">
      <div class="row">
        <div class="span4">
          <h3>Join 134Volunteer <strong>Family</strong></h3>
        </div>
        <div class="span8">
          <ul class="breadcrumb notop">
            <li><a href="/volunteer134/home">Home</a><span class="divider">/</span></li>
            <li class="active">Join</li>
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

            <h5 id="headings">봉사해봉 회원가입 이용약관</h5>
            
            <textarea style="margin: 0px 0px 10px; width: 1100px; height: 150px;">
제 1장 총칙
제 1 조 (목적)
이 이용약관(이하 "약관"이라 합니다.)은 이용고객(이하 "회원"이라 합니다)이 134자원봉사포털 서비스(이하 "134자원봉사포털’이라 합니다)의 자원봉사 분야를 이용함에 있어 134자원봉사포털과 회원 간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
- “134자원봉사포털” 이라 함은 자원봉사를 신청할 수 있는 1365 자원봉사 시스템을 포함한 관련 사이트 전체를 말합니다.
- "회원"이라 함은 이 약관에 동의하고 서비스를 이용하는 이용자를 말합니다.
- "이용계약"이라 함은 이 약관을 포함하여 서비스 이용과 관련하여 134자원봉사포털 회원 간에 체결하는 모든 계약을 말합니다.
- "ID(이하 “아이디”라 합니다)"라 함은 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 134자원봉사포털이 회원별로 부여하는 문자와 숫자의 고유한 조합을 말합니다.
- "비밀번호"라 함은 아이디로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 등록한 문자(특수문자 포함)와 숫자 의 조합을 말합니다.
- “자원봉사” 라 함은 자원봉사활동 참여, 실적확인 등의 정보를 제공하는 서비스를 말합니다.
- 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도약관 및 이용규정에서 정의합니다.
제 3 조 (이용약관의 효력 및 변경)
(1) 이 약관은 134자원봉사포털을 통해 온라인으로 공시되고 회원의 동의와 134자원봉사포털의 승낙을 거쳐 효력이 발생하며, 합리적인 사유가 발생할 경우 134자원봉사포털은 관련 법령에 위배되지 않는 범위 안에서 본 약관을 개정할 수 있습니다. 개정된 약관은 정당한 절차 에 따라 134자원봉사포털을 통해 공지됨으로써 효력이 발휘됩니다.
(2) 회원은 정기적으로 134자원봉사포털을 방문하여 약관의 변경사항을 확인하여야 합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 134자원봉사포털에서 책임지지 않습니다.
(3) 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있습니다.
제 4 조 (약관 외 준칙)
134자원봉사포털은 필요한 경우 서비스 내의 개별항목에 대하여 개별약관 또는 운영원칙(이하 "서비스별 안내"라 합니다)을 정할 수 있으며, 이 약관과 서비스별 안내의 내용이 서로 상충되는 경우에는 서비스별 안내의 내용을 우선하여 적용합니다.

제 2 장 이용계약 체결
제 5 조 (이용 계약의 성립)
(1) 이용계약은 회원의 이용계약 내용에 대한 동의와 이용신청에 대한 134자원봉사포털의 이용승낙으로 성립합니다.
(2) 이용계약에 대한 동의는 회원가입 당시 표준이용 약관 상의 "동의" 버튼을 누름으로써 의사표시를 합니다.
제 6 조 (서비스 이용 신청)
(1) 회원으로 가입하여 서비스를 이용하고자 하는 이용자는 134자원봉사포털에서 요청하는 제반 정보(아이디, 비밀번호, 이름, 주소 등 필수 정보)를 제공하여야 합니다.
(2) 모든 회원은 반드시 회원 본인의 정보를 제공하여야만 서비스를 이용할 수 있으며, 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 서비스 이용과 관련하여 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수도 있습니다.
(3) 회원가입은 반드시 회원 본인의 정보로만 가입하여야 하며 134자원봉사포털은 회원이 등록한 정보에 대하여 확인조치를 할 수 있습 니다. 회원은 134자원봉사포털의 확인조치에 대하여 적극 협력하여야 하며, 만일 이를 준수하지 아니할 경우 회원이 등록한 정보가 부정한 것으로 간주, 처리할 수 있습니다.
(4) 중복 가입에 따라 발생하는 문제(봉사실적 확인불가, 서비스 이용제한 등)는 회원의 책임이며, 134자원봉사포털 운영기관은 책임지지 않습니다.
제 7 조 (개인정보의 보호 및 사용)
(1) 134자원봉사포털은 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력하며, 개인정보의 보호 및 사용에 대해서 는 관련 법령 및 134자원봉사포털의 개인정보 보호정책이 적용됩니다. 단, 134자원봉사포털의 공식 사이트 이외의 링크된 사이트에서는 134자원봉사포털의 개인정보 보호정책이 적용되지 않습니다. 또한, 회원은 비밀번호 등이 타인에게 노출되지 않도록 철저히 관리해야 하 며 134자원봉사포털은 회원의 귀책사유로 인해 노출된 정보에 대해서 책임을 지지 않습니다.
(2) 134자원봉사포털은 다음과 같은 경우에 법이 허용하는 범위 내에서 회원 본인의 동의여부와 상관없이 회원의 개인정보를 제3자에게 제공할 수 있습니다.
- 범죄의 수사나 공소의 제기 및 유지에 필요한 경우
- 법원의 재판업무수행을 위하여 필요한 경우
- 회원의 법령 또는 약관의 위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우
- 기타 법령에 의해 요구되는 경우
(3) 134자원봉사포털은 회원이 연계기관 정보제공에 동의한 경우 개인정보를 제3자에게 제공할 수 있습니다.
- 유관부처 및 유관기관 자원봉사 정보 연계가 필요한 경우
- 단체 정보 및 단체 자원봉사 정보 연계를 위하여 필요한 경우
- 개인별 자원봉사 실적 정보 연계를 위하여 필요한 경우
- 자치단체 자원봉사 홈페이지 정보연계를 위하여 필요한 경우
- 기타 자원봉사 관련 정보 연계가 필요한 경우
제 8 조 (이용 신청의 승낙과 제한)
(1) 134자원봉사포털은 제5조, 제6조의 규정에 의한 이용신청에 대하여 업무 수행상 또는 기술상 지장이 없는 경우에 원칙적으로 접수 순서에 따라 서비스 이용을 승낙합니다.
(2) 134자원봉사포털은 아래사항에 해당하는 경우에 대해서 승낙을 보류할 수 있습니다.
- 회원 본인정보가 아닌 부정한 정보를 제공한 경우
- 법령 위반 또는 사회의 안녕과 질서, 미풍양속을 저해할 목적으로 신청한 경우
- 부정한 용도로 본 서비스를 이용하고자 하는 경우
- 법에서 제한하는 정치와 관련된 내용으로 인식되는 경우
- 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우
(3) 134자원봉사포털은 서비스 이용신청이 다음 각 호에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
- 134자원봉사포털의 설비의 여유가 없는 경우
- 134자원봉사포털의 기술상 지장이 있는 경우
- 기타 134자원봉사포털의 정책상 이용승낙이 곤란한 경우
(4) 134자원봉사포털은 이용신청고객이 관계 법령에서 규정하는 미성년자일 경우 법정대리인의 동의가 없으면 개인정보 보호정책에 따 라 승낙을 보류할 수 있습니다.
(5) 134자원봉사포털은 회원 가입 절차 완료 이후 제(2)항 각 호에 따른 사유가 발견된 경우 이용 승낙을 철회할 수 있습니다.
제 9 조 (이용자 아이디 부여 및 변경 등)
(1) 134자원봉사포털은 회원에 대하여 약관에 정하는 바에 따라 아이디를 부여합니다.
(2) 아이디는 원칙적으로 변경이 불가하며 회원당 1개의 아이디를 원칙으로 합니다. 부득이한 사유로 인하여 변경하고자 하는 경우에는 해당 아이디를 해지하고 재가입하여야 하며, 해지된 아이디는 재사용할 수 없습니다. 회원이 2개 이상의 아이디를 가지는 경우에 따라 발생하는 문제는 회원에게 있으며 134자원봉사포털이 책임지지 않습니다.
(3) 다음 각 호에 해당하는 경우에는 134자원봉사포털의 요청 또는 직권으로 아이디 이용을 정지할 수 있습니다.
- 아이디가 2개 이상 및 전화번호 또는 주민등록번호 등으로 등록되어 사생활 침해가 우려되는 경우
- 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우
- 134자원봉사포털, 134자원봉사포털의 서비스 또는 운영자 등의 명칭과 동일하거나 오인 등의 우려가 있는 경우
- 기타 정지에 대해 필요한 사유가 있는 경우
(4) 아이디 및 비밀번호의 관리책임은 회원에게 있습니다. 이를 소홀이 관리하여 발생하는 서비스 이용상의 손해 또는 제3자에 의한 부정이용 등에 대한 책임은 회원에게 있으며 134자원봉사포털은 그에 대한 책임을 지지 않습니다.
(5) 기타 회윈의 개인정보 관리 및 변경 등에 관한 사항은 서비스별 안내에 정하는 바에 의합니다.
제 3 장 계약 당사자의 의무
제 10 조 (134자원봉사포털의 의무)
(1) 134자원봉사포털은 회원이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 합니다.
(2) 134자원봉사포털은 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구합니다.
(3) 134자원봉사포털은 개인정보 보호를 위해 보안시스템을 구축하며 개인정보 보호정책을 공시하고 준수합니다.
(4) 134자원봉사포털 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리 하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
제 11 조 (회원의 의무)
(1) 회원은 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 본인의 진정한 정보로 작성하여야 하며, 허위 또 는 타인의 정보를 등록할 경우 이와 관련된 모든 권리를 주장할 수 없습니다.
(2) 회원은 약관에서 규정하는 사항과 기타 134자원봉사포털이 정한 제반 규정, 공지사항 등 134자원봉사포털이 공지하는 사항 및 관계 법령을 준수하여야 하며, 기타 134자원봉사포털의 업무에 방해가 되는 행위, 134자원봉사포털의 명예를 손상시키는 행위, 타인에게 피해를 주는 행위를 해서는 안됩니다.
(3) 회원은 개인정보수정화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 아이디 등은 수정이 불가능합니다.
(4) 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 이메일, 팩스 등 기타 방법으로 134자원봉사포털에 변경사항을 알려야 합니다.
(5) 제4항의 변경사항을 134자원봉사포털에 알리지 않아 발생한 불이익에 대하여 134자원봉사포털은 책임지지 않습니다.
(6) 회원은 134자원봉사포털의 사전승낙 없이 서비스를 이용하여 영업활동을 할 수 없으며, 그 영업활동의 결과에 대해 134자원봉사포털은 책임을 지지 않습니다. 또한 회원은 이와 같은 영업활동으로 134자원봉사포털이 손해를 입은 경우, 회원에게 약관 21조의 절차에 따라 법적 책임을 물을 수 있습니다.
(7) 회원은 134자원봉사포털의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으며 이를 담보로 제공할 수 없습니다.
(8) 회원은 134자원봉사포털 및 제 3자의 지적 재산권을 포함한 제반 권리를 침해하거나 제17조 각 호에 해당하는 행위는 제한됩니다.
제 4 장 서비스의 이용
제 12 조 (서비스 이용 시간)
(1) 서비스 이용은 134자원봉사포털의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1년 365일 24시간 운영을 원칙으로 합니다. 다만, 시스템 정기점검, 증설 및 교체를 위해 134자원봉사포털이 정한 날이나 시간에 134자원봉사포털 서비스를 중단할 수 있으며, 예정되어 있는 작업으로 인한 서비스 일시 중단은 공지사항을 통해 사전에 공지합니다.
(2) 134자원봉사포털은 긴급한 시스템 점검, 증설 및 교체, 설비의 장애, 서비스 이용의 폭주, 국가비상사태, 정전 등 부득이한 사유가 발생한 경우 사전 예고 없이 일시적으로 서비스의 전부 또는 일부를 중단할 수 있습니다.
(3) 134자원봉사포털은 서비스 개편 등 서비스 운영 상 필요한 경우 회원에게 사전 예고 후 서비스의 전부 또는 일부의 제공을 중단할 수 있습니다.
제 13 조 (회원의 게시물 등)
(1) "게시물"이라 함은 회원이 서비스에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
(2) 회원이 서비스에 등록하는 게시물 등으로 인하여 타인의 저작권을 침해하거나 본인 또는 타인에게 손해 및 기타 문제가 발 생하는 경우 회원은 이에 대한 민, 형사상의 책임을 지게 되며, 134자원봉사포털은 특별한 사정이 없는 한 이에 대하여 책임을 지지 않습니다.
(3) 134자원봉사포털은 다음 각 호에 해당하는 게시물 등의 경우 회원의 사전 동의 없이 임의로 중단, 수정, 삭제, 이동 또는 등록 거부 등의 관련 조치를 취할 수 있습니다.
- 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
- 불법복제 또는 해킹을 조장하는 내용인 경우
- 영리를 목적으로 하는 광고일 경우
- 법에서 제한하는 정치와 관련된 내용으로 판단되는 경우
- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
- 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
- 사적인 정치적 판단이나 종교적 견해의 내용으로 134자원봉사포털 서비스 성격에 부합하지 않는다고 판단하는 경우
- 134자원봉사포털에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
- 기타 관계법령에 위배된다고 판단되는 경우
(4) 134자원봉사포털은 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 임의로 이를 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 134자원봉사포털에 접수된 경우 이에 따릅니다.
(5) 해당 게시물 등에 대하여 임의 게시중단이 된 경우, 게시물을 등록한 회원은 재게시를 134자원봉사포털에 요청할 수 있으며, 게시 중단일로부터 3개월 내에 재게시를 요청하지 아니한 경우 134자원봉사포털은 이를 삭제할 수 있습니다.
제 14 조 (게시물에 대한 저작권)
(1) 134자원봉사포털이 작성한 게시물 또는 저작물에 대한 저작권 및 기타 지적재산권은 134자원봉사포털에 귀속됩니다.
(2) 회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 134자원봉사포털은 서비스의 운영, 전시, 전송, 배포, 홍보의 목적으로 회원의 별도의 허락 없이 저작권법에 규정하는 공정한 관행에 합치하는 합리적인 범위 내에서 다음과 같이 회원이 등록한 게시물을 무상으로 사용할 수 있습니다.
- 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물성을 해치지 않는 범위 내에서의 편집 저작물 작성
- 미디어, 통신사 등 서비스 제휴 파트너에게 회원의 게시물 내용을 제공, 전시 혹은 홍보하게 하는 것. 단, 이 경우 134자원봉사포털의 별도의 동의 없이 회원의 아이디 외에 회원의 개인정보를 제공하지 않습니다.
(3) 134자원봉사포털은 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 이메일 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다.
(4) 회원이 이용계약 해지를 한 경우 본인 계정에 기록된 게시물은 삭제되지 않습니다.
제 15 조 (정보의 제공)
(1) 134자원봉사포털은 회원에게 서비스 이용에 필요가 있다고 인정되는 각종 정보에 대해서 이메일이나 우편, 전화 등의 방법으로 사전동의를 받아 제공할 수 있습니다.
(2) 134자원봉사포털은 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 관련 법령에 따라 추가적인 개인정보 를 수집할 수 있습니다.
제 5 장 계약 해지 및 이용 제한
제 16 조 (계약 변경 및 해지)
(1) 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 온라인 이메일 팩스 유선통신 등을 이용해 가입 해지를 해야 합니다.
(2) 134자원봉사포털은 회원이 이용계약을 해지하는 경우 134자원봉사포털의 개인정보 보호정책에 따라 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하며, 134자원봉사포털이 직권으로 이용계약을 해지하고자 하는 경우에는 말소 전에 회원에게 소명의 기회를 부여합니다.
제 17 조 (서비스 이용제한)
134자원봉사포털은 회원이 서비스 이용내용에 있어서 본 약관 제 11조 내용을 위반하거나, 다음 각 호에 해당하는 경우 서비스 이용 제한, 초기화, 이용계약 해지 및 기타해당 조치를 할 수 있습니다.
- 회원정보에 부정한 내용을 등록하거나 타인의 아이디 또는 2개 이상의 아이디 소유, 비밀번호 기타 개인정보를 도용하는 행위 또는 아이디를 타 인과 거래하거나 제공하는 행위
- 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용 또는 타인의 명예나 프라이버시를 침해할 수 있는 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 이메일 또는 기타의 방법으로 타인에게 유포하는 행위
- 134자원봉사포털로부터 특별한 권리를 부여 받지 않고 134자원봉사포털의 프로그램을 변경하거나, 134자원봉사포털의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
- 서비스를 통해 얻은 정보를 134자원봉사포털의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사용 하거나, 제 3자에게 제공하는 행위
- 134자원봉사포털의 운영진, 직원 또는 관계자를 사칭하거나 고의로 서비스를 방해하는 등 정상적인 서비스 운영에 방해가 될 경우
- 중앙행정기관 등 관련 공공기관의 시정 요구가 있는 경우
- 서비스 이용제한의 타당한 사유가 발생한 경우
- 약관을 포함하여 134자원봉사포털이 정한 제반 규정을 위반하거나 범죄와 결부된다고 객관적으로 판단되는 등 제반 법령을 위반하는 행위
제 6 장 손해배상 및 기타사항
제 18 조 (손해배상)
(1) 134자원봉사포털 회원은 서비스 이용과 관련하여 고의 또는 과실로 상대방에게 손해를 끼친 경우에는 이를 배상하여야 합니다.
(2) 134자원봉사포털은 무료로 제공하는 서비스의 이용과 관련하여 개인정보 보호정책에서 정하는 내용에 위반하지 않는 한 어떠한 손해도 책임을 지지 않습니다.
제 19 조 (면책조항)
(1) 134자원봉사포털은 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
(2) 134자원봉사포털은 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
(3) 134자원봉사포털은 이용자의 컴퓨터 사용오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 이메일 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.
(4) 134자원봉사포털 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 지지 않으며, 서비스를 이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다.
(5) 134자원봉사포털은 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않으며, 회원 상호간 및 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없고, 이로 인한 손해를 배상할 책임도 없습니다.
(6) 134자원봉사포털은 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 아니합니다.
제 20 조 (통지)
당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.
제 21 조 (재판권 및 준거법)
(1) 이 약관에 명시되지 않은 사항은 개인정보 보호법 등 대한민국의 관계법령과 상관습에 따릅니다.
(2) 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 대한민국의 법원에 제기합니다.
부칙
1. 본 약관은 2020년 2월 18일부터 적용됩니다.
부칙
1. 본 약관은 2020년 2월 19일부터 적용됩니다.</textarea><br>
            <input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다.
            <div class="page-header">
              <h3></h3>
            </div>
         </section>
         
          <!-- Responsive design
        ================================================== --> 
   
          <section id="responsive" class="doc">
         <div class="contaioner">

         <h5>기본 정보</h5>
         <p>
                 <i class="icon-ok"></i><strong>필수 입력 사항입니다.</strong>
            </p>               
         <form action="<%=path %>/volunjoin" name="sub1" method="post" style="height: 600px;
    width: 700px; margin-left: 350px;">
          <table class="table">
          <input type="hidden" id="text">
         <tbody>
            <tr>
                  <td>
                      <i class="icon-ok"></i><strong>아이디</strong>
                  </td>
                  <td>
                    <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력하세요" style="width:300px;"><span id="id_check"></span>
                  </td>
                 </tr>
            <tr>
                  <td>
                      <i class="icon-ok"></i><strong>비밀번호</strong>
                  </td>
                  <td>
                    <input type="password" id="userPw" name="pw" class="form-control" placeholder="비밀번호를 입력하세요" style="width:300px;">
                  </td>
                 </tr>
                 <tr>
                  <td>
                      <i class="icon-ok"></i><strong>비밀번호 확인</strong>
                  </td>
                  <td>
                    <input type="password" id="userPwChk" class="form-control" placeholder="비밀번호를 한 번 더 입력하세요" style="width:300px;">&nbsp; 
               <span id="chkNotice"></span>
                  </td>
                 </tr>
                <tr>
                  <td>
                      <i class="icon-ok"></i><strong>이름</strong>
                  </td>
                  <td>
                    <input type="text" id="name"name="name" class="form-control" placeholder="이름을 입력하세요">
                  </td>
                 </tr>

            <tr>
                  <td>
                      <i class="icon-ok"></i><strong>성별</strong>
                  </td>
                  <td>
                    <input type="radio" id="gender" name="gender" value="male">남성&nbsp;&nbsp;
                      <input type="radio" id="gender1" name="gender" value="female">여성
                    </td>
                 </tr>

            
                 <tr>
                  <td>
                      <i class="icon-ok"></i><strong>전화번호</strong>
                  </td>
                  <td>
                    <input type="text" name="phone" id="to" class="form-control" placeholder="전화번호를 입력하세요" style="width:300px;">
                    <input type="button" id="phonecheck" value="인증번호 받기" class="btn"> <br>
                    <input type="text" id="userNum" placeholder="인증번호를 입력해주세요" class="form-control" style="width:300px;"> 
                  </td>
                 </tr>
                 <tr>
                  <td>
                      <i class="icon-ok"></i><strong>주소</strong>
                  </td>
                  <td>
                    <input type="text" name="address" class="form-control" placeholder="주소를 입력하세요" style="width:300px;" >
               <button type="button" onclick="openZipSearch()">주소찾기</button>
                  </td>
                 </tr>
                 <tr>
                  <td>
                      <i class="icon-ok"></i><strong>이메일</strong>
                  </td>
                  <td>
                     <input type="text" name="mail" class="form-control" placeholder="이메일을 입력하세요"><br>
                  </td>
                 </tr>
                 <tr>
                  <td>
                      <strong>선호봉사1</strong>
                  </td>
                  <td>
               <select name="large1" id="lar1" class="selectpicker" >
               <option>선택안함</option>
                  <c:forEach items="${prelist }" var="prelist">
                  <option value="${prelist.large}" name="large1">${prelist.large}</option>
                </c:forEach> 
               </select>
               <select name="medium1" id="med1" class="selectpicker">
               </select>
              </td>
                 </tr>
            <tr>
                  <td>
                      <strong>선호봉사2</strong>
                  </td>
                  <td>
               <select name="large2" id="lar2" class="selectpicker">
               <option>선택안함</option>
                  <c:forEach items="${prelist }" var="prelist">
                     <option value="${prelist.large}" name="large2">${prelist.large}</option>
                  </c:forEach> 
               </select>
               <select name="medium2" id="med2" class="selectpicker">
                  
               </select>
              </td>
                 </tr>
                 <tr>
                  <td>
                      <strong>선호봉사3</strong>
                  </td>
                  <td>
               <select name="large3" id="lar3" class="selectpicker">
               <option>선택안함</option>
                  <c:forEach items="${prelist }" var="prelist">
                     <option value="${prelist.large}" name="large3">${prelist.large}</option>
                  </c:forEach> 
               </select>
               <select name="medium3" id="med3" class="selectpicker">
               </select>
              </td>
                 </tr>
                 </tbody>
                 </table>
                 
            <div style="float:left;">
            <input onclick="erchk()" type="button" id="join" value="회원가입" disabled="disabled" class="btn btn-color" 
            style="
                margin-left: 80px;
                width: 174px;
                height: 48px;">
            </div>
            <div style="float: center;">
            <input type="button" value="돌아가기" 
            onclick="location.href='/volunteer134/vinfolist'" class="btn btn-color" style="width: 174px;
                height: 48px;
                margin-left: 50px;">
                </div>
             </form>
          </section>
        </div>
      </div>
    </div>
  </section>
  
  <section id="blank" class="doc">
  </section>   
  
</body>
<!-- footer add -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</html>