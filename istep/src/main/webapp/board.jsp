
<%@page import="lecture.LectureDto"%>
<%@page import="lecture.LectureDao"%>
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

</head>

<body>
    <% 
    String sbjParam = request.getParameter("code");
    int code = Integer.parseInt(sbjParam);
    BoardDao dao = BoardDao.getInstance(); 
    ArrayList<BoardDto> list = dao.getBoard_sbjAll(code);

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
    		<%if(board.getSbj_code()==code){  //각 개시판에서 코드를 받아야 반복문이 실행될 수 있도록%>
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
    <input type="hidden" name="code" value=<%=sbjParam %>>
    <button onclick="location.href='boardWriteForm.jsp?code=<%=code%>'">글쓰기</button>
    </div>
	</div>
    

</body>

</html>