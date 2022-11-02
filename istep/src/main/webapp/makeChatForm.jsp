<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="resources/makeChatForm.css">
</head>
<body>
<%
UserDao dao = UserDao.getInstance();
UserDto member = null;
String user = (String)session.getAttribute("log");
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<div>
            <form method="post" action="">
            	<input type="hidden" name="code" id="code" value="">
				<input type="hidden" name="host_id" id="host_id" value="<%=user%>">
				<table>
                	<tbody>
                		<tr>
                			<td>채팅방 이름</td>
                			<td><input type="text" name="name" id="name"></td>
                		</tr>
                		<tr>
                			<td>멤버 초대</td>
                			<td><input type="button" value="아이디 조회" name="user_id" id="user_id" onclick="openPop()"></td>
                		</tr>
                		<tr>
                			<td><input type="submit" value="생성하기"></td>
                		</tr>
                	</tbody>
                </table>
            </form>
        </div>

        <div class="popup" id="popup" style="display: none; position: fixed;">
            <div class="popup_box">
                <div style="height: 10px; width: 375px; float: top;"></div>
                <input type="button" onclick="closePop()" value="상단 닫는 버튼 아이콘,,">
                <div class="popup_content">
                    <label>아이디 검색</label><br><input type="text" name="user_id" id="user_id"><br>
                    <input type="button" value="검색" onclick="">
                    <%//if %>
                    <div>
                    	
                    </div>
                    <%
                    // 이거를 onclick했을 때만 작동하도록
                    //member = dao.getUserById("user_id");
                    //if(user != null){
                    	// 검색 결과 보여주기
                    	// 아이디 검색 결과 옆에 추가 버튼
                    //} else {
                    	// 존재하지 않는 아이디입니다.
                    //}
                    %>
                    <div name="s_result">
                    	여기 검색 결과를 노출합시다
	                    입력 안 했을 때는 노출하지 맙시다~
	                    <input type="button" value="추가"><br>
                    </div>
                    추가하면 여기 쭈르륵 추가된 사람 나오고 <input type="button" value="누르면 지워짐">
                </div>
                <div class="close_button" style="float: bottom; margin-top: 200px;">
                    <a href="javascript:closePop()">닫기</a>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="footer.jsp"/>
	<script src="resources/makeChatForm.js"></script>
</body>
</html>