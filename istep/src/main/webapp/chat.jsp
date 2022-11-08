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
	%>
	<section>
		<div>
            <form method="post" action="makeChatForm">
				<input type="hidden" id="user_id" value="<%=log%>">
                <input type="hidden" name="c_code" id="c_code" value="">
                <label for="name">채팅방 생성</label><br><input type="text" name="chatName" id="chatName"><br>
                <input type="submit"value="생성하기">
            </form>
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
		<div>가입한 채팅방이 없습니다.</div>
		<%}}%>
	</section>
</body>
	<jsp:include page="footer.jsp" />
</html>