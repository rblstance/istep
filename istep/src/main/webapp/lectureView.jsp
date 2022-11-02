<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<%
String code = request.getParameter("code");
String thumbnail = request.getParameter("img");
String title = request.getParameter("title");
String author = request.getParameter("author");
String datetime = request.getParameter("datetime");
System.out.println(code);
%>
	<jsp:include page="header.jsp"/>
	<input type="hidden" class="code" value="<%=code %>" />
  	<div id="player"></div>
    <script src="resources/lectureView.js"></script>
     <jsp:include page="footer.jsp"/>
</body>
</html>