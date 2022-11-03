<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@page import="member.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chat.ChatDto"%>
<%@page import="chat.ChatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<%
ChatDao cDao = ChatDao.getInstance();
MemberDao mDao = MemberDao.getInstance();
UserDao uDao = UserDao.getInstance();
String id = "";
///////////////////////
UserDto user = uDao.getUserById(id);
ArrayList<String> list = mDao.getCodeByUser_id(user.getId());
ArrayList<ChatDto> chatList = null;
ChatDto chats = null;
try {
	for(int i=0; i<list.size(); i++){
		chats = cDao.getChatByCode(list.get(i));
		chatList.add(chats);
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<%if(chatList != null){%>
    	<div>
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
						<td><input type="button" value="입장" onclick="chatView?code=<%=c.getCode() %>"></td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		<%} else {%>
		<div>
			가입한 채팅방이 없습니다.
		</div>
		<%
		}%>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>