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
<!-- 관리자만 접근 가능한 페이지-->
<%
	SubjectDao sbjDao = SubjectDao.getInstance();
	ArrayList<SubjectDto> sbjList = sbjDao.getSubjectAll();
%> 
	<jsp:include page="header.jsp"/>
    <section>
    	<table border="1">
    		<thead>
    			<tr>
    				<th>과목코드</th>
    				<th>과목명</th>
    				<th>개설강사</th>
    				<th>분야</th>
    			</tr>
    		</thead>
			<tbody>
				<%for(SubjectDto sbj : sbjList) {%>
    			<tr>
    				<td><%=sbj.getCode() %></td>
    				<td><a href="viewSubject.jsp"><%=sbj.getName() %></a></td>
    				<td><%=sbj.getTeacher() %></td>
    			</tr>			
    			<%} %>
			</tbody>
    	</table>
    	<input type="button" value="과목추가" onclick="location.href=addSubject.jsp" />
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>