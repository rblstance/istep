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
if(code!=null){
	LectureDao lecDao = LectureDao.getInstance();
	LectureDto lecture = lecDao.getLectureByCode(code);
}
System.out.println(grade);
%>
	<jsp:include page="header.jsp"/>
		<section>
			<input type="hidden" class="code" value="<%=code%>" name="code" />
		  	<div id="player"></div>
		  	<%if(grade.equals("C")) {%>
		  		<input type="button" value="강의 추가" onclick="location.href='addLectrue'"/> 
		  	<%} %>
		  	<div></div>
  		</section>
     <jsp:include page="footer.jsp"/>
    <script src="resources/lectureView.js"></script>
</body>
</html>