<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<h1>아이디 찾기</h1>
		<div>
			<form method="POST" action="findId">
				<p>
					이름 : <input type="text" name="name" placeholder="name"></input>
				<p>
				<p>
					비밀번호 : <input type="password" name="password" placeholder="Password"></input>
				<p>
					<input type="submit" value="아이디찾기">
			</form>
		</div>
</body>
</html>