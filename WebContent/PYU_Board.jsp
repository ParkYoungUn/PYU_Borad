<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
<meta name = "viewport" content="width=device-width",initial-scale="1" charset="UTF-8"> <!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- bootstrap을 사용하기 위해 지정 -->
<title>게시판</title>

</head>
<body>
	
	<%	// 로그인이 된 사람은 로그인 정보를 담을 수 있도록
		String userID = null;	// 로그인 안된 사용자는 userID에 null 들어감
		if(session.getAttribute("userID") != null) { // 로그인 된 사용자는 userID에 해당 ID가 담김
			userID = (String)session.getAttribute("userID");
		}
	%>
	
	<nav class = "navbar navbar-default">	<!-- navbar-색상(inverse = 검은색, default = 색x) -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<!-- class="navbar-toggle collapsed"=>네비게이션의 화면 출력유무 
			 data-toggle="collapse" : 모바일 상태에서 클릭하면서 메뉴가 나오게 설정 -->
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
						<!-- 아이콘 이미지 -->
			</button>
			
			<a class="navbar-brand" href="main.jsp">JSP 게시판</a> <!-- 기본 메뉴바 -->
		</div>
	
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">	<!-- navbar-nav => 네비게이션 바의 메뉴 -->
				<li><a href="main.jsp">메인</a></li> <!-- main.jsp 파일로 이동(메인) -->
				<li class="active"><a href="PYU_Board.jsp">게시판</a></li>	<!-- PYU_Board.jsp 파일로 이동(게시판) -->
			</ul>
	
		<%
			if(userID == null) {	//로그인이 되어있지 않을 때
		%>	
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"		
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>	<!-- 임시주소 #으로 지정 -->
					
					<ul class="dropdown-menu">	<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->
						<li>
							<a href="login.jsp">로그인</a>
						</li>
						<li>
							<a href="join.jsp">회원가입</a>
						</li>
					</ul>
					
			</li>
		</ul>
		<%
			} else {	//로그인이 되어있을 때
		%>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"		
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>	<!-- 임시주소 #으로 지정 -->
					
					<ul class="dropdown-menu">	<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->
						<li>
							<a href="logoutAction.jsp">로그아웃</a> <!-- 로그아웃 버튼 누를 시  logoutAction.jsp로 이동-->
						</li>
					</ul>
					
			</li>
		</ul>
		<%		
			}
		%>
		</div>
	</nav>
	
	<!-- 게시판 영역 -->
	<div class="container">
		<div class = "row">
			<table class= "table table-striped" style="text-align: center; border: 1px solid #ddd">
				<thead>
					<tr>
						<th style="background-color: #eee; text-align:center">번호</th>
						<th style="background-color: #eee; text-align:center">제목</th>
						<th style="background-color: #eee; text-align:center">작성자</th>
						<th style="background-color: #eee; text-align:center">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>test Message</td>
						<td>박영운</td>
						<td>2020-08-25</td>
					</tr>
				</tbody>
			</table>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src=js/bootstrap.js></script>
</body>