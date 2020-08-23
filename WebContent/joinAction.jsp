<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" /> <!-- scope 현재 page에서만 bean을 사용  -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta name = "viewport" content="width=device-width",initial-scale="1" charset="UTF-8"> <!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- bootstrap을 사용하기 위해 지정 -->
<title>회원가입</title>
</head>
<body>
	<%
		String userID = null;// 로그인이 된 유저는 로그인과 회원가입 페이지에 들어갈 수 없도록
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href = main.jsp");
			script.println("</script>");
		}
		if (user.getUserID() == null || 
			user.getUserPassword() == null || 
			user.getUserName() == null || 
			user.getUserGender() == null || 
			user.getUserEmail() == null ) {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 항목을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1) {  // DB 오류 (userID는 primary key)
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserID());	// 세션 부여 getUserID() 세션값
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			} 
		}
	%>
	

</body>
</html>