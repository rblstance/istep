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
	ArrayList<UserDto> members = new ArrayList<UserDto>();
	members.add(dao.getUserById(log));
	%>
	<jsp:include page="header.jsp"/>
    <section>
    	<form id="chatForm">
    		<fieldset>
	    		<label for="chatName">채팅방 이름</label><br><input type="text" name="chatName" id="chatName"><br>    		
    		</fieldset>
    	</form>
    	
    	<fieldset form="chatForm">
    		<label for="userName">유저 검색</label><br><input type="text" name="userName" id="userName">
    		<input type="button" value="검색" id="search_member"><br>
    	</fieldset>
    	
    	<fieldset form="chatForm">
    		<div id="s_result">
    			<% //if(request.getAttribute())%>
    			<input type="button" id="add_member">
    		</div>
    		
    	</fieldset>
    	<fieldset form="chatForm">
    		<div id="mem_list">
    			<span>멤버 목록</span>
    			<ul>
    				<%for(UserDto member : members){ %>
    					<li><%=member.getId() %></li>
    					<li><%=member.getName() %></li>
    					<li><%=member.getNickname() %></li>
    				<%} %>
    			</ul>
    		</div>   	
    		<input type=submit value="생성하기">
    	</fieldset>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>