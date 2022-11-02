
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
<%@page import="util.DBManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<jsp:include page="header.jsp"/>
    <section>
        보드 페이지
    </section>
    <% 
    BoardDao dao = BoardDao.getInstance(); 
    ArrayList<BoardDto> list = dao.getBoardAll();
    %>
    <table border="1" width="700" height="100">
    	<thead>
    		<tr>
    			<th width="50">번호</th>
    			<th width="400">제목</th>
    			<th width="200">게시일</th>
    			<th width="50">해결여dd부</th>
    		</tr>
    	</thead>
    	<tbody>
    	<%for(BoardDto board : list) {%>
    		<tr>
    			<td><%=board.getNo() %></td>
    			<td><a href="boardView.jsp?no=<%=board.getNo()%>"><%=board.getTitle() %></a></td>
    			<td><%=board.getRegdate() %></td>
    			<td><%=board.getCheck() %></td>
    		</tr>
    	<%} %>

    	</tbody>
    </table>
    
	<jsp:include page="footer.jsp"/>
</body>
</body>
</html>