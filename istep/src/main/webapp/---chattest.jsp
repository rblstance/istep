<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="chat.ChatDto"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@page import="chat.ChatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%
UserDao uDao = UserDao.getInstance();
ChatDao cDao = ChatDao.getInstance();
MemberDao mDao = MemberDao.getInstance();

UserDto user = uDao.getUserById("bss1016");

/*
ChatDto chat2 = new ChatDto("chat2", user.getId());
cDao.createChat(chat2);
ChatDto chat3 = new ChatDto("chat3", user.getId());
cDao.createChat(chat3);
ChatDto chat4 = new ChatDto("chat4", user.getId());
cDao.createChat(chat4);
ChatDto chat5 = new ChatDto("chat5", user.getId());
cDao.createChat(chat5);
ChatDto chat6 = new ChatDto("chat6", user.getId());
cDao.createChat(chat6);
*/

ArrayList<String> list = mDao.getCodeByUser_id(user.getId());
ArrayList<ChatDto> chatList = null;
System.out.println(list.size());
ChatDto chats = null;
for(int i=0; i<list.size(); i++){
	chats = cDao.getChatByCode(list.get(i));
	chatList.add(chats);
}
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<%
    	%>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>