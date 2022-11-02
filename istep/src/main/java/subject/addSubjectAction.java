package subject;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/addSubjectAction")
public class addSubjectAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addSubjectAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("subject");
		String teacher = request.getParameter("teacher");
		String explain = request.getParameter("explain");
		String kind = request.getParameter("kind");
		
		if(name!=null && teacher!=null && explain!=null && kind!=null) {
			SubjectDao dao = SubjectDao.getInstance();
			dao.addSubject(name, teacher, explain, kind);
			response.sendRedirect("subjectM.jsp");
		}else {
			response.sendRedirect("addSubject.jsp");			
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
