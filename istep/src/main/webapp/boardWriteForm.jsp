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
	<h1>글 작성</h1>
	<div>
		<form name="writeForm" method="post" action="BoardWrite">
			<input type="text" name="title" required>
			<textarea name="content" row="20" required></textarea>
			<input type="submit"  value="작성" >
		</form>
	</div>


</body>
</html>