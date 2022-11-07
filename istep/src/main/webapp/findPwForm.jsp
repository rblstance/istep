<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/login.css" />
</head>
<body>
<jsp:include page="header.jsp" />
<section>
	<h1>비밀번호 찾기</h1>
			<form method="POST" action="findPw">
			<table border=1>
				<tr>
					<th>아이디</th>
					 <td><input type="text" name="id" placeholder="id"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" placeholder="name"></td>
				</tr>
				</table>
				<div class="sign">
					<input type="submit" value="비밀번호 찾기">
				</div>
		</form>
		</section>
<jsp:include page="footer.jsp" />
</body>
</html>