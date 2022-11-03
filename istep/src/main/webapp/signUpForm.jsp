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
</head>
<body>
	<h1>회원가입</h1>  
	<form name="regForm" method="post" action="signUp">
		<table border=1>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" size="15" readonly required>
					<input type="button" value="ID중복확인" onclick="idCheck()"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" id="password" size="15" onkeyup="isSame()" required/>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="passwordCheck" id="passwordCheck" size="15" size="15" onkeyup="isSame()" required/>&nbsp;&nbsp;<font id="same"></font></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" size="15" required></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" id="nickname" size="15"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" id="phone" size="15"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="birth" id="birth" size="15"></td>
			</tr>
			<tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" size="30"
					readonly> <input type="button" value="Email 중복확인"
					onclick="emailCheck()"></td>
			</tr>
			<tr>
				<th>등급[A:학생, B:강사]</th>
				<td><select name="grade" id="grade">
						<option value="A">A</option>
						<option value="B">B</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="회원가입" /> 
				<input type="button" onclick="location.href='index'" value="취소" />
				</td>
			</tr>
		</table>
	</form>

<script src="resources/signUpForm.js"></script>
</body>
</html>