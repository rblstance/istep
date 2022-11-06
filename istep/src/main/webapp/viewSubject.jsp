<%@page import="org.json.JSONArray"%>
<%@page import="subject.SubjectDto"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/view.css" />
</head>
<body>
	<%
request.setCharacterEncoding("UTF-8");

int code = Integer.parseInt(request.getParameter("code"));
SubjectDao sbjDao = SubjectDao.getInstance();
SubjectDto sbj = sbjDao.getSubjectByCode(code);
%>
	<jsp:include page="header.jsp" />
	<section>
		<form method="POST" action="updSubjectForm">
			<h1>강의 정보</h1>
			<input type="hidden" name="code" value="<%=code %>" />
			<div class="group">
				<span class="highlight"></span>
				<span class="bar"></span>
				<input type="text" name="subject" value="<%=sbj.getName() %>"
					readonly />
			</div>
			<div class="group">
				<span class="highlight"></span>
				<span class="bar"></span>
				<input type="text" name="teacher" value="<%=sbj.getTeacher() %>"
					readonly />
			</div>
			<div class="group" id="text_box">
				<span class="highlight"></span>
				<span class="bar"></span>
				<textarea name="explain" readonly><%=sbj.getExplain() %></textarea>
			</div>
			<div class="group">
				<span class="highlight"></span>
				<span class="bar"></span>
				<input type="text" name="kind" value="<%=sbj.getKind()%>" readonly></input>
			</div>
			<div class="group">
				<input type="submit" value="과목 수정" /> <input type="button"
					value="과목 삭제" onclick="location.href='delSubject?code=<%=code%>'" />
				<input type="button" value="돌아가기"
					onclick="location.href='subjectM.jsp'" />
			</div>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>