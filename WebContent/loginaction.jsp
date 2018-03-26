<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8"); //건너오는 데이터 charset=UTF-8 한글지원
%>
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- 현재페이지에 자바빈즈 사용-->
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userNickname" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	     //세션값 관리
		if (session.getAttribute("userEmail") != null) {
			userEmail = (String) session.getAttribute("userEmail");
		}
		if (userEmail != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되었습니다!')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserEmail(), user.getUserPassword());
		if (result == 1) {
			
			
			 //string 으로 nickname받아오기
			String nickname = userDAO.getNickname(user.getUserEmail());
			user.setUserNickname(nickname);
			
			session.setAttribute("userEmail", user.getUserEmail());	
			 //세션값 구하기
			session.setAttribute("userNickname", user.getUserNickname());	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되었습니다!')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");

		} else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");

		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");

		} else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
﻿
