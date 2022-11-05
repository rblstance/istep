<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    String sbjParam = request.getParameter("code");
	String id = (String) session.getAttribute("log");
	%>
	<jsp:include page="header.jsp" />
	<section>
		<h1>글 작성</h1>
		<div>
			<form name="writeForm" method="post" action="BoardWrite">
				<input type="hidden" name="id" value=<%=id %>> <input
					type="hidden" name="code" value=<%=sbjParam %>>
				<div>
					<input type="text" name="title" required>
				</div>
				<div>
					<textarea name="content" row="20" required></textarea>
				</div>
				<input type="submit" value="작성">
			</form>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>