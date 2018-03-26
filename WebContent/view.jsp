<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Military Community</title>
</head>
<body>
	<%
		//세션값관리
		String userNickname = null;
		if (session.getAttribute("userNickname") != null) {
			userNickname = (String) session.getAttribute("userNickname");
		}
		//세션값관리
		String userEmail = null;
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") !=null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID ==0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
			
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
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
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">Notice Board	View</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">Title</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll("", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>Nickname</td>
						<td colspan="2"><%= bbs.getUserNickname() %></td>
					</tr>
					<tr>
						<td>Date Created</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "Hs"+"&nbsp;"+ bbs.getBbsDate().substring(14, 16) + "Min" %></td>
					</tr>
					<tr>
						<td>Content</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll("", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-success">List</a>
			<%//자기계정 삭제 및 수정 권한
		   		if(userNickname != null && userNickname.equals(bbs.getUserNickname())) {
		   %>
			<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-success">Edite</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteaction.jsp?bbsID=<%= bbsID %>" class="btn btn-danger">Delete</a>
			<%
		   		}
			
			%>
			
		  

		</div>
	</div>
	<!-- 애니메이션 jquery & bootstrap -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	﻿

</body>
</html>
﻿
