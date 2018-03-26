<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>>Military Community</title>
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
		if (userEmail == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");

		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		//자기계정 삭제 및 수정 권한
		if (!userNickname.equals(bbs.getUserNickname())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
			
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
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Membership<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutaction.jsp">Log Out</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">				<!-- 수정페이지확인 중요부분  -->
			<form method="post" action="updateaction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">Notice board Eedite Form</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="Title" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="Content" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-success pull-right" value="Edited">
			</form>

		</div>
	</div>
	<!-- 애니메이션 jquery & bootstrap -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
﻿
