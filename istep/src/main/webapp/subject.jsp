<%@page import="subject.SubjectDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="subject.SubjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<%
SubjectDao sbjDao = SubjectDao.getInstance();
ArrayList<SubjectDto> sbjList = sbjDao.getSubjectAll();
%>
	<jsp:include page="header.jsp"/>
    <section>
        <%for(SubjectDto sbj : sbjList) {%>
        <div>
        	<p><%=sbj.getKind()%>
        	<h2><a href="lecture.jsp?code=<%=sbj.getCode()%>"><%=sbj.getName()%></a></h2>
        	<p><%=sbj.getTeacher()%></p>
        	<p><%=sbj.getExplain() %></p>
        </div>
        <%} %>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>