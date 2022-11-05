<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chat.ChatDto"%>
<%@page import="chat.ChatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String log = (String)session.getAttribute("log");
	String c_code = request.getParameter("c_code");
	ChatDao dao = ChatDao.getInstance();
	ChatDto chat = dao.getChatByCode(c_code);
	MemberDao mDao = MemberDao.getInstance();
	ArrayList<MemberDto> members = mDao.getMemberByC_code(c_code);
	%>
	<jsp:include page="header.jsp"/>
    <section>
    	<table>
    		<thead>
    			<tr>
    				<th><%=chat.getName() %> 관리</th>
    			</tr>
    		</thead>
    		<tbody>
    			<tr>
    				<td>채팅방 코드</td>
    				<td><%=chat.getCode() %></td>
    			</tr>
    			<tr>
    				<td>멤버</td>
    				<td>
    				<%for(MemberDto member : members){ %>
    					<ul>
    						<li><%=member.getUser_id() %></li>
    						<li><a href="#">강퇴하기</a></li>
    					</ul>
    				<%} %>
    				</td>
    			</tr>
    			<tr>
    				<td><a href="#">새 멤버 초대</a></td>
    			</tr>
    			<tr>
    				<td><a href="#">채팅방 삭제</a></td>
    			</tr>
    		</tbody>
    	</table>	
    </section>
	<jsp:include page="footer.jsp"/>
</body>
</html>