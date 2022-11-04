<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
<%@page import="chat.ChatDao"%>
<%@page import="chat.ChatDto"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
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
	MemberDao mDao = MemberDao.getInstance();
	ChatDao cDao = ChatDao.getInstance();
	ArrayList<String> list = mDao.getCodeByUser_id(log);
	ArrayList<ChatDto> chatList = null;
	ChatDto chat = null;
	try {
		for(int i=0; i<list.size(); i++){
			chat = cDao.getChatByCode(list.get(i));
			chatList.add(chat);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}%>

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
						<td><input type="button" value="입장" onclick=""></td>
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