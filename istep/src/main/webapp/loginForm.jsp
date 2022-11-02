<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
	<h1>Login</h1>
	<div>
		<form method="POST" action="login">
			<p>아이디 : <input type="text" name="id" placeholder="ID"></input><p>
			<p>비밀번호 : <input type="password" name="password" placeholder="Password"></input><p>
			<input type="submit" value="로그인">
		</form>
	</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>