<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다! 134 자원봉사포털 소개</title>
<meta name="description" content="Clean responsive bootstrap website template">
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'>

<style rel="stylesheet">
ol,ul,li{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:before,blockquote:after,q:before,q:after{content:'';content:none}table{border-collapse:collapse;border-spacing:0}

body {
  margin-top: 2rem;
  font: 100% "Open sans", "Trebuchet MS", sans-serif;
}

a {
  text-decoration: none;
}

/**
 * Hidden fallback
 */
[hidden] {
  display: none;
  visibility: hidden;
}

/**
 * Styling navigation
 */
header {
  margin-right: auto;
  margin-left: auto;
  max-width: 22.5rem;
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.25);
}

/**
 * Styling top level items
 */
/* .nav a {
  display: block;
  padding: .85rem;
  color: #;
  background-color: #666;
  box-shadow: inset 0 -1px #1d1d1d;
  -webkit-transition: all .25s ease-in;
          transition: all .25s ease-in;
} */

 a.submenu {
  display: block;
  padding: .85rem;
  color: #fff;
  background-color: #5b5b5b;
/*   box-shadow: inset 0 -1px #333; */
  -webkit-transition: all .25s ease-in;
          transition: all .25s ease-in;
font-size: 13px;
    font-weight: normal;
    line-height: 20px;
} 



.nav label {
  display: block;
  padding: .85rem;
  color: #fff;
  background-color: #333;
  box-shadow: inset 0 -1px #668b75;
  -webkit-transition: all .25s ease-in;
          transition: all .25s ease-in;
}
/* 
box-shadow: inset 0 -1px #1d1d1d;
#4eb478; 초록색*/
.nav a:focus, .nav a:hover,
.nav label:focus,
.nav label:hover {
  color: rgba(255, 255, 255, 0.5);
  background: #030303;
}

.nav label {
  cursor: pointer;
}

/**
 * Styling first level lists items
 */
.group-list a,
.group-list label {
  padding-left: 2rem;
  background: #252525;
  box-shadow: inset 0 -1px #373737;
}
.group-list a:focus, .group-list a:hover,
.group-list label:focus,
.group-list label:hover {
  background: #131313;
}

/**
 * Styling second level list items
 */
.sub-group-list a,
.sub-group-list label {
  padding-left: 4rem;
  background: #353535;
  box-shadow: inset 0 -1px #474747;
}
.sub-group-list a:focus, .sub-group-list a:hover,
.sub-group-list label:focus,
.sub-group-list label:hover {
  background: #232323;
}

/**
 * Styling third level list items
 */
.sub-sub-group-list a,
.sub-sub-group-list label {
  padding-left: 6rem;
  background: #454545;
  box-shadow: inset 0 -1px #575757;
}
.sub-sub-group-list a:focus, .sub-sub-group-list a:hover,
.sub-sub-group-list label:focus,
.sub-sub-group-list label:hover {
  background: #333333;
}

/**
 * Hide nested lists
 */
.group-list,
.sub-group-list,
.sub-sub-group-list {
  height: 100%;
  max-height: 0;
  overflow: hidden;
  -webkit-transition: max-height .5s ease-in-out;
          transition: max-height .5s ease-in-out;
}

.nav__list input[type=checkbox]:checked + label + ul {
  /* reset the height when checkbox is checked */
  max-height: 1000px;
}

/**
 * Rotating chevron icon
 */
label > span {
  float: right;
  -webkit-transition: -webkit-transform .65s ease;
          transition: transform .65s ease;
}

.nav__list input[type=checkbox]:checked + label > span {
  -webkit-transform: rotate(90deg);
      -ms-transform: rotate(90deg);
          transform: rotate(90deg);
}

/**
 * Styling footer
 */
footer {
  padding-top: 1rem;
  padding-bottom: 1rem;
  background-color: #050505;
}

.soc-media {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.soc-media li:nth-child(n+2) {
  margin-left: 1rem;
}

.soc-media a {
  font-size: 1.25rem;
  color: rgba(255, 255, 255, 0.65);
  -webkit-transition: color .25s ease-in;
          transition: color .25s ease-in;
}
.soc-media a:focus, .soc-media a:hover {
  color: rgba(255, 255, 255, 0.2);
}

</style>

<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
<script>
$(function(){
   
});
</script>
</head>
<body>
<div style="position:fixed; top:70px; left:0; widt:200px; height:300px; z-index:999; margin-top:260px;">
<header role="banner">
  <nav class="nav" role="navigation">
    <ul class="nav__list">
      <li>
        <input id="group-1" type="checkbox" hidden />
        <!-- 1 -->
        <label for="group-1"><span class="fa fa-angle-right"></span> 기관정보관리</label>
        <ul class="group-list">
          <li><a href="/volunteer134/centerMypageForm" id="first_1" class="submenu">기존정보</a></li>
        </ul>
      </li>
      <li>
        <input id="group-2" type="checkbox" hidden />
        <!-- 2 -->
        <label for="group-2"><span class="fa fa-angle-right"></span> 봉사활동관리</label>
        <ul class="group-list">
          <li>
            <li><a href="/volunteer134/centercal" class="submenu">봉사 일정 확인</a></li>
            <li><a href="/volunteer134/insertVolTimeForm" class="submenu">봉사 실적 관리</a></li>
            <li><a href="/volunteer134/vinfoupload" class="submenu">봉사 정보 등록</a></li>
          </li>
        </ul>
      </li>
      <%-- 
      <li>
        <input id="group-3" type="checkbox" hidden />
        <label for="group-3"><span class="fa fa-angle-right"></span>신청 현황</label>
      <ul class="group-list">
         <li>
         <li><a href="/volunteer134/volunteerMypage/${vid}/ApplicationList" class="submenu">
               신청 현황 조회</a>
         </li>
        </li>
      </ul>
      </li> --%>
        </ul>
      </li>
    </ul>
  </nav>
<!--   <footer>
    <ul class="soc-media">
      <li><a href="#" target="_blank"><span class="fa fa-twitter"></span></a></li>
      <li><a href="#" target="_blank"><span class="fa fa-facebook"></span></a></li>
      <li><a href="https://www.1365.go.kr/vols/main.do" target="_blank"><span class="fa fa-google-plus"></span></a></li>
      <li><a href="#" target="_blank"><span class="fa fa-globe"></span></a></li>
    </ul>
  </footer> -->
</header>
</div>

</body>
</html>