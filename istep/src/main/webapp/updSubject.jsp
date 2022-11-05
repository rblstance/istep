<%@page import="subject.SubjectDto"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<%
request.setCharacterEncoding("UTF-8");

int code = Integer.parseInt(request.getParameter("code"));
SubjectDao sbjDao = SubjectDao.getInstance();
SubjectDto sbj = sbjDao.getSubjectByCode(code);
System.out.println(sbj.getName());
%>
	<jsp:include page="header.jsp" />
	<section>
		<form method="POST" action="updSubject">
			<input type="hidden" name="code" value="<%=code %>" />
			<p>과목명 :</p>
			<input type="text" name="subject" value="<%=sbj.getName()%>" />
			<p>강사 :</p>
			<input type="text" name="teacher" value="<%=sbj.getTeacher()%>" />
			<p>과목설명 :</p>
			<textarea name="explain"><%=sbj.getExplain()%></textarea>
			<p>과목분야 :</p>
			<select name="kind">
				<option>JAVA</option>
				<option>JavaScript</option>
				<option>Python</option>
				<option>C#</option>
				<option>C++</option>
				<option>HTML</option>
				<option>CSS</option>
			</select> <input type="submit" value="과목 수정" />
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>