<%@page import="java.util.ArrayList"%>
<%@page import="subject.SubjectDto"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
<%
SubjectDao dao = SubjectDao.getInstance();
ArrayList<SubjectDto> sbjList = dao.getSubjectAll();
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
String selSbj = request.getParameter("subject");
%>
	<jsp:include page="header.jsp"/>
    <section>
	    <input type="hidden" id="keyword" value="<%=keyword %>" />
	    <input type="hidden" id="selSbj" value="<%=selSbj %>" />
	    <div class="search_box">
	    	<form method="POST" action="lectureM.jsp">
	    		<input type="hidden" id="subject" name="subject" />
	    		<input type="text" placeholder="검색" id="search" name="keyword" />
	    		<input type="submit" value="검색"/>
	    	</form>
	    </div>
	   	<div class="selSbj">
	   		<fieldset>
	   		<%for(int i=0;i<sbjList.size();i++) { 
	   			int code = sbjList.get(i).getCode();
	   			if(i==0){%>
		   			<input type="radio" id="<%=code%>" value="<%=code%>" name="subject" onclick="getSbjCode(event)" checked />
		   		<%} else{%>
		   			<input type="radio" id="<%=code%>" value="<%=code%>" name="subject" onclick="getSbjCode(event)"/>
	   			<%}%>
	   			<label for="subject"><%=sbjList.get(i).getName()%></label>
	   		<%} %>
	   		</fieldset>
	   	</div>
	   	<div class="lectures">
	   		<div class="lecture_container"></div>
	   	</div>
    </section>
	<jsp:include page="footer.jsp"/>
	<script src="resources/loadLecture.js?ver=1"></script>
</body>
</html>