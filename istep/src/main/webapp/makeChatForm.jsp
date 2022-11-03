<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<%

UserDao dao = UserDao.getInstance();
UserDto user = null;
String id = "";
///////////
dao.getUserById(id);
%>
	<jsp:include page="header.jsp"/>
    <section>
    	<div>
            <form method="post" action="makeChatForm">
            	<input type="hidden" name="code" id="code" value="">
				<%//<input type="hidden" name="host_id" id="host_id" value="<%=%>"> %>
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

        <div class="popup_content">
                	<form method="post" action="printId">
                		<input type="text" name="user_id" id="user_id" value=<%=request.getAttribute("#user_id")%>><br>
	                    <input type="submit" value="검색" class="search_member" id="search_member" onclick="printId">
                	</form>
                    <div name="s_result" id="s_result">
                    	<%
                    	if(request.getAttribute("result") != null){
                    	UserDto s_user = (UserDto)request.getAttribute("result");
                    	if(s_user != null){
                    	%>
                    	<span>이름 <%=s_user.getName() %></span>
                    	<span>닉네임 <%=s_user.getNickname() %></span>
	                    <input type="button" value="추가"><br>
	                    <%} else { %>
	                    없는 아이디입니다.
	                    <%} %>
	                    <%} %>
                    </div>
                    <%if(request.getAttribute("insterted") != null){ %>
                    	
                    <%} %>
                    추가하면 여기 쭈르륵 추가된 사람 나오고 <input type="button" value="누르면 지워짐">
                </div>
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>