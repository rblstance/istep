<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<jsp:include page="header.jsp"/>
    <section>
    	<p>과목명 : </p> <input type="text" name="subject" />
    		<p>강사 : </p> <input type="text" name="teacher" placeholder=",로 여러명 추가"/>		
    		<p>과목설명 : </p> <textarea name="explain"></textarea>
    		<p>과목분야 :</p>
    		<select>
    			<option>JAVA</option>
    			<option>JavaScript</option>
    			<option>Python</option>
    			<option>C#</option>
    			<option>C++</option>
    			<option>HTML</option>
    			<option>CSS</option>
    		</select>  
    		<input type="button" value="과목 수정" onclick="location.href='updSubject.jsp'"/>
    		<input type="button" value="과목 삭제" onclick="location.href='delSubject'"/>
    		<input type="button" value="돌아가기" onclick="location.href='subjectM.jsp'"/>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>