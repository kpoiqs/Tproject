package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBO.QnaDAO;
import DBO.QnaDAOImpl;
import Model.Qna;

@WebServlet(name="QController", urlPatterns= {"/q_input","/q_save","/q_list"})
public class QController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		
		int lastIndex = uri.lastIndexOf("/");//마지막에 있는 위치의 값
		String action = uri.substring(lastIndex+1);//
		
		if(action.equals("q_input")) {
			RequestDispatcher rd = req.getRequestDispatcher("/q_form.jsp");
			rd.forward(req, resp);
		}else if(action.equals("q_save")) {
			
			QnaDAO dao = new QnaDAOImpl();
			Qna qna = new Qna();
			
			qna.setSubject(req.getParameter("subject"));
			qna.setContent(req.getParameter("content"));
			qna.setWriter(req.getParameter("writer"));
					
			boolean result = dao.insert(qna);
			System.out.println(result);
			
			resp.sendRedirect("q_list");;
		}else if(action.equals("q_list")) {
			
			QnaDAO dao = new QnaDAOImpl();
			List<Qna> qList = dao.selectall();
			req.setAttribute("q", qList);
			
			RequestDispatcher rd = req.getRequestDispatcher("/q_list.jsp");//출력할 페이지로 이동
			rd.forward(req, resp);
			
		}
	}
}
