<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
	   //세션값관리	
		String userEmail = null;
		
	
		if (session.getAttribute("userEmail") != null) {
				userEmail = (String) session.getAttribute("userEmail");
		}
				
		if (userEmail == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				                                        //userNickname 구현
				int result = bbsDAO.write(bbs.getBbsTitle(), userNickname, bbs.getBbsContent());
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패 했습니다.')");
					script.println("history.back()");
					script.println("</script>");

				} else {//회원가입 성공
						//섹션값 구하기
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");

				}
			}
		}
		
	%>

</body>
</html>
﻿
