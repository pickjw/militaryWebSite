<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	                                      <!-- charset=UTF-8 한글지원-->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- bootstrap 반응형 웹 meta tag 구현-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- css파일에 bootstrap.css를 참조-->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>Military Community</title>	
</head>
<body>
		<!-- navigation 구현-->
 		<nav class="navbar navbar-default">
 		
 		    <!-- navigation header 구현-->
  			<div class="navbar-header">
  			
  			     <!-- bootstrapr button  toggle collapsed 구현-->
  				 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
  				         data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
   							 <!-- 모바일 화면시 icon-bar 구현-->
    							<span class="icon-bar"></span> 
    							<spaen class="icon-bar"></span> 
    							<span class="icon-bar"></span>
    							<span class="icon-bar"></span>          
   				</button>
   				 <!-- navigation header mian 로고 및 사이트 첫 머리 구현-->
   				<a class="navbar-brand" href="main.jsp">Military Community</a>
  			</div>
  			<!-- navigation header 구현-->
  			
  			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
  				<!-- header 리스트 구현-->
   				<ul class="nav navbar-nav">
    					<li><a href="main.jsp">Main</a></li>
    					<li><a href="bbs.jsp">Notice Board</a></li>
    					<li><a href="">Q&A</a></li>
   				</ul>
   				<!-- 오른쪽에 리스트 넣기-->
   				<ul class="nav navbar-nav navbar-right">
    				<li class="dropdown">
    					 <a href="#" class="dropdown-toggle"data-toggle="dropdown" role="button" aria-haspopup="true"
     					 aria-expanded="false">Connect<span class="caret"></span></a>
     					<ul class="dropdown-menu">
     					    <!-- 현재 선택된 페이지-->
      						<li class=""><a href="login.jsp">Sign up</a></li>
      						<li class=""><a href="join.jsp">Join</a></li>
     					</ul>
    				</li>
   				</ul>
   				<!-- 리스트 구현-->
  			</div>
  			
 		</nav>
 		<!-- navigation 구현-->
 		
 		<!-- 로그인 양식  구현-->
 		<div class="container">
  			<div class="col-lg-4"></div>
  			<div class="col-lg-4">
   					<div class="jumbotron" style="padding-top: 20px">
     					<form method="post" action="joinaction.jsp">      
     						<h3 style="text-align: center;">Join</h3>
      						<div class="form-group">       
      								<input type="email" class="form-control" placeholder="E-mail" name="userEmail" maxlength="20">      
      						</div>
                            <div class="form-group">       
                                 	<input type="password" class="form-control" placeholder="Password"name="userPassword" maxlength="20">     
                           	</div>
                           	 <div class="form-group">       
                                 	<input type="text" class="form-control" placeholder="Name"name="userName" maxlength="20">     
                           	</div>
                           	
                           	 <div class="form-group">       
                                 	<input type="text" class="form-control" placeholder="Nickname"name="userNickname" maxlength="20">     
                           	</div>
                           
                            <div class="form-group">       
                               		<input type="text" class="form-control" placeholder="Phone"name="userPhone" maxlength="20">     
                            </div>
      								<input type="submit" class="btn btn-danger form-control"value="Join">     
      					</form>
    			   </div>
   			  </div>
     	  <div class="col-lg-4"> </div>
	 </div>
	 <!-- 로그인 양식  구현-->
	 
 		 <!-- 애니메이션  jquery & bootstrap -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		 <!-- js/bootstrap.js 참조 기본 -->
		<script src="js/bootstrap.js"></script> ﻿


	</body>
</html>﻿