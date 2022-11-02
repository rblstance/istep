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
String id = (String)session.getAttribute("log");
UserDao uDao = UserDao.getInstance();
UserDto user = uDao.getUserById(id);

ChatDao cDao = ChatDao.getInstance();
//MemberDto 
//<ArrayList> 
%>
	<jsp:include page="header.jsp" />
	<section>
		<div>
			<ul>
				<li><a href="myChatList.jsp">내 채팅방?</a></li>
				<li><a href="makeChatForm.jsp">채팅방 생성하기</a></li>
				<li><a href="">채팅방 관리 > 여기 두지 말고 채팅방 리스트에서 확인?</a></li>
				<li><a href="">채팅방 검색해보기,,,</a></li>
				<li><a href=""></a></li>
				<li><a href=""></a></li>
			</ul>
		</div>
		<div>
			개설된 채팅방 있으면 여기 쭈르륵 리스트로 입장할 수 있게
			<%//for() %>
			<div>
				<ul>
					<li></li>
				</ul>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>