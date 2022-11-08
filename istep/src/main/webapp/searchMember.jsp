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
	<input type="button" value="닫기" onclick="setMemList()"> // setMemList() 얘도 먼지 기억이 안 남 ....
	
// 이 아래는 내가 원래 해보려고 했던 것 같은데 먼지 잘 기억이 안 남 ...........
	<input type="hidden" value="arr.push(return searchMember())">
	
	<script src="resources/chatMemberMng.js?ver=3"></script>
</body>
</html>