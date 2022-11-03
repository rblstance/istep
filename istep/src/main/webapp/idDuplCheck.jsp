<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인 체크</title>
</head>
<body>
	<div> 
		<h3>*아이디 중복확인*</h3>
		<form method="post" action="idDuplOk.jsp" onsubmit="return blankCheck(this)">
			아이디 : <input type="text" name="id" maxlength="10" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>
<script src="resources/idDuplCheck.js"></script>
</body>
</html>