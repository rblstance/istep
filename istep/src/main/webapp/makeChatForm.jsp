<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/table.css" />
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String log = (String)session.getAttribute("log");
%>
<jsp:include page="header.jsp" />
	<section>
		<h2>새 채팅</h2><br>
		<form name="makeChat" method="post" action="makeChat">
			<table border=1>
				<tr>
					<th>채팅방 이름</th>
					<td><input type="text" name="name" id="name" style="width:600px"></td>
				</tr>
				<tr>
					<th>소개</th>
					<td><textarea name="data" id="data" style="width:600px"></textarea></td>
				</tr>
				<tr>
					<th>채팅방 타입</th>
					<td  style="width:800px"  style="position:flex;">
						<input type="radio" name="custom_type" value="스터디룸" style="vertical-align: -1px;margin-right: 4px;"/><span style="margin-right: 50px;">스터디룸</span>
						<input type="radio" name="custom_type" value="1:1 대화" style="vertical-align: -1px;margin-right: 4px;"/><span style="margin-right: 50px;">1:1 대화</span>
						<input type="radio" name="custom_type" value="자유 대화" style="vertical-align: -1px;margin-right: 4px;"/><span style="margin-right: 50px;">자유 대화</span>
					</td>
				</tr>
				<tr>
                	<td>멤버 초대</td>
                	<td>
                		<input type="text" id="user_id" name="user_id">
						<input type="button" value="검색" onclick="searchMember()">
						<div class="container"></div>
                	</td>
                </tr>
				<tr>
					<th>접속코드</th>
					<td><input type="text" name="access_code" id="access_code" style="width:600px"></td>
				</tr>
				<tr style="align-items: stretch;">
					<td colspan="2">
						<input type="hidden" value="<%=log%>" id="host_id">
						<button type="submit" onclick="makeChannel()" style="width: 100px;">채팅방 생성</button>
						<button type="button" onclick="location.href='chat'" style="width: 100px;">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<script src="resources/chatMemberMng.js?ver=1"></script>
	<script src="resources/makeChat.js?ver=2"></script>
</body>
</html>