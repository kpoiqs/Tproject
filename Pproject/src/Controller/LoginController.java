package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBO.CDAO;
import DBO.CDAOIMPL;
import Model.C;

@WebServlet(name="LoginController" , urlPatterns={"/login" , "/login_input" , "/logout"})
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		if(action.equals("login_input")) {
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("login")){
			req.setCharacterEncoding("utf-8");
			
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			CDAO dao = new CDAOIMPL();
			C c = dao.selectById(id, password);
			
				if(c != null) {
					HttpSession session = req.getSession();
					session.setAttribute("c", c);
					RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
					rd.forward(req, resp);
				}
				else{
					req.setAttribute("message", "discord");
					RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
					rd.forward(req, resp);
				}
		}
		else if(action.equals("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("c");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}
	}

}
