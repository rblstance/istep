<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
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
				<p>
					아이디 : <input type="text" name="id" placeholder="ID"></input>
				<p>
				<p>
					비밀번호 : <input type="password" name="password"
						placeholder="Password"></input>
				<p>
					<input type="submit" value="로그인">
			</form>
			<p><a href="findIdForm.jsp">아이디 찾기</a></p>
			<p><a href="findPwForm.jsp">비밀번호 찾기</a></p>
		</div>
		<%
		String clientId = "f_9l7U2Ws6U7DuoYxc5s";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:8080/istep/json", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		%>
		<a href="<%=apiURL%>"><img height="50"
			src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>