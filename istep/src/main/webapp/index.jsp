<%@page import="lecture.LectureDto"%>
<%@page import="lecture.LectureDao"%>
<%@page import="subject.SubjectDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/main.css?ver=1" />
</head>
<body>
<%
	SubjectDao sbjDao = SubjectDao.getInstance();
	ArrayList<SubjectDto> sbjList = sbjDao.getSubjectAll();
	String videoId = "";
	for(int i=0;i<=sbjList.size();i++){
		int sbjCode = sbjList.get(sbjList.size()-1).getCode();
		LectureDao lecDao = LectureDao.getInstance();
		ArrayList<LectureDto> lecList = lecDao.getLectureListBySbjCode(sbjCode);
		if(lecList.size()>0){
			videoId = lecList.get(0).getCode();
			break;
		}	
	}
	%>
	<jsp:include page="header.jsp" />
	<section>
		<div class="frane">
			<div class="video">
				<div class="recommen_video">
					<iframe id="mainVideo" width="424" height="238"
						src="https://www.youtube.com/embed/<%=videoId%>?mute=1&autoplay=1"></iframe>
				</div>
			</div>
		</div>
		<div class="sbj_box">
			<%for(SubjectDto sbj : sbjList) {%>
			<div class="sbj_content">
				<p><%=sbj.getKind()%>
				<h2>
					<a href="lecture.jsp?code=<%=sbj.getCode()%>"><%=sbj.getName()%></a>
				</h2>
				<p><%=sbj.getTeacher()%></p>
				<p><%=sbj.getExplain() %></p>
				<form method="POST" action="registration">
					<input type="hidden" value="<%=sbj.getCode()%>" name="sbj_code" />
					<input type="hidden" value="<%=sbj.getCode()%>" name="sbj_code" />
					<input type="submit" value="수강신청" />
				</form>
			</div>
			<%} %>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>