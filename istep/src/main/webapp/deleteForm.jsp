<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<%
	String log = (String)session.getAttribute("log");
	%>
	<h1>마이페이지</h1>
	<h4><%=log %>님 회원탈퇴 하시겠습니까?
	</h4>

	<form method="post" action="delete">
		<p>
			비밀번호 입력 : <input type="password" name="password">
		</p>
		<input type="submit" value="예" onclick="deleteMem()">
	</form>
	<button type="button" onclick="location.href='mypage'">아니요</button>
	<script src="resources/chatMemberMng.js?ver=9"></script>
</body>
</html>