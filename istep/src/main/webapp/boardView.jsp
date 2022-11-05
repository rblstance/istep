
<%@page import="java.util.ArrayList"%>
<%@page import="answer.AnswerDto"%>
<%@page import="answer.AnswerDao"%>
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
        
    <%
    String id = (String) session.getAttribute("log");
    
    BoardDao dao = BoardDao.getInstance();
    BoardDto board = null;
    AnswerDao ans = AnswerDao.getInstance();
    ArrayList<AnswerDto> aboard = null;
    String sbjParam = request.getParameter("code");
    
    
    request.setCharacterEncoding("utf-8");
    if(request.getParameter("no")!=null){
    	int no = Integer.parseInt(request.getParameter("no"));
    	System.out.println("no : " + no);
    	board = dao.getBoardByNo(no);
    	aboard = ans.getViewAnswerAll(no);
    }

    %>
    
    <div>
    	<form>
    		<div><input type="text" value="<%=board.getTitle() %>" readonly ></div>
    		<div><textarea rows="20" readonly><%=board.getContent() %></textarea></div>
    	    <input type="button" onclick="location.href='lecture.jsp?code=<%=board.getSbj_code() %>'" value="글목록">
    	    <%if(board.getUser_id().equals(id)) {%>
            <input type="button" onclick="location.href='boardUpdateForm.jsp?no=<%=board.getNo() %>'" value="글수정">
            <%} %>
    	</form>
    	<%if(board.getUser_id().equals(id)) {%>
    	<form method="post" action="BoardDelete">
    		<input type="hidden" name="no" value="<%=board.getNo() %>">
    		<input type="hidden" name="sbj_code" value=<%=board.getSbj_code() %>>
    		
            <input type="submit" value="글삭제">
    	</form>
    	<%} %>
    </div>
    <div>
    	<table>
    	<%for(AnswerDto answer : aboard){ %>
    	<tr>
    		<%if(answer.getB_num()==board.getNo()){ %>
    			<td><input type="text" value="<%=answer.getContent()%>" readonly></td>
    			<td><input type="text" value="<%=dao.getNickBoard(answer.getUser_id()) %>" readonly></td>
    			<td><input type="text" value="<%=answer.getRegdate() %>" readonly></td>
    			
    			<%if(answer.getUser_id().equals(id)) {%>
    			<td><form method="post" action="AnswerDeleteAction">
    			<input type="hidden" name="sbj_code" value=<%=board.getSbj_code() %>>
    			<input type="hidden" name="no" value=<%=board.getNo()%>>
    			<input type="hidden" name="noAns" value=<%=answer.getCode()%>>
    			<td><input type="submit" value="삭제"></td>
    			<%} %>
    			</form></td>
    			<!-- if문 이용해서 받은 id값이 작성한 댓글id 값이랑 같을때 수정 삭제 버튼 나오게 만들 예정 -->
    		<%} %>
    		 
    	</tr>
    	<%} %>
    	</table>
    	<form  method="post" action="AnswerWrite">
    		<input type="hidden" name="id" value="<%=id %>">
    		<input type="hidden" name="no" value="<%=board.getNo() %>">
    		<!-- 로그인된 아이디 정보를 받아서 댓글을 달면 닉네임이 출력될 수 있도록 -->
    	    <tr>
    		<td><input type="text" name="content" required></td>
    		<td><input type="submit" value="작성"></td>
    		</tr>
    	</form>
    	
    </div>
    
    </section>
    
	<jsp:include page="footer.jsp"/>
</body>
</body>
</html>