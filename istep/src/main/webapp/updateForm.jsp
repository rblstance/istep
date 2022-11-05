<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String log = (String)session.getAttribute("log");
	
	UserDao dao = UserDao.getInstance();
	UserDto user = dao.getUserById(log);
	%>
    <h1>마이페이지</h1>
    <div>
        <form method="post" action="update">
        	<input type="text" name="id" value="<%=user.getId() %>" readonly>
        	<input type="text" name="password" value="<%=user.getPassword() %>">
        	<input type="text" name="name" value="<%=user.getName() %>">
        	<input type="text" name="name" value="<%=user.getNickname() %>">
        	<input type="text" name="phone" value="<%=user.getPhone() %>">
        	<input type="text" name="address" value="<%=user.getBirth() %>">
        	<input type="text" name="license" value="<%=user.getEmail() %>">
        	<input type="submit" value="수정하기">
        	<input type="button" onclick="location.href='mypage'" value="뒤로가기">
        </form>
    </div>
</body>
</html>