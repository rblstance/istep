	<%@page import="subject.SubjectDao"%>
	<%@page import="registrations.RegistrationsDao"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="registrations.RegistrationsVo"%>
	<%@page import="user.UserDto"%>
	<%@page import="user.UserDao"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	<link rel="stylesheet" href="resources/table.css" />
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
		String log = (String)session.getAttribute("log");
		UserDao dao = UserDao.getInstance();
		UserDto user = dao.getUserById(log);
		RegistrationsDao reg = RegistrationsDao.getInstance();
		ArrayList<RegistrationsVo> list = reg.getRegistrationsById(log);
		String subject = "";
		SubjectDao sub = SubjectDao.getInstance();
		%>
		<jsp:include page="header.jsp" />
		<section>
			<input type="hidden" value="<%=log%>" id="log">
			<h2>마이페이지</h2>
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
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=user.getPhone() %></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><%=user.getBirth() %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=user.getEmail() %></td>
				</tr>
				
				<tr>
					<td>수강과목</td>
					<td>
				<%for(RegistrationsVo board : list){%>
					<a href="lecture.jsp?code=<%=board.getSbj_code()%>"><%=sub.getSubjectByCode(board.getSbj_code()).getName() %></a> /
				<%} %>
					</td>
				</tr>
				<tr>
					<td>채팅</td>
					<td class = "container"></td>
				</tr>
				
			</table>
			<input type="button" onclick="location.href='updateForm'" value="회원정보수정">
			<input type="button" onclick="location.href='deleteForm'" value="회원탈퇴">
		</section>
		<jsp:include page="footer.jsp" />
		<script src="resources/chat.js"></script>
	</body>
	</html>