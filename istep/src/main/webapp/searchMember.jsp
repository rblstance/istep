<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchMember</title>
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<input type="text" id="user_id">
	<input type="button" value="검색" onclick="searchMember()"><br>
	<div class="container">
	</div>
	<input type="button" value="닫기" onclick="setMemList()">
	
	<input type="hidden" value="arr.push(return searchMember())">
	
	<script src="resources/chatMemberMng.js?ver=3"></script>
</body>
</html>