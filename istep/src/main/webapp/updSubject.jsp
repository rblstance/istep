<%@page import="subject.SubjectDto"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/view.css?ver=2" />
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int code = Integer.parseInt(request.getParameter("code"));
SubjectDao sbjDao = SubjectDao.getInstance();
SubjectDto sbj = sbjDao.getSubjectByCode(code);
String sub = sbj.getKind();
System.out.println(sbj.getName());
%>
	<jsp:include page="header.jsp" />
	<section>
		<form method="POST" action="updSubject">
			<input type="hidden" name="code" value="<%=code%>" />
			<h1>과목 추가</h1>
			<div class="group">
				<input type="text" name="subject" value="<%=sbj.getName()%>" required> <span class="highlight"></span>
				<span class="bar"></span> <label>과목명</label>
			</div>
			<div class="group">
				<input type="text" name="teacher" value="<%=sbj.getTeacher()%>" required> <span class="highlight"></span>
				<span class="bar"></span> <label>강사</label>
			</div>
			<div class="group">
				<textarea name="explain"><%=sbj.getExplain()%></textarea> <span class="highlight"></span>
				<span class="bar"></span> <label>과목설명</label>
			</div>
			<div class="group">
				<span class="highlight"></span>
				<span class="bar"></span>
				<select name="kind">
					<option value="JavaScript">JavaScript</option>
					<option value="JAVA">JAVA</option>
					<option value="Python">Python</option>
					<option value="C#">C#</option>
					<option value="C++">C++</option>
					<option value="HTML">HTML</option>
					<option value="CSS">CSS</option>
				</select> 
			</div>
			<input type="submit" value="과목 수정" />
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>