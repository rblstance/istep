<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>* 이메일 중복 확인 결과 *</h3>
	<%  
	//1) 사용가능한 이메일 경우, 이메일 입력 폼에 넣기 위함
	UserDao dao = UserDao.getInstance();
	String email = request.getParameter("email");
	int cnt = dao.duplecateEmail(email);

	if (cnt == 0) {
		out.println("<p>사용 가능한 이메일입니다.</p>");
		out.println("<a href='javascript:apply(\"" + email + "\")'>[적용]</a>");
	} else {
		out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
	} //if end
	%>

	<script>
		function apply(email) {
			//2) 중복확인 email를 부모창에 적용
			//부모창 opener
			opener.document.regForm.email.value = email;
			window.close(); //창닫기
		}//apply () end
	</script>

	<hr>
	<a href="javascript:history.back()">[다시시도]</a> &nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
</body>
</html>