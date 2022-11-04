<%@page import="lecture.LectureDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
<%
String sbjParam = request.getParameter("code");
ArrayList<LectureDto> lecList = null;
int sbjCode = 0;
if(sbjParam!=null){
	sbjCode = Integer.parseInt(sbjParam);
	LectureDao lecDao = LectureDao.getInstance();
	lecList = lecDao.getLectureListBySbjCode(sbjCode);
}
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<%for(LectureDto lec : lecList) {%>
    	<article class="content">
			<form class="sendLecture" method="post" action="loadLecture">
				<input type="hidden" name="sbjCode" value="<%=lec.getSbjCode()%>" />
				<p class="title"><%=lec.getName()%></p>
				<input class="code" name="code" type="hidden" value="<%=lec.getCode()%>">
				<img class="thumbnail" name="thumbnail" src="<%=lec.getThumbnail()%>">
				<p class="playTime"><%=lec.getTime()%></p>
				<p class="regDate"><%=lec.getRegDate()%></p>
				<input class="view" type="submit" value="영상보기">
			</form>
		</article>
		<%} %>
    
	<jsp:include page="board.jsp"/>
    
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>