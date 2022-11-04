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
<%
String log = (String)session.getAttribute("log");

if(log != null){
	ChatDao cDao = ChatDao.getInstance();
	ArrayList<ChatDto> chatList = cDao.getChatById(log);%>

	<jsp:include page="header.jsp" />
	<section>
		<div>
			<ul>
				<li><a href="makeChatForm.jsp">채팅방 생성</a></li>
				<li><a href="myChatList.jsp">내 채팅방</a></li>
				<li><a href="">채팅방 검색</a></li>
				<li><a href=""></a></li>
			</ul>
		</div>
		<div>
		<%if(chatList != null){%>
			<table>
				<tbody>
					<%for(ChatDto c : chatList){ %>
					<tr>
						<td>이름</td>
						<td><%=c.getName() %></td>
					</tr>
					<tr>
						<td>코드</td>
						<td><%=c.getCode() %></td>
					</tr>
					<tr>
						<td>호스트</td>
						<td><%=c.getHost_id() %></td>
					</tr>
					<tr>
						<td><a href="chatView?c_code=<%=c.getCode()%>">입장하기</a></td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		<%} else {%>
		<div>
			가입한 채팅방이 없습니다.
		</div>
		<%}%>
	</section>
	<jsp:include page="footer.jsp" />
</body>
<%} else
	response.sendRedirect("login"); %>
</html>