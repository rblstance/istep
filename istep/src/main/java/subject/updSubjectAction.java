package subject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updSubjectAction
 */
//@WebServlet("/updSubjectAction")
public class updSubjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updSubjectAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
			int code = Integer.parseInt(request.getParameter("code"));
			String name = request.getParameter("subject");
			String teacher = request.getParameter("teacher");
			String explain = request.getParameter("explain");
			String kind = request.getParameter("kind");
			
			SubjectDto subject = new SubjectDto(code, name, teacher, explain, kind);
			SubjectDao dao = SubjectDao.getInstance();
			dao.updSubject(subject);
			
			response.sendRedirect("subjectM.jsp");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
