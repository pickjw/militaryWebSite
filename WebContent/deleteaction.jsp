<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			script.println("alert('로그인을 하세요')");
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
		}else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.delete(bbsID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패 했습니다.')");
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
	
	%>
</body>
</html>
﻿
