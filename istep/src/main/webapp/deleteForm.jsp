<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="resources/table.css" />
</head>
<body>
<jsp:include page="header.jsp" />
	<%
	String log = (String)session.getAttribute("log");
	%>

	<section>
	<h2>회원탈퇴</h2>
	<h4><%=log %>님 회원탈퇴 하시겠습니까?</h4>
	<form method="post" action="delete">
		<table border=1>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" class="btn" value="예" onclick="deleteMem()">
					<input type="button" class="btn" value="아니요" onclick="location.href='mypage'">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<script src="resources/chatMemberMng.js?ver=9"></script>
</body>
</html>