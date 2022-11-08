package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDao;

/**
 * Servlet implementation class AccessAction
 */
@WebServlet("/AccessAction")
public class AccessAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String page = request.getParameter("page");
		String id = (String)session.getAttribute("log");
		
		UserDao dao = UserDao.getInstance();
		String grade = dao.getGrade(id);
		
		if(page.equals("mypage")) {
			if(id==null)
				out.print("<script>alert('로그인이 필요한 서비스 입니다.');location.href='loginForm';</script>");
			else
				response.sendRedirect("mypage");
		}else if(page.equals("subject")) {
			if(id==null)
				out.print("<script>alert('로그인이 필요한 서비스 입니다.');location.href='loginForm';</script>");
			else
				response.sendRedirect("subject");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
