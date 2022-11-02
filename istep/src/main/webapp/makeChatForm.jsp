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
UserDto dto = null;
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<div>
            <form method="post" action="">
                <table>
                	<tbody>
                		<td><input type="hidden" name="code" id="code" value=""></td>
                		<td><input type="hidden" name="host_id" id="host_id" value=""></td>
                		<td><label for="name">채팅방 이름</label><br><input type="text" name="name" id="name"></td>
                		<td><label for="code">멤버 초대</label><br><input type="button" value="아이디 조회" name="" id="" onclick="openPop()"></td>
                		<td><input type="submit" value="생성하기"></td>
                		<td></td>
                	</tbody>
                </table>
            </form>
        </div>

        <div class="popup" id="popup" style="display: none; position: fixed;">
            <div class="popup_box">
                <div style="height: 10px; width: 375px; float: top;"></div>
                <input type="button" onclick="closePop()" value="여기 닫는 버튼 있으면 좋겠다">
                <div class="popup_content">
                    <label>아이디 검색</label><br><input type="text" name="user_id" id="user_id"><br>
                    <%
                    // 이거를 onclick했을 때만 작동하도록
                    UserDto user = dao.getUserById("user_id");
                    if(user != null){
                    	// 검색 결과 보여주기
                    	// 아이디 검색 결과 옆에 추가 버튼
                    } else {
                    	// 존재하지 않는 아이디입니다.
                    }
                    %>
                    <input type="button" value="검색" onclick="">
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