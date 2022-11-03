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
%>
	<jsp:include page="header.jsp"/>
    <section>
   	<div>
   		<%for(SubjectDto sbj : sbjList) { %>
   		<form action="sendSbjCode">
   			<h2><%=sbj.getName()%></h2>
   			<p><%=sbj.getExplain()%></p>
 		</form>
   		<%} %>
   		<input type="button" value="강의 검색"/>
   	</div>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>