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
    	<form method="post" action="BoardUpdate">
    		<input type="hidden" name="no" value="<%=board.getNo() %>">
    		<div><input type="text" name="title" value="<%=board.getTitle() %>"></div>
    		<div><textarea name="content" rows="20"><%=board.getContent() %></textarea></div>
    	    <input type="button" onclick="location.href='board.jsp'" value="글목록">
            <input type="submit"  value="수정완료" >
    		
    	</form>
    </div>
    
    </section>
    
    
	<jsp:include page="footer.jsp"/>
</body>
</html>