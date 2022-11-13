<%@page import="chat.ChatDao"%>
<%@page import="chat.ChatDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	request.setCharacterEncoding("utf-8");
	String log = (String)session.getAttribute("log");
	if(log==null)
		out.print("<script>alert('로그인이 필요한 서비스입니다.');location.href='loginForm';</script>");
	if(log != null){
		ChatDao cDao = ChatDao.getInstance();
		ArrayList<ChatDto> chatList = cDao.getChatById(log);
	}%>
	<section>
		<span><a href="chatForm">채팅방 생성하기</a></span>
		<div>
			여기 전체!!!! 채팅방
		</div>
	</section>
</body>
	<jsp:include page="footer.jsp" />
</html>