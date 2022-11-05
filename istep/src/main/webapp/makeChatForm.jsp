<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%
	String log = (String)session.getAttribute("log");
	UserDao dao = UserDao.getInstance();
	String memList = "";
	%>
	sessionStorage.setItem("<%=memList %>", log);
	let data = sessionStorage.getItem("<%=memList %>");
	
	<jsp:include page="header.jsp"/>
    <section>
    	<form id="chatForm" method="POST" action="makeChatForm">
    		<fieldset>
	    		<label for="chatName">채팅방 이름</label><br><input type="text" name="chatName" id="chatName"><br>
    		</fieldset>
    	</form>
    	
    	<fieldset form="chatForm">
    		<form method="post" action="printId">
	    		<label for="userName">유저 검색</label><br><input type="text" name="user_id" id="user_id" value=<%=request.getAttribute("#user_id")%>>
	    		<input type="hidden" value="<%=memList%>" name="memList" id="memList">
	    		<input type="submit" value="검색" id="search_member"><br>
    		</form>
    	</fieldset>
    	
    	<fieldset form="chatForm" class="s_result" id="s_result">
    		<% if (request.getAttribute("result") != null && request.getAttribute("result") != "") {
					if(request.getAttribute("result") == ""){ %>
						없는 아이디입니다.
					<%} else {
					UserDto s_user = (UserDto) request.getAttribute("result");
					if (s_user == dao.getUserById(log)) {}
					else {
						memList += "/" + s_user.getId();%>
					<span id="new_id">아이디 <%=s_user.getId()%></span>
					<span>이름 <%=s_user.getName()%></span>
					<span>닉네임 <%=s_user.getNickname()%></span>
					<input type="hidden" value="<%=s_user.getName()%>" id="new_id">
					<input type="hidden" value="<%=memList%>" id="memList">
					<br> 추가
					<% System.out.println(memList);}
					}
				} %>
    	</fieldset>
    	<fieldset form="chatForm">
    		<input type="hidden" value="<%=memList%>" name="memList">
    		<input type=submit value="생성하기">
    	</fieldset>
    </section>
	<jsp:include page="footer.jsp"/>
	<script src="resources/searchMember.js?ver=4"></script>
</body>
</html>