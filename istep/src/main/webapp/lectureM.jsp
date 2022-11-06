<%@page import="java.util.ArrayList"%>
<%@page import="subject.SubjectDto"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/lectureM.css" />
</head>
<body>
	<%
SubjectDao dao = SubjectDao.getInstance();
ArrayList<SubjectDto> sbjList = dao.getSubjectAll();
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
%>
	<jsp:include page="header.jsp" />
	<section>
		<input type="hidden" id="keyword" value="<%=keyword %>" />
		<div class="search_box">
			<form method="POST" action="lectureM.jsp">
				<input type="hidden" id="subject" name="checkSbj" /> <input
					type="text" placeholder="검색" id="search" name="keyword" /> <input
					type="submit" value="검색" />
			</form>
		</div>
		<div class="selSbj">
			<fieldset>
				<%for(int i=0;i<sbjList.size();i++) { 
	   			SubjectDto sbj = sbjList.get(i);
	   			if(i==0){ %>
				<input type="radio" id="<%=sbj.getCode()%>"
					value="<%=sbj.getCode()%>" name="subject"
					onclick="getSbjCode(event)" checked />
				<%} else{%>
				<input type="radio" id="<%=sbj.getCode()%>"
					value="<%=sbj.getCode()%>" name="subject"
					onclick="getSbjCode(event)" />
				<%}%>
				<label for="subject"><%=sbjList.get(i).getName()%></label>
				<%} %>
			</fieldset>
		</div>
		<div class="lectures">
			<div class="lecture_container"></div>
			<div class="page_ctrl">
				<input type="button" class="back_btn" value="이전" onclick="backPage()" />
				<input type="button" class="next_btn" value="다음" onclick="nextPage()" />
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="resources/loadLecture.js?ver=3"></script>
</body>
</html>