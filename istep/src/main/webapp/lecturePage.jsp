<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
<%
String subject = request.getParameter("sbj");
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<input type="hidden" class="subject" value="<%=subject %>" />
    	<div class="lecture_container"></div>
    </section>
	<jsp:include page="footer.jsp"/>
	<script src="resources/loadLectures.js"></script>
</body>
</html>