<%@page import="member.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%
String user_id = (String)session.getAttribute("log");
MemberDao mDao = MemberDao.getInstance();
ArrayList<MemberDto> chatlist = mDao.getMemberByUser_id(user_id);

if(chatlist != null){
	// 아래에 채팅방 로드하기
}
%>
	<jsp:include page="header.jsp"/>
    <section>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>