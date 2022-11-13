<%@page import="chat_log.Chat_logDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chat_log.Chat_logDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resoureces/chat.css" />
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String log = (String)session.getAttribute("log");
	%>
	<jsp:include page="header.jsp" />
	<section>
		<span><a href="chat">뒤로가기</a></span>
		<div></div>
		<div>
			<div class = "container"></div>
		</div>
		<div>
			<form method="post" action="WriteChat_l}}ssssog?c_code="">
				<input type="text" name="content"> <input type="submit" value="작성">
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>