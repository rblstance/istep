<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<jsp:include page="header.jsp"/>
    <section>
    	<form method="POST" action="addSubject">
    		<p>과목명 : </p> <input type="text" name="subject" />
    		<p>강사 : </p> <input type="text" name="teacher" placeholder=",로 여러명 추가"/>		
    		<p>과목설명 : </p> <textarea name="explain"></textarea>
    	</form>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>