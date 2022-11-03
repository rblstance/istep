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
%>
	<jsp:include page="header.jsp"/>
    <section>
	    <input type="hidden" id="keyword" value="<%=keyword %>" />
	    <div class="search_box">
	    	<form method="POST" action="lectureM.jsp">
	    		<input type="text" placeholder="검색" id="search" name="keyword" />
	    		<input type="submit" value="검색"/>
	    	</form>
	    </div>
	   	<div class="selSbj">
	   		<fieldset form="sendLecture">
	   		<%for(int i=0;i<sbjList.size();i++) { 
	   			int code = sbjList.get(i).getCode();
	   			System.out.println(code);
	   			if(i==0){%>
		   			<input type="radio" id="<%=sbjList.get(i).getCode()%>" value="<%=sbjList.get(i).getCode()%>" name="subject" checked>
		   		<%} else{%>
		   			<input type="radio" id="<%=sbjList.get(i).getCode()%>" value="<%=sbjList.get(i).getCode()%>" name="subject">
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