package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUpAction
 */
//@WebServlet("/signUpAction")
public class signUpAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /** 
     * @see HttpServlet#HttpServlet()
     */
    public signUpAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		UserDao dao = UserDao.getInstance();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String grade = request.getParameter("grade");
		Timestamp regdate = now;
		
		if(id != "" && password != "" && name != "" && phone != "" && email != "" && grade != "" && nickname != "") {
			UserDto user = new UserDto(id, password, name, nickname, phone, birth, email, grade, regdate);
			dao.createUser(user);
			out.println("<script>alert('회원가입이 완료되었습니다.');location.href='index';</script>");
		}else {
			out.println("<script>alert('회원가입이 실패했습니다.');location.href='signUpForm';</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
