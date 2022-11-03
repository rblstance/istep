<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String log = (String)session.getAttribute("log");
	%>
	<jsp:include page="header.jsp"/>
    <section>
        마이페이지~!
        <input type="button" onclick="location.href='deleteForm'" value="회원탈퇴">
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>