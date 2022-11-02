
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
        
    </section>
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
    		<input type="text" value="<%=board.getTitle() %>" readonly >
    		<textarea rows="20" readonly><%=board.getContent() %></textarea>
    	    <input type="button" onclick="location.href='board.jsp'" value="글목록">
            <input type="button" onclick="location.href='boardUpdateForm.jsp?no=<%=board.getNo() %>'" value="글수정">
    		
    	</form>
    </div>
    
	<jsp:include page="footer.jsp"/>
</body>
</body>
</html>