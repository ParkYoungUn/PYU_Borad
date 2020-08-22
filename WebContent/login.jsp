<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name = "viewport" content="width=device-width",initial-scale="1" charset="UTF-8"> <!-- viewport=화면상의 표시영역, content=모바일 장치들에 맞게 크기조정, initial=초기화면 배율 설정 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- bootstrap을 사용하기 위해 지정 -->
<title>로그인</title>

</head>
<body>

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
				<li><a href="bbs.jsp">게시판</a></li>	<!-- bbs.jsp 파일로 이동(게시판) -->
			</ul>
	
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"		
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>	<!-- 임시주소 #으로 지정 -->
					
					<ul class="dropdown-menu">	<!-- dropdown-menu : 버튼을 눌렀을때, 생성되는 메뉴(접속하기를 눌렀을때 로그인, 회원가입 메뉴 -->
						<li class="active">	<!-- active = 활성화(로그인, 회원가입) -->
							<a href="login.jsp">로그인</a>
						</li>
						<li>
							<a href="join.jsp">회원가입</a>
						</li>
					</ul>
					
			</li>
		</ul>
		</div>
	</nav>

<div class="container">	<!-- 전제 레이아웃 container로 감싸주기 -->
	<div class="col-lg-4"></div>
		<div class="col-lg-4">
		
			<div class="jumbotron" styles="padding-top:20px;">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">	<!-- 아이디 입력받는 창 -->
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">		<!-- 비밀번호 입력받는 창 -->
					</div>
						<input type="submit" class="btn btn-primary form-control" value="로그인">		<!-- 로그인 버튼 -->
				</form>
			</div>
		
		</div>

</div>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src=js/bootstrap.js></script>
</body>