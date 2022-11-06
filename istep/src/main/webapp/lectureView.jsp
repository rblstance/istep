<%@page import="lecture.LectureDto"%>
<%@page import="lecture.LectureDao"%>
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/youtubeView.css" />
<title>Document</title>
</head>
<body>
	<%
String log = (String)session.getAttribute("log");
String grade = "";
if(log!=null){
	UserDao userDao = UserDao.getInstance();
	UserDto user = userDao.getUserById(log);
	grade = user.getGrade();
}
String code = request.getParameter("code");
String sbjCode = request.getParameter("sbjCode");
String url = request.getParameter("url");
String title = request.getParameter("title");
String thumbnail = request.getParameter("thumbnail");
String playTime = request.getParameter("time");
String regDate = request.getParameter("regDate");
%>
	<jsp:include page="header.jsp" />
	<section>
		<div class="frame">
			<div class="video_box">
				<div class="video">
					<div id="player"></div>
				</div>
				<form method="POST" action="addLecture">
					<input type="hidden" value="<%=code%>" name="code" class="code" /> <input
						type="hidden" value="<%=sbjCode%>" name="sbjCode" /> <input
						type="hidden" value="<%=thumbnail%>" name="thumbnail" /> <input
						type="hidden" value="<%=url%>" name="url" /> <input type="hidden"
						name="playTime" value="<%=playTime%>" />
						
					<div>
						<input type="text" name="title" value="<%=title%>" readonly />  
						<input type="text" name="regDate" value="<%=regDate%>" readonly />
						<%if(grade.equals("C")) {%>
						<input type="submit" value="강의 추가" />
						<%} %>
					</div>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="resources/lectureView.js"></script>
</body>
</html>