<%@page import="lecture.LectureDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/lectureM.css" />
</head>
<body>
	<%
String sbjParam = request.getParameter("code");
ArrayList<LectureDto> lecList = null;
LectureDao lecDao = LectureDao.getInstance();
if(sbjParam!=null){
	int sbjCode = Integer.parseInt(sbjParam);
	lecList = lecDao.getLectureListBySbjCode(sbjCode);
}
%>
	<jsp:include page="header.jsp" />
	<section>
		<div class="lecture_container">
		<%for(LectureDto lec : lecList) {%>
		<article class="content">
			<form class="sendLecture" method="post" action="loadLecture">
				<input type="hidden" name="url" value="<%=lec.getUrl() %>" />
				<input type="hidden" name="time" value="<%=lec.getTime()%>" />
				<input type="hidden" name="title" value="<%=lec.getName() %>" readonly>
				<input type="hidden" name="sbjCode" value="<%=lec.getSbjCode()%>" />
				<input type="hidden" name="thumbnail" value="<%=lec.getThumbnail()%>" readonly>
				<input name="code" type="hidden" value="<%=lec.getCode()%>"> 
				<input name="playTime" type="hidden" value="<%=lec.getTime()%>">
				<input name="regDate" type="hidden" value="<%=lecDao.getRegDate(lec.getRegDate())%>">
				<p class="title"><%=lec.getName()%></p>
				<input type="image" class="thumbnail" src="<%=lec.getThumbnail()%>">
				<p class="playTime"><%=lec.getTime()%></p>
				<p class="regDate"><%=lecDao.getRegDate(lec.getRegDate())%></p>
			</form>
		</article>
		<%} %>
		</div>
		<jsp:include page="board.jsp" />
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>