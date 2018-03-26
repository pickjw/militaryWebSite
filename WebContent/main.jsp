<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Military Community</title>
</head>
<body>
	<%
		//userNickname 세션값관리
		String userNickname = null;
		
		if (session.getAttribute("userNickname") != null) {
			userNickname = (String) session.getAttribute("userNickname");
	    }
		
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Military Community</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">Main</a></li>
				<li><a href="bbs.jsp">Notice Board</a></li>
				<li><a href="qabbs.jsp">Q&A</a></li>
			</ul>

			<%
				if (userEmail == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Connect<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">Sign up</a></li>
						<li><a href="join.jsp">Join</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Membership<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutaction.jsp">Log Out</a></li>
					</ul></li>
			</ul>

			<%
				}
			%>

		</div>
	</nav>
	
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
					 	<img src="images/c1.png" alt="First slide">
					</div>
					<div class="item">
					 	<img src="images/c2.png" alt="Second slide">
					</div>
					<div class="item">
					 	<img src="images/c3.png" alt="Third slide">
					</div>
					<div class="item">
					 	<img src="images/c4.png" alt="Four slide">
					</div>
					<div class="item">
					 	<img src="images/c5.png" alt="Five slide">
					</div>
				</div>
				<a class="left carousel-control" href="#myCarousel"  role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" ></span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				</a>
			</div>
		</div>
	
	
		<div class="container">
			<div class="jumbotron">
				<div class="container">
					<h1>JW's Military Community</h1>
					<p>Do U like Military?</br>The site now offers introductions and commissions of the latest weapons and special forces in the world.
					Publish articles and materials on the communication site at the time of membership registration. Many other things can be exchanged.<p>
					<p><a class="btn btn-danger btn-pull" href="#" role="button">Review the details</a></p>
				</div>	
			</div>
		</div>
		
	<!-- 애니메이션 jquery & bootstrap -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	﻿

</body>
</html>
﻿




































