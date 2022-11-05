<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"charset="utf-8"></script>
<title>로그인</title>
</head>
<body>
<%
String token = request.getParameter("access_token");
System.out.println(token);
%>
<!-- https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=f_9l7U2Ws6U7DuoYxc5s&client_secret=vvD17C3mZh&access_token=AAAAO80r1jL-SvsRRZnyg9K39syVwk6J_vz-TTuSiAO7Cf8UPpWyyAlhwighsSA-jN2XJ6iB0POwpojvcH-dHE84vTo&service_provider=NAVER -->
	<jsp:include page="header.jsp" />
	<section>
		<h1>Login</h1>
		<div>
			<form method="POST" action="login">
				<p>
					아이디 : <input type="text" name="id" placeholder="ID"></input>
				<p>
				<p>
					비밀번호 : <input type="password" name="password"
						placeholder="Password"></input>
				<p>
					<input type="submit" value="로그인">
			</form>
		</div>
		 <div id="naverIdLogin"></div>
		 <a id="logout" href="">로그아웃</a>
		 <input type="hidden" id="token" value="token">
	</section>
	<jsp:include page="footer.jsp" />
<script src="resources/naverButton.js"></script>
<script src="resources/naverLogin.js"></script>
</body>
</html>