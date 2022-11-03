
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
    BoardDao dao = BoardDao.getInstance();
    BoardDto board = null;

    
    request.setCharacterEncoding("utf-8");
    if(request.getParameter("no")!=null){
    	int no = Integer.parseInt(request.getParameter("no"));
    	board = dao.getBoardByNo(no);
    }

    %>
    
    <div>
    	<form>
    		<div><input type="text" value="<%=board.getTitle() %>" readonly ></div>
    		<div><textarea rows="20" readonly><%=board.getContent() %></textarea></div>
    	    <input type="button" onclick="location.href='board.jsp'" value="글목록">
            <input type="button" onclick="location.href='boardUpdateForm.jsp?no=<%=board.getNo() %>'" value="글수정">
    	</form>
    	<form method="post" action="BoardDelete">
    		<input type="hidden" name="no" value="<%=board.getNo() %>">
            <input type="submit" value="글삭제">
    	</form>
    		
    </div>
    
    </section>
    
	<jsp:include page="footer.jsp"/>
</body>
</body>
</html>