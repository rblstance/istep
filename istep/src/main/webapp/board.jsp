
<%@page import="user.UserDto"%>
<%@page import="user.UserDao"%>
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
<link rel="stylesheet" href="resources/board.css">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="header.jsp"/>
    <section>
        보드 페이지
   
    <% 
    BoardDao dao = BoardDao.getInstance(); 
    ArrayList<BoardDto> list = dao.getBoardAll();
    // ArrayList<BoardDto> list = dao.getBoard_sbjAll(int code) 를 사용해서  코드 값에 개시물만 가져 올 수 있지만 sbj_code를 가져올 
    // 방법을 잘 모르겠음
    %>
    <div class="table_board">
    <table border="1" width="800" height="100">
    	<thead>
    		<tr>
    			<th width="50">번호</th>
    			<th width="400">제목</th>
    			<th width="100">작성자</th>
    			<th width="200">게시일</th>
    			<th width="50">해결여부</th>
    		</tr>
    	</thead>
    	<tbody>
    	
    	<%for(BoardDto board : list) {%>
    		<tr>
    		<%if(board.getSbj_code()==0){  //각 개시판에서 코드를 받아야 반복문이 실행될 수 있도록%>
    			<td><%=board.getNo() %></td>
    			<td><a href="boardView.jsp?no=<%=board.getNo()%>"><%=board.getTitle() %></a></td>
    			<td><%=dao.getNickBoard(board.getUser_id()) %></td>
    			<td><%=board.getRegdate() %></td>
    			<td><%=board.getCheck() %></td>
    		</tr>
    		<%} %>
    	<%} %>

    	</tbody>
    </table>
    <div>
    <button onclick="location.href='boardWriteForm.jsp'">글쓰기</button>
    </div>
 	</section>
    
	<jsp:include page="footer.jsp"/>
</body>

</html>