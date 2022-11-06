<%@page import="lecture.LectureDto"%>
<%@page import="lecture.LectureDao"%>
<%@page import="registrations.RegistrationsDao"%>
<%@page import="registrations.RegistrationsVo"%>
<%@page import="subject.SubjectDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/subject.css" />
</head>
<body>
	<%
String id = (String)session.getAttribute("log");
RegistrationsDao regDao = RegistrationsDao.getInstance();
LectureDao lecDao = LectureDao.getInstance();
ArrayList<RegistrationsVo> regList = regDao.getRegistrationsById(id);

%>
	<jsp:include page="header.jsp" />
	<section>
		<%for(RegistrationsVo reg : regList) {
			SubjectDao sbjDao = SubjectDao.getInstance();
			SubjectDto sbj = sbjDao.getSubjectByCode(reg.getSbj_code());%>
		<div class="group">
			<input type="hidden" value="<%=sbj.getCode() %>" />
			<p>
				<a href="lecture.jsp?code=<%=sbj.getCode()%>"><%=sbj.getName() %></a>
			</p>
			<input type="text" value="<%=sbj.getTeacher()%>" readonly /> <input
				type="text" value="<%=sbj.getKind() %>" readonly />
		</div>
		<%} %>
		<%if(regList.size()==0) {%>
			<p>신청하신 과목이 없습니다.</p>
		<%} %>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>