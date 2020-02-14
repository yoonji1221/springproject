<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>volunteer</title>
<!--<link rel="stylesheet" href="/volunteer134/resources/css/styles.css"> -->  
<%-- 	<link href="<c:url value="/resources/css/navbar_techandall.css" />" rel="stylesheet"> --%>
	<link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet">
	<script src="/volunteer134/resources/jquery-3.2.1.min.js"></script>
</head>
<body>
<!-- style.css -->
 <div id='cssmenu'>
<ul>
   <li><a href='/volunteer134/vinfolist'
   style="margin-left: 550px;">봉사안내</a></li>
   <li class='active has-sub'
   style="margin-left: 50px;"><a href='#'>봉사참여</a>
      <ul>
         <li class='has-sub'><a href='#'>Product 1</a>
            <ul>
               <li><a href='#'>Sub Product</a></li>
               <li><a href='#'>Sub Product</a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'>Product 2</a>
            <ul>
               <li><a href='#'>Sub Product</a></li>
               <li><a href='#'>Sub Product</a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li><a href='#'
   style="margin-left: 50px;">봉사신청</a></li>
   <li><a href='/volunteer134/reviewlist'
   style="margin-left: 50px;">봉사후기</a></li>
</ul>
</div> 

<!-- <body bgcolor="#333333">
<div class="container">
<div>
              <label class="mobile_menu" for="mobile_menu">
              <span>Menu</span>
              </label>
              <input id="mobile_menu" type="checkbox">
              <ul class="nav">
              <li><a href="#"><i class="icon-home icon-large"></i></a></li>
             
             
            --- Full Drop Down Name -- 
              <li class="dropdown"><a href="#">blueb.co.kr</a>     
            --- Full Drop Down Name Ends Here --     
                         
            --- Full Drop Down Contents  Starts Here--     
                  
              <div class="fulldrop">              
                <div class="column">
                  <h3>menu1</h3>
                  <ul>
                    <li><a href="#">Tech ANd All</a></li>
                    <li><a href="#">Web Designs</a></li>
                    <li><a href="#">PSD</a></li>
                    <li><a href="#">Scripts</a></li>
                  </ul>
                </div>
                
                
                
                <div class="column">
                        <h3>Menu Header</h3>
                  <ul>
                    <li><a href="#">Tech ANd All</a></li>
                    <li><a href="#">Web Designs</a></li>
                    <li><a href="#">PSD</a></li>
                    <li><a href="#">Scripts</a></li>
                  </ul>
                </div>
                
                
                <div class="column">
                         <h3>Menu Header</h3>
                  <ul>
                    <li><a href="#">Tech ANd All</a></li>
                    <li><a href="#">Web Designs</a></li>
                    <li><a href="#">PSD</a></li>
                    <li><a href="#">Scripts</a></li>
                  </ul>
                </div>
                
                
                <div class="column">
                         <h3>Menu Header</h3>
                  <ul>
                    <li><a href="#">Tech ANd All</a></li>
                    <li><a href="#">Web Designs</a></li>
                    <li><a href="#">PSD</a></li>
                    <li><a href="#">Scripts</a></li>
                  </ul>
                </div>
                
                
                <div class="column">
                         <h3>Menu Header</h3>
                  <ul>
                    <li><a href="#">Tech ANd All</a></li>
                    <li><a href="#">Web Designs</a></li>
                    <li><a href="#">PSD</a></li>
                    <li><a href="#">Scripts</a></li>
                  </ul>
                </div>
                
                
                <div class="column">
                         <h3>Menu Header</h3>
                  <ul>
                    <li><a href="#">Tech ANd All</a></li>
                    <li><a href="#">Web Designs</a></li>
                    <li><a href="#">PSD</a></li>
                    <li><a href="#">Scripts</a></li>
                  </ul>
                </div>
              </div>
              </li>
              --- Full Drop Down Contents  Ends  Here--   
              
              
              
              
              
              
              
              
                        --- Full Drop Down Name -- 
              <li class="dropdown"><a href="#">Drop Down Menu 2</a>     
            --- Full Drop Down Name Ends Here --     
                         
            --- Full Drop Down Contents  Starts Here--     
                  
              <div class="fulldrop">              
                <div class="column">
				menu2
				</div>
              </li>
              --- Full Drop Down Contents  Ends  Here--   
              
              
          
        --- Regular Menu Button --   
          <li><a href="#">  Web Designs</a></li>
        --- Regular Menu Button Ends--  
           
         
          --- Regular Menu Button --  
               <li><a href="#"> LifeStyle</a></li>
          --- Regular Menu Button Ends--  
          
              
          --- Regular Menu Button --  
               <li><a href="#"> About</a></li>
          --- Regular Menu Button Ends--  
      
                --- Regular Menu Button --  
               <li><a href="#"> Contact</a></li>
          --- Regular Menu Button Ends--  
                
           
          
           --- Search Form Starts--        
              <li class="search"><form action="Search.php">
                  <i class="icon-search icon-large"></i><input type="text">
                  </form>
              </li>              
          --- Search Form Ends --    
             
                 
          </ul> 
        </div>
      </div>
    </body> -->

<!-- style2.css -->
<!-- <nav class="menu">
  <ol>
    <li class="menu-item"><a href="#0">Home</a></li>
    <li class="menu-item"><a href="#0">About</a></li>
    <li class="menu-item">
      <a href="#0">Widgets</a>
      <ol class="sub-menu">
        <li class="menu-item"><a href="#0">Big Widgets</a></li>
        <li class="menu-item"><a href="#0">Bigger Widgets</a></li>
        <li class="menu-item"><a href="#0">Huge Widgets</a></li>
      </ol>
    </li>
    <li class="menu-item">
      <a href="#0">Kabobs</a>
      <ol class="sub-menu">
        <li class="menu-item"><a href="#0">Shishkabobs</a></li>
        <li class="menu-item"><a href="#0">BBQ kabobs</a></li>
        <li class="menu-item"><a href="#0">Summer kabobs</a></li>
      </ol>
    </li>
    <li class="menu-item"><a href="#0">Contact</a></li>
  </ol>
</nav> -->


</body>
</html>