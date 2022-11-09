<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인</title>
<link rel="stylesheet" href="resources/login.css" />
</head>
<body>
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
	<jsp:include page="header.jsp" />
	<section>
		<h1 class="title">Login</h1>
		
			<div class="naver">
            <a href="<%=apiURL%>"><img height="50" src="resources/btn_naver.png" /></a>
   			</div>
   			
			<form method="POST" action="login">
			<table border=1>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" placeholder="ID" size="30"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" placeholder="Password" size="30"></td>
				</tr>
			</table>
			<div class="sign">
            	<input type="submit" value="로그인">
           </div>
			<div class="sign">
				<a href="signUpForm">회원가입</a> / 
            	<a href="findIdForm.jsp">아이디 찾기</a> / 
            	<a href="findPwForm.jsp">비밀번호 찾기</a>
           </div>
			</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>