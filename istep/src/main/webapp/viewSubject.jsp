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
			<input type="hidden" name="code" value="<%=code %>" />
			<div class="col_box">
				<p>과목명 :</p>
				<input type="text" name="subject" value="<%=sbj.getName() %>"
					readonly />
			</div>
			<div class="col_box">
				<p>강사 :</p>
				<input type="text" name="teacher" value="<%=sbj.getTeacher() %>"
					readonly />
			</div>
			<div class="col_box" id="text_box">
				<p>과목설명 :</p>
				<textarea name="explain" readonly><%=sbj.getExplain() %></textarea>
			</div>
			<div class="col_box">
				<p>과목분야 :</p>
				<input type="text" name="kind" value="<%=sbj.getKind()%>" readonly></input>
			</div>
			<div class="btn_box">
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