<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/grid.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>ISTEP</title>
</head>
<body>
	<%
	String log = (String)session.getAttribute("log"); 
	String grade = "";
	if(session.getAttribute("grade")!=null){
		grade = (String)session.getAttribute("grade");
	}
	%>
	<header>
		<h1>
			<a href="index">iStep</a>
		</h1>
	</header>
	<nav>
		<ul>
			<li><a href="guide">서비스 안내</a></li>
			<li><a href="subject">과목</a></li>
			<li><a href="chat" onclick="viewChats()">채팅</a></li>
			<%if(grade.equals("B")){ %>
			<li><a href="lectureM">강의 관리</a></li>
			<%}if(grade.equals("C")) {%>
			<li><a href="subjectM">과목 관리</a></li>
			<!-- 회원등급이 관리자(C)일 때 보이는 메뉴 -->
			<%} %>
			<li><a href="access?page=mypage">마이페이지</a></li>
			<%if(log == null) {%>
			<li><a href="loginForm">로그인</a></li>
			<%}else{%>
			<li><a href="logout" >로그아웃</a></li>
			<% }%>
		</ul>
	</nav>
</body>
<script src="resources/chat.js?ver=4"></script>
<script src="resources/chatMemberMng.js?ver=4"></script>
</html>