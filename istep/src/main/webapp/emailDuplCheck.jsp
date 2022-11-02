<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복</title>
</head>
<body>
	<div>
		<h3>* 이메일 중복확인 *</h3>
		<form method="post" action="emailDuplOk.jsp">
			이메일 : <input type="text" name="email" maxlength="20" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>
</body>
</html>