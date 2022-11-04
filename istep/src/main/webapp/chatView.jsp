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
	System.out.println(list);
	%>
	<jsp:include page="header.jsp"/>
    <section>
    <span><a href="chat">뒤로가기</a></span>
    	<div>
    		<%if(list == null) { %>
    			환영합니다.
    		<%} else {
    			for(Chat_logDto log : list){ 
    			System.out.println(log.getUser_id());
    			System.out.println(log.getC_code());
    			System.out.println(log.getContent());
    			System.out.println(log.getRegdate());
    			%>
    		<div>
    			<span><%=log.getUser_id() %></span>
    			<span><%=log.getRegdate() %></span>
    			<span><%=log.getContent() %></span>
    		</div>
    		<%}
    		}%>
    	</div>
    	<div>
    		<form method="post" action="writeChat_log?c_code=<%=code%>">
    			<input type="text">
    			<input type="submit" value="작성">
    		</form>
    	</div>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>