<%@page import="user.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/login.css" />
</head>
<body>
<jsp:include page="header.jsp" />
	<section>
	<h2>회원가입</h2>
	<form name="signup" method="post" action="signUp">
		<table border=1>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" size="30" readonly></td>
				<td><button  class="btn" type="button" onclick="idCheck()">아이디 중복확인</button></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password" size="30" onkeyup="return isSame();" /></td>
				<td><font id="space"></font></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="passwordCheck"	id="passwordCheck" size="30" onkeyup="return isSame();" /></td>
				<td><font id="same"></font></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" size="30"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" id="nickname" size="30"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" id="phone" size="30"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth" id="birth" size="30"
					maxlength="8"></td>
			</tr>
			<tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" size="30" readonly></td>
				<td><button type="button" class="btn" onclick="emailCheck()">이메일 중복확인</button></td>
			</tr>
			<tr>
				<th>등급[A:학생, B:강사]</th>
				<td><select name="grade" id="grade">
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">B</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="joinform_check();">회원가입</button>
					<button type="button" class="btn" onclick="location.href='index'">취소</button>
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="resources/signUpForm.js?ver=1"></script>
</body>
</html>