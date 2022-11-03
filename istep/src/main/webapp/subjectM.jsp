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
    	<table border="1">
    		<thead>
    			<tr>
    				<th>과목 코드</th>
    				<th>과목명</th>
    				<th>담당 강사</th>
    				<th>분야</th>
    			</tr>
    		</thead>
    		<thead>
    		</thead>
    		<tbody>
    		<%for(SubjectDto sbj : sbjList) {%>
    			<tr>
    				<th><%=sbj.getCode() %></th>
    				<th><a href="viewSubject.jsp?code=<%=sbj.getCode()%>"><%=sbj.getName() %></a></th>
    				<th><%=sbj.getTeacher()%></th>
    				<th><%=sbj.getKind() %></th>
    			</tr>
   			<%} %>
   			</tbody>
    	</table>
    	<input type="button" value="글쓰기" onclick="location.href='addSubject.jsp'" />
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>