
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
 
    		<tr>
    			<td>번호</td>
    			<td>제목</td>
    			<td>게시일</td>
    			<td>o/x</td>
    		</tr>

    	</tbody>
    </table>
    
	<jsp:include page="footer.jsp"/>
</body>
</body>
</html>