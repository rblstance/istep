<%@page import="java.util.ArrayList"%>
<%@page import="subject.SubjectDto"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/lectureM.css" />
<link rel="stylesheet" href="resources/searchBox.css" />
</head>
<body>
	<%
SubjectDao dao = SubjectDao.getInstance();
ArrayList<SubjectDto> sbjList = dao.getSubjectAll();
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
String code = request.getParameter("sbjCode");
String loadCode = request.getParameter("codeArg");

%>
	<jsp:include page="header.jsp" />
	<section>
		<input type="hidden" id="keyword" value="<%=keyword %>" />
		<input type="hidden" id="loadCode" value="<%=loadCode%>"/>
		<div class="search_box">
			<form method="POST"  action="lectureM.jsp">
				<input type="hidden" id="codeArg" name="codeArg"/>
				<input type="hidden" id="subject" name="checkSbj" /> <input
					type="search" placeholder="검색" id="search" name="keyword" /> 
			</form>
		</div>
		<div class="selSbj">
			<fieldset id="category" form="">
				<%for(int i=0;i<sbjList.size();i++) { 
	   			SubjectDto sbj = sbjList.get(i);
	   			if(i==0){ %>
				<input type="radio" id="<%=sbj.getCode()%>"
					value="<%=sbj.getCode()%>" name="subject"
					onclick="getSbjCode(event)" />
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
				<input type="button" class="next_btn" value="더보기" onclick="nextPage()" />
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="resources/loadLecture.js?ver=4"></script>
</body>
</html>