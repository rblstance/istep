<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="resources/login.css" />
</head>
<body>
<jsp:include page="header.jsp" />
<section>
	<h1>아이디 찾기</h1>
			<form method="POST" action="findId">
			<table border=1>
				<tr>
					<th>이름</th>
					 <td><input type="text" name="name" placeholder="name"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" placeholder="email"></td>
				</tr>
				</table>
				<div class="sign">
				<input type="submit" value="아이디찾기">
				</div>
		</form>
		</section>
<jsp:include page="footer.jsp" />
</body>
</html>