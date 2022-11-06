package registrations;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class registrationAction
 */
@WebServlet("/registrationAction")
public class registAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("log");
		int sbjCode = Integer.parseInt(request.getParameter("sbj_code"));
		
		if(id==null) {
			out.print("<script>alert('로그인이 필요한 서비스입니다.');location.href='loginForm';</script>");
		}else{
			RegistrationsDao registDao = RegistrationsDao.getInstance();
			if(registDao.duplCheckBySbjCode(sbjCode, id)) {
				out.print("<script>alert('이미 신청한 과목입니다.');location.href='index';</script>");
			}else {
				registDao.addRegistrations(id, sbjCode);
				out.print("<script>alert('신청이 완료 되었습니다.');location.href='index';</script>");
			}
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
