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
	request.setCharacterEncoding("utf-8");
	String log = (String)session.getAttribute("log");
	UserDao dao = UserDao.getInstance();
	UserDto user = dao.getUserById(log);
	%>
	<jsp:include page="header.jsp" />
	<section>
		마이페이지~!
		<table>
			<tr>
				<td>아이디</td>
				<td><%=user.getId()%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=user.getName() %></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><%=user.getNickname() %></td>
				<td><input type="button" value="닉네임 변경"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=user.getEmail() %></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=user.getBirth() %></td>
			</tr>

		</table>
		<input type="button" onclick="location.href='deleteForm'" value="회원탈퇴">
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>