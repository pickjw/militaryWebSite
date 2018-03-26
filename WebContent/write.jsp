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
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		
		String userNickname = null;
		if (session.getAttribute("userNickname") != null) {
			userNickname = (String) session.getAttribute("userNickname");	
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
		<div class ="row">
			<form method="post" action="writeaction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
			    	<thead>
			    		<tr>
			    			<th colspan="2" style="background-color: #eeeeee; text-align: center;">Notice board Writing Form</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<tr>
			    			<td><input type="text" class="form-control" placeholder="Title" name="bbsTitle" maxlength="50"></td>
			    		</tr>
			    		<tr>
			    			<td><textarea class="form-control" placeholder="Content" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
			    		</tr>
			    	</tbody>
			    </table>
			    <input type="submit"  class="btn btn-danger pull-right" value="Writing">
			</form>
			
		</div>
	</div>
	<!--	
	<%
	out.print(userNickname);
	%> 
	-->
	<!-- 애니메이션 jquery & bootstrap -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	﻿

</body>
</html>
﻿
