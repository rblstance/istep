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
	String log = (String) session.getAttribute("log");
	UserDao dao = UserDao.getInstance();
	UserDto user = dao.getUserById(log);
	%>
	<h1>마이페이지</h1>
	<div>
		<form method="post" action="update">
			<table border=1>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" value="<%=user.getId()%>" id="user_id"
						readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password"
						value="<%=user.getPassword()%>"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"
						value="<%=user.getName()%>"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname" id="nickname"
						value="<%=user.getNickname()%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone"
						value="<%=user.getPhone()%>"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="birth"
						value="<%=user.getBirth()%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email"
						value="<%=user.getEmail()%>"></td>
				</tr>
				<tr>
					<th>등급[A:학생, B:강사]</th>
					<td><select name="grade">
							<option value="A">A</option>
							<option value="B">B</option>
					</select></td>
				</tr>
				<tr>
					<td><input type="submit" value="수정하기" onclick="updateMem()"> <input
						type="button" onclick="location.href='mypage'" value="뒤로가기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="resources/chatMemeberMng.js"></script>
</body>
</html>