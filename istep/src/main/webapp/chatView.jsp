<%@page import="chat_log.Chat_logDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chat_log.Chat_logDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("log");
	String code = request.getParameter("code");
	Chat_logDao dao = Chat_logDao.getInstance();
	ArrayList<Chat_logDto> list = dao.getAllChat_logByC_code("code");
	%>
	<jsp:include page="header.jsp"/>
    <section>
    	<div>
    		<%for(Chat_logDto log : list){ %>
    		<div>
    			<span><%=log.getUser_id() %></span>
    			<span><%=log.getRegdate() %></span>
    			<span><%=log.getContent() %></span>
    		</div>
    		<%} %>
    	</div>
    	<div>
    		
    	</div>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>