<%@page import="user.UserDao"%>
<%@page import="user.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="resources/table.css" />
</head>
<body>
<jsp:include page="header.jsp" />
	<%
	request.setCharacterEncoding("utf-8");
	String log = (String) session.getAttribute("log");
	UserDao dao = UserDao.getInstance();
	UserDto user = dao.getUserById(log);
	%>
	<jsp:include page="header.jsp" />
	<section>
	<h2>회원정보수정</h2>
	<div>
	<input type="hidden" id="code" value="<%=user.getGrade() %>" />
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
							<option value="C">C</option>
					</select></td>
				</tr>
				<tr>
					<td>
					<input type="submit" onclick="updateMem()" value="수정하기"> 
					<input type="button" onclick="location.href='mypage'" value="뒤로가기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</section>
		<jsp:include page="footer.jsp" />
	<script src="resources/chatMemberMng.js"></script>
</body>
</html>