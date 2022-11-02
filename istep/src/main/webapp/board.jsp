<%@page import="java.util.ArrayList"%>
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
<body>
	<jsp:include page="header.jsp"/>
    <section>
        보드 페이지
    </section>
    <% 
    BoardDao dao = BoardDao.getInstance(); 
    ArrayList<BoardDto> list = dao.getBoardAll();
    %>
    <table border="1">
    	<thead>
    		<tr>
    			<th>번호</th>
    			<th>제목</th>
    			<th>게시일</th>
    			<th>해결여부</th>
    		</tr>
    	</thead>
    	<tbody>
    	<%for(BoardDto board : list) {%>
    		<tr>
    			<td><%=board.getNo() %></td>
    			<td><%=board.getTitle() %></td>
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