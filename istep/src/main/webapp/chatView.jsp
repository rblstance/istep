<%@page import="chat.ChatDto"%>
<%@page import="chat.ChatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%
// test
ChatDao dao = ChatDao.getInstance();
//dao.createChat();
%>
	<jsp:include page="header.jsp"/>
    <section>
    	
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>