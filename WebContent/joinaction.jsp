<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userNickname" />
<jsp:setProperty name="user" property="userPhone" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Military Community</title>
</head>
<body>

	<%
		//세션값 관리
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
		if (user.getUserEmail() == null || user.getUserPassword() == null || user.getUserName() == null
				|| user.getUserNickname() == null || user.getUserPhone() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");

			} else {//회원가입 성공
				
				//세션관리 구하기
			    session.setAttribute("userNickname", user.getUserNickname());	
				session.setAttribute("userEmail", user.getUserEmail());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입을 축하합니다!')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");

			}
		}
	%>

</body>
</html>
﻿
