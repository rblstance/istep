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
	String id = (String)session.getAttribute("log");
	String c_code = request.getParameter("c_code");
	Chat_logDao dao = Chat_logDao.getInstance();
	ArrayList<Chat_logDto> list = dao.getAllChat_logByC_code(c_code);
	System.out.println(list);
	%>
	<jsp:include page="header.jsp" />
	<section>
		<span><a href="chat">뒤로가기</a></span>
		<div></div>
		<div>
			<%if(list == null) { %>
			환영합니다.
			<%} else {
    			for(Chat_logDto log : list){%>
			<div class = "container">
				<span><%=log.getUser_id() %></span> 
				<span><%=log.getContent() %></span>
				<span><%=log.getRegdate() %></span>
			</div>
			<%}
    		}%>
		</div>
		<div>
			<input type="text" name="content">
			<input type="submit" value="전송">
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>