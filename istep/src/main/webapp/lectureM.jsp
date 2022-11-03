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
int selSbj = 0;
if(request.getParameter("selSbj")!=""){
	selSbj = Integer.parseInt(request.getParameter("selSbj"));
}
%>
	<jsp:include page="header.jsp"/>
    <section>
	    <input type="hidden" id="keyword" value="<%=keyword %>" />
	    <input type="hidden" id="selSbj" value="<%=selSbj %>" />
	    <div class="search_box">
	    	<form method="POST" action="lectureM.jsp">
	    		<input type="hidden" id="subject" name="checkSbj" />
	    		<input type="text" placeholder="검색" id="search" name="keyword" />
	    		<input type="submit" value="검색"/>
	    	</form>
	    </div>
	   	<div class="selSbj">
	   		<fieldset>
	   		<%for(int i=0;i<sbjList.size();i++) { 
	   			SubjectDto sbj = sbjList.get(i);
	   			if(sbj.getCode()==selSbj){ %>
		   			<input type="radio" id="<%=sbj.getCode()%>" value="<%=sbj.getCode()%>" name="subject" onclick="getSbjCode(event)" checked />
		   		<%} else{%>
		   			<input type="radio" id="<%=sbj.getCode()%>" value="<%=sbj.getCode()%>" name="subject" onclick="getSbjCode(event)"/>
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
	<script src="resources/loadLecture.js?ver=2"></script>
</body>
</html>